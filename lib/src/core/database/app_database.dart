import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DataClassName('CounterEntry')
class CounterEntries extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get value => integer()();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

LazyDatabase _openConnection() => LazyDatabase(() async {
      final directory = await getApplicationDocumentsDirectory();
      final file = File(p.join(directory.path, 'app.sqlite'));
      return NativeDatabase(file);
    });

@DriftDatabase(tables: [CounterEntries])
class AppDatabase extends _$AppDatabase {
  AppDatabase({QueryExecutor? executor})
      : super(executor ?? _openConnection());

  factory AppDatabase.test(QueryExecutor executor) => AppDatabase(executor: executor);

  factory AppDatabase.inMemory() =>
      AppDatabase(executor: NativeDatabase.memory());

  @override
  int get schemaVersion => 1;

  Future<int> saveCounter(int value) {
    return into(counterEntries).insert(
      CounterEntriesCompanion.insert(value: value),
    );
  }

  Future<CounterEntry?> latestCounter() {
    return (select(counterEntries)
          ..orderBy([(entry) => OrderingTerm.desc(entry.createdAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> clearCounters() => delete(counterEntries).go();
}
