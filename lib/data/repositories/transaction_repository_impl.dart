import 'package:drift/drift.dart';

import '../../domain/entities/money_transaction.dart';
import '../../domain/entities/transaction_type.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../local/app_database.dart';

class DriftTransactionRepository implements TransactionRepository {
  DriftTransactionRepository(this._db);

  final AppDatabase _db;

  TransactionsDao get _dao => _db.transactionsDao;

  @override
  Stream<List<MoneyTransaction>> watchAll() {
    return _dao.watchAllWithCategory().map(
          (rows) => rows.map(_mapRow).toList(),
        );
  }

  @override
  Future<List<MoneyTransaction>> fetchAll() async {
    final rows = await _dao.getAllWithCategory();
    return rows.map(_mapRow).toList();
  }

  @override
  Future<MoneyTransaction?> findById(String id) async {
    final row = await _dao.findById(id);
    if (row == null) {
      return null;
    }

    return _mapRow(row);
  }

  @override
  Future<void> save(MoneyTransaction transaction) async {
    final updated = transaction.copyWith(updatedAt: DateTime.now());

    final companion = TransactionsCompanion(
      id: Value(updated.id),
      title: Value(updated.title),
      amount: Value(updated.amount),
      kind: Value(_kindFromType(updated.type)),
      categoryId: updated.categoryId != null
          ? Value(updated.categoryId)
          : const Value.absent(),
      occurredOn: Value(updated.occurredOn),
      note: updated.note != null ? Value(updated.note) : const Value.absent(),
      createdAt: Value(updated.createdAt),
      updatedAt: Value(updated.updatedAt),
    );

    await _dao.upsert(companion);
  }

  @override
  Future<void> delete(String id) {
    return _dao.deleteById(id);
  }

  MoneyTransaction _mapRow(TransactionWithCategory row) {
    return MoneyTransaction(
      id: row.transaction.id,
      title: row.transaction.title,
      amount: row.transaction.amount,
      type: _typeFromKind(row.transaction.kind),
      occurredOn: row.transaction.occurredOn,
      categoryId: row.transaction.categoryId,
      note: row.transaction.note,
      createdAt: row.transaction.createdAt,
      updatedAt: row.transaction.updatedAt,
    );
  }

  TransactionType _typeFromKind(int value) {
    if (value < 0 || value >= TransactionType.values.length) {
      return TransactionType.expense;
    }

    return TransactionType.values[value];
  }

  int _kindFromType(TransactionType type) => type.index;
}
