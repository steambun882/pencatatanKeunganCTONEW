import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pencatatan_keuangan/data/local/app_database.dart';

void main() {
  test('AppDatabase initializes schema version 1 with seed data', () async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(database.close);

    expect(database.schemaVersion, equals(1));

    final categories = await database.categoriesDao.getAll();
    expect(categories, isNotEmpty);
  });
}
