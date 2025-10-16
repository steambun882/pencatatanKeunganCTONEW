import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project/src/bootstrap.dart';
import 'package:project/src/core/database/app_database.dart';
import 'package:project/src/core/database/database_provider.dart';
import 'package:project/src/features/counter/application/counter_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ProviderContainer container;
  late AppDatabase database;

  setUp(() {
    database = AppDatabase.inMemory();
    container = createAppContainer(
      overrides: [
        appDatabaseProvider.overrideWithValue(database),
      ],
      enableLogging: false,
    );
  });

  tearDown(() async {
    await database.close();
    container.dispose();
  });

  test('loads initial counter value', () async {
    final value = await container.read(counterControllerProvider.future);

    expect(value, 0);
  });

  test('increments and persists counter value', () async {
    await container.read(counterControllerProvider.future);

    await container
        .read(counterControllerProvider.notifier)
        .increment();

    final state = container.read(counterControllerProvider);

    expect(state.hasValue, isTrue);
    expect(state.value, 1);

    final persisted = await database.latestCounter();
    expect(persisted?.value, 1);
  });

  test('reset clears the counter history', () async {
    await container.read(counterControllerProvider.future);
    await container
        .read(counterControllerProvider.notifier)
        .increment();

    await container.read(counterControllerProvider.notifier).reset();

    final state = container.read(counterControllerProvider);
    expect(state.value, 0);

    final persisted = await database.latestCounter();
    expect(persisted, isNull);
  });
}
