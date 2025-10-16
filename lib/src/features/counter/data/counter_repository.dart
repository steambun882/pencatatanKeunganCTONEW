import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';

final counterRepositoryProvider = Provider<CounterRepository>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return CounterRepository(database);
});

class CounterRepository {
  CounterRepository(this._database);

  final AppDatabase _database;

  Future<int> fetch() async {
    final latest = await _database.latestCounter();
    return latest?.value ?? 0;
  }

  Future<int> increment() async {
    final nextValue = (await fetch()) + 1;
    await _database.saveCounter(nextValue);
    return nextValue;
  }

  Future<void> reset() async {
    await _database.clearCounters();
  }
}
