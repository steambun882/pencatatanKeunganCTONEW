import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

@DataClassName('TransactionCategoryRow')
class TransactionCategories extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  IntColumn get color => integer()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('TransactionRow')
class Transactions extends Table {
  TextColumn get id => text()();

  TextColumn get title => text()();

  IntColumn get amount => integer()();

  IntColumn get kind => integer()();

  TextColumn get categoryId => text().nullable().references(
        TransactionCategories,
        #id,
        onDelete: KeyAction.setNull,
      );

  DateTimeColumn get occurredOn => dateTime()();

  TextColumn get note => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DriftDatabase(
  tables: [TransactionCategories, Transactions],
  daos: [TransactionsDao, CategoriesDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(QueryExecutor executor) : super(executor);

  static QueryExecutor _openConnection() {
    return DriftFlutterQueryExecutor.inDatabaseFolder(
      path: 'pencatatan_keuangan.sqlite',
      logStatements: false,
    );
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();

          await batch((batch) {
            batch.insertAll(transactionCategories, [
              TransactionCategoriesCompanion.insert(
                id: 'uncategorized',
                name: 'Tidak Dikategorikan',
                color: 0xFF9E9E9E,
              ),
            ]);
          });
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

class TransactionWithCategory {
  const TransactionWithCategory({
    required this.transaction,
    required this.category,
  });

  final TransactionRow transaction;
  final TransactionCategoryRow? category;
}

@DriftAccessor(tables: [Transactions, TransactionCategories])
class TransactionsDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionsDaoMixin {
  TransactionsDao(AppDatabase db) : super(db);

  Stream<List<TransactionWithCategory>> watchAllWithCategory() {
    final joinQuery = select(transactions).join([
      leftOuterJoin(
        transactionCategories,
        transactionCategories.id.equalsExp(transactions.categoryId),
      ),
    ])
      ..orderBy([
        OrderingTerm.desc(transactions.occurredOn),
        OrderingTerm.desc(transactions.createdAt),
      ]);

    return joinQuery.watch().map(
          (rows) => rows
              .map(
                (row) => TransactionWithCategory(
                  transaction: row.readTable(transactions),
                  category: row.readTableOrNull(transactionCategories),
                ),
              )
              .toList(),
        );
  }

  Future<List<TransactionWithCategory>> getAllWithCategory() async {
    final joinQuery = select(transactions).join([
      leftOuterJoin(
        transactionCategories,
        transactionCategories.id.equalsExp(transactions.categoryId),
      ),
    ])
      ..orderBy([
        OrderingTerm.desc(transactions.occurredOn),
        OrderingTerm.desc(transactions.createdAt),
      ]);

    final rows = await joinQuery.get();
    return rows
        .map(
          (row) => TransactionWithCategory(
            transaction: row.readTable(transactions),
            category: row.readTableOrNull(transactionCategories),
          ),
        )
        .toList();
  }

  Future<TransactionWithCategory?> findById(String id) async {
    final joinQuery = select(transactions).join([
      leftOuterJoin(
        transactionCategories,
        transactionCategories.id.equalsExp(transactions.categoryId),
      ),
    ])
      ..where(transactions.id.equals(id))
      ..limit(1);

    final row = await joinQuery.getSingleOrNull();
    if (row == null) {
      return null;
    }

    return TransactionWithCategory(
      transaction: row.readTable(transactions),
      category: row.readTableOrNull(transactionCategories),
    );
  }

  Future<void> upsert(TransactionsCompanion entity) {
    return into(transactions).insertOnConflictUpdate(entity);
  }

  Future<int> deleteById(String id) {
    return (delete(transactions)..where((tbl) => tbl.id.equals(id))).go();
  }
}

@DriftAccessor(tables: [TransactionCategories])
class CategoriesDao extends DatabaseAccessor<AppDatabase>
    with _$CategoriesDaoMixin {
  CategoriesDao(AppDatabase db) : super(db);

  Stream<List<TransactionCategoryRow>> watchAll() {
    return (select(transactionCategories)
          ..orderBy([
            OrderingTerm.asc(transactionCategories.name),
          ]))
        .watch();
  }

  Future<List<TransactionCategoryRow>> getAll() {
    return (select(transactionCategories)
          ..orderBy([
            OrderingTerm.asc(transactionCategories.name),
          ]))
        .get();
  }

  Future<TransactionCategoryRow?> findById(String id) {
    return (select(transactionCategories)
          ..where(transactionCategories.id.equals(id))
          ..limit(1))
        .getSingleOrNull();
  }

  Future<void> upsert(TransactionCategoriesCompanion entity) {
    return into(transactionCategories).insertOnConflictUpdate(entity);
  }

  Future<int> deleteById(String id) {
    return (delete(transactionCategories)..where((tbl) => tbl.id.equals(id))).go();
  }
}
