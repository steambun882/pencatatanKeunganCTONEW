import 'package:drift/drift.dart';

import '../local/app_database.dart';

class TransferRepository {
  TransferRepository(AppDatabase database) : _dao = TransferDao(database);

  final TransferDao _dao;

  Future<int> createTransfer({
    String? remoteId,
    required int fromAccountId,
    required int toAccountId,
    required int amount,
    required DateTime occurredAt,
    String? memo,
  }) {
    return _dao.create(
      TransferCompanion.insert(
        remoteId: Value(remoteId),
        fromAccountId: fromAccountId,
        toAccountId: toAccountId,
        amount: amount,
        occurredAt: occurredAt,
        memo: Value(memo),
      ),
    );
  }

  Future<void> updateTransfer(
    int id, {
    String? remoteId,
    int? fromAccountId,
    int? toAccountId,
    int? amount,
    DateTime? occurredAt,
    String? memo,
  }) {
    return _dao.updateTransfer(
      id,
      TransferCompanion(
        remoteId: remoteId != null ? Value(remoteId) : const Value.absent(),
        fromAccountId: fromAccountId != null ? Value(fromAccountId) : const Value.absent(),
        toAccountId: toAccountId != null ? Value(toAccountId) : const Value.absent(),
        amount: amount != null ? Value(amount) : const Value.absent(),
        occurredAt: occurredAt != null ? Value(occurredAt) : const Value.absent(),
        memo: memo != null ? Value(memo) : const Value.absent(),
      ),
    );
  }

  Future<void> softDeleteTransfer(int id) => _dao.softDelete(id);

  Future<List<TransferEntity>> getTransfersForAccount(int accountId) =>
      _dao.getActiveByAccount(accountId);

  Future<List<TransferEntity>> getChangedTransfers(DateTime since) =>
      _dao.getChangesSince(since);
}
