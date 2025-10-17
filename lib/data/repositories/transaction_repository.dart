import 'package:drift/drift.dart';

import '../local/app_database.dart';

class TransactionRepository {
  TransactionRepository(AppDatabase database) : _dao = TransactionDao(database);

  final TransactionDao _dao;

  Future<int> createTransaction({
    String? remoteId,
    required int accountId,
    int? categoryId,
    required int amount,
    required DateTime occurredAt,
    String? note,
  }) {
    return _dao.create(
      TransactionCompanion.insert(
        remoteId: Value(remoteId),
        accountId: accountId,
        categoryId: Value(categoryId),
        amount: amount,
        occurredAt: occurredAt,
        note: Value(note),
      ),
    );
  }

  Future<void> updateTransaction(
    int id, {
    String? remoteId,
    int? accountId,
    int? categoryId,
    int? amount,
    DateTime? occurredAt,
    String? note,
  }) {
    return _dao.updateTransaction(
      id,
      TransactionCompanion(
        remoteId: remoteId != null ? Value(remoteId) : const Value.absent(),
        accountId: accountId != null ? Value(accountId) : const Value.absent(),
        categoryId: categoryId != null ? Value(categoryId) : const Value.absent(),
        amount: amount != null ? Value(amount) : const Value.absent(),
        occurredAt: occurredAt != null ? Value(occurredAt) : const Value.absent(),
        note: note != null ? Value(note) : const Value.absent(),
      ),
    );
  }

  Future<void> softDeleteTransaction(int id) => _dao.softDelete(id);

  Future<TransactionEntity?> getTransaction(int id) => _dao.findById(id);

  Future<List<TransactionEntity>> getAccountTransactions(int accountId) =>
      _dao.getActiveByAccount(accountId);

  Future<List<TransactionEntity>> getChangedTransactions(DateTime since) =>
      _dao.getChangesSince(since);
}
