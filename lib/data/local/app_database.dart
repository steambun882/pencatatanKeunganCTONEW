import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:drift/native.dart' as native;

part 'app_database.g.dart';

/// Common columns shared across all sync-tracked tables.
abstract class SyncTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get remoteId => text().nullable()();

  DateTimeColumn get createdAt => dateTime()
      .withDefault(currentDateAndTime)
      .clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt => dateTime()
      .withDefault(currentDateAndTime)
      .clientDefault(() => DateTime.now())();

  DateTimeColumn get deletedAt => dateTime().nullable()();
}

@DataClassName('AccountEntity')
class Accounts extends SyncTable {
  TextColumn get name => text()();

  TextColumn get type => text()();

  IntColumn get balance => integer()();

  TextColumn get currency => text().withLength(min: 3, max: 12)();
}

@DataClassName('CategoryEntity')
class Categories extends SyncTable {
  TextColumn get name => text()();

  TextColumn get colorHex => text().withLength(min: 4, max: 9)();

  IntColumn get parentId => integer()
      .nullable()
      .references(Categories, #id, onDelete: KeyAction.setNull)();
}

@DataClassName('TransactionEntity')
class Transactions extends SyncTable {
  IntColumn get accountId => integer()
      .references(Accounts, #id, onDelete: KeyAction.cascade)();

  IntColumn get categoryId => integer()
      .nullable()
      .references(Categories, #id, onDelete: KeyAction.setNull)();

  IntColumn get amount => integer()();

  DateTimeColumn get occurredAt => dateTime()();

  TextColumn get note => text().nullable()();
}

@DataClassName('TransferEntity')
class Transfers extends SyncTable {
  IntColumn get fromAccountId => integer()
      .references(Accounts, #id, onDelete: KeyAction.cascade)();

  IntColumn get toAccountId => integer()
      .references(Accounts, #id, onDelete: KeyAction.cascade)();

  IntColumn get amount => integer()();

  DateTimeColumn get occurredAt => dateTime()();

  TextColumn get memo => text().nullable()();
}

@DataClassName('AttachmentEntity')
class Attachments extends SyncTable {
  IntColumn get transactionId => integer()
      .references(Transactions, #id, onDelete: KeyAction.cascade)();

  TextColumn get fileName => text()();

  TextColumn get filePath => text()();

  TextColumn get mimeType => text()();

  IntColumn get sizeBytes => integer()();
}

@DataClassName('SyncMetadataEntity')
class SyncMetadataEntries extends SyncTable {
  TextColumn get entityType => text().unique()();

  DateTimeColumn get lastSyncedAt => dateTime().nullable()();

  TextColumn get lastSyncCursor => text().nullable()();
}

@DriftDatabase(
  tables: [
    Accounts,
    Categories,
    Transactions,
    Transfers,
    Attachments,
    SyncMetadataEntries,
  ],
  daos: [
    AccountDao,
    CategoryDao,
    TransactionDao,
    TransferDao,
    AttachmentDao,
    SyncMetadataDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(QueryExecutor executor) : super(executor);

  factory AppDatabase.inMemory() => AppDatabase.forTesting(native.NativeDatabase.memory());

  static QueryExecutor _openConnection() {
    return FlutterQueryExecutor.inDatabaseFolder(
      path: 'pencatatan_keuangan.db',
      logStatements: false,
    );
  }

  @override
  int get schemaVersion => 1;

  Future<void> clearAllTables() async {
    await batch((batch) {
      batch.deleteAll(accounts);
      batch.deleteAll(categories);
      batch.deleteAll(transactions);
      batch.deleteAll(transfers);
      batch.deleteAll(attachments);
      batch.deleteAll(syncMetadataEntries);
    });
  }
}


@DriftAccessor(tables: [Accounts])
class AccountDao extends DatabaseAccessor<AppDatabase> with _$AccountDaoMixin {
  AccountDao(AppDatabase db) : super(db);

  Future<int> create(AccountCompanion companion) {
    return into(accounts).insert(companion);
  }

  Future<AccountEntity?> findById(int id) {
    return (select(accounts)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<List<AccountEntity>> getActive() {
    return (select(accounts)..where((tbl) => tbl.deletedAt.isNull())).get();
  }

  Stream<List<AccountEntity>> watchActive() {
    return (select(accounts)..where((tbl) => tbl.deletedAt.isNull())).watch();
  }

  Future<void> updateAccount(int id, AccountCompanion companion) {
    final now = DateTime.now();
    return (update(accounts)..where((tbl) => tbl.id.equals(id))).write(
      companion.copyWith(updatedAt: Value(now)),
    );
  }

  Future<void> softDelete(int id) {
    final now = DateTime.now();
    return (update(accounts)..where((tbl) => tbl.id.equals(id))).write(
      AccountCompanion(
        updatedAt: Value(now),
        deletedAt: Value(now),
      ),
    );
  }

  Future<List<AccountEntity>> getChangesSince(DateTime since) {
    return (select(accounts)..where((tbl) => tbl.updatedAt.isBiggerOrEqualValue(since))).get();
  }
}

@DriftAccessor(tables: [Categories])
class CategoryDao extends DatabaseAccessor<AppDatabase> with _$CategoryDaoMixin {
  CategoryDao(AppDatabase db) : super(db);

  Future<int> create(CategoryCompanion companion) {
    return into(categories).insert(companion);
  }

  Future<List<CategoryEntity>> getActive() {
    return (select(categories)..where((tbl) => tbl.deletedAt.isNull())).get();
  }

  Stream<List<CategoryEntity>> watchActive() {
    return (select(categories)..where((tbl) => tbl.deletedAt.isNull())).watch();
  }

  Future<void> updateCategory(int id, CategoryCompanion companion) {
    final now = DateTime.now();
    return (update(categories)..where((tbl) => tbl.id.equals(id))).write(
      companion.copyWith(updatedAt: Value(now)),
    );
  }

  Future<void> softDelete(int id) {
    final now = DateTime.now();
    return (update(categories)..where((tbl) => tbl.id.equals(id))).write(
      CategoryCompanion(
        updatedAt: Value(now),
        deletedAt: Value(now),
      ),
    );
  }

  Future<List<CategoryEntity>> getChangesSince(DateTime since) {
    return (select(categories)..where((tbl) => tbl.updatedAt.isBiggerOrEqualValue(since))).get();
  }
}

@DriftAccessor(tables: [Transactions])
class TransactionDao extends DatabaseAccessor<AppDatabase> with _$TransactionDaoMixin {
  TransactionDao(AppDatabase db) : super(db);

  Future<int> create(TransactionCompanion companion) {
    return into(transactions).insert(companion);
  }

  Future<TransactionEntity?> findById(int id) {
    return (select(transactions)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<List<TransactionEntity>> getActiveByAccount(int accountId) {
    return (select(transactions)
          ..where((tbl) => tbl.accountId.equals(accountId) & tbl.deletedAt.isNull())
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.occurredAt)]))
        .get();
  }

  Future<void> updateTransaction(int id, TransactionCompanion companion) {
    final now = DateTime.now();
    return (update(transactions)..where((tbl) => tbl.id.equals(id))).write(
      companion.copyWith(updatedAt: Value(now)),
    );
  }

  Future<void> softDelete(int id) {
    final now = DateTime.now();
    return (update(transactions)..where((tbl) => tbl.id.equals(id))).write(
      TransactionCompanion(
        updatedAt: Value(now),
        deletedAt: Value(now),
      ),
    );
  }

  Future<List<TransactionEntity>> getChangesSince(DateTime since) {
    return (select(transactions)..where((tbl) => tbl.updatedAt.isBiggerOrEqualValue(since))).get();
  }
}

@DriftAccessor(tables: [Transfers])
class TransferDao extends DatabaseAccessor<AppDatabase> with _$TransferDaoMixin {
  TransferDao(AppDatabase db) : super(db);

  Future<int> create(TransferCompanion companion) {
    return into(transfers).insert(companion);
  }

  Future<List<TransferEntity>> getActiveByAccount(int accountId) {
    return (select(transfers)
          ..where(
            (tbl) => (tbl.fromAccountId.equals(accountId) | tbl.toAccountId.equals(accountId)) &
                tbl.deletedAt.isNull(),
          )
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.occurredAt)]))
        .get();
  }

  Future<void> updateTransfer(int id, TransferCompanion companion) {
    final now = DateTime.now();
    return (update(transfers)..where((tbl) => tbl.id.equals(id))).write(
      companion.copyWith(updatedAt: Value(now)),
    );
  }

  Future<void> softDelete(int id) {
    final now = DateTime.now();
    return (update(transfers)..where((tbl) => tbl.id.equals(id))).write(
      TransferCompanion(
        updatedAt: Value(now),
        deletedAt: Value(now),
      ),
    );
  }

  Future<List<TransferEntity>> getChangesSince(DateTime since) {
    return (select(transfers)..where((tbl) => tbl.updatedAt.isBiggerOrEqualValue(since))).get();
  }
}

@DriftAccessor(tables: [Attachments])
class AttachmentDao extends DatabaseAccessor<AppDatabase> with _$AttachmentDaoMixin {
  AttachmentDao(AppDatabase db) : super(db);

  Future<int> create(AttachmentCompanion companion) {
    return into(attachments).insert(companion);
  }

  Future<List<AttachmentEntity>> getByTransaction(int transactionId) {
    return (select(attachments)
          ..where((tbl) => tbl.transactionId.equals(transactionId) & tbl.deletedAt.isNull()))
        .get();
  }

  Future<void> softDelete(int id) {
    final now = DateTime.now();
    return (update(attachments)..where((tbl) => tbl.id.equals(id))).write(
      AttachmentCompanion(
        updatedAt: Value(now),
        deletedAt: Value(now),
      ),
    );
  }

  Future<List<AttachmentEntity>> getChangesSince(DateTime since) {
    return (select(attachments)..where((tbl) => tbl.updatedAt.isBiggerOrEqualValue(since))).get();
  }
}

@DriftAccessor(tables: [SyncMetadataEntries])
class SyncMetadataDao extends DatabaseAccessor<AppDatabase> with _$SyncMetadataDaoMixin {
  SyncMetadataDao(AppDatabase db) : super(db);

  Future<SyncMetadataEntity?> findByEntityType(String entityType) {
    return (select(syncMetadataEntries)..where((tbl) => tbl.entityType.equals(entityType))).getSingleOrNull();
  }

  Future<int> upsert(SyncMetadataCompanion companion) async {
    final now = DateTime.now();
    final updatedCompanion = companion.copyWith(updatedAt: Value(now));
    return into(syncMetadataEntries).insertOnConflictUpdate(updatedCompanion);
  }

  Future<void> touch(String entityType, {DateTime? syncedAt, String? cursor}) async {
    final now = DateTime.now();
    final existing = await findByEntityType(entityType);
    if (existing == null) {
      await into(syncMetadataEntries).insert(
        SyncMetadataCompanion.insert(
          entityType: entityType,
          lastSyncedAt: Value(syncedAt ?? now),
          lastSyncCursor: Value(cursor),
          createdAt: Value(now),
          updatedAt: Value(now),
        ),
      );
    } else {
      await (update(syncMetadataEntries)
            ..where((tbl) => tbl.entityType.equals(entityType)))
          .write(
        SyncMetadataCompanion(
          lastSyncedAt: Value(syncedAt ?? now),
          lastSyncCursor: Value(cursor ?? existing.lastSyncCursor),
          updatedAt: Value(now),
        ),
      );
    }
  }

  Future<List<SyncMetadataEntity>> getAll() {
    return select(syncMetadataEntries).get();
  }
}
