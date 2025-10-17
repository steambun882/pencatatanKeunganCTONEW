import 'package:drift/drift.dart';

import '../local/app_database.dart';

class AccountRepository {
  AccountRepository(AppDatabase database) : _dao = AccountDao(database);

  final AccountDao _dao;

  Future<AccountEntity?> getAccount(int id) => _dao.findById(id);

  Future<int> createAccount({
    String? remoteId,
    required String name,
    required String type,
    required int balance,
    required String currency,
  }) async {
    final id = await _dao.create(
      AccountCompanion.insert(
        remoteId: Value(remoteId),
        name: name,
        type: type,
        balance: balance,
        currency: currency,
      ),
    );
    return id;
  }

  Future<void> updateAccount(
    int id, {
    String? remoteId,
    String? name,
    String? type,
    int? balance,
    String? currency,
  }) {
    return _dao.updateAccount(
      id,
      AccountCompanion(
        remoteId: remoteId != null ? Value(remoteId) : const Value<String?>.absent(),
        name: name != null ? Value(name) : const Value<String>.absent(),
        type: type != null ? Value(type) : const Value<String>.absent(),
        balance: balance != null ? Value(balance) : const Value<int>.absent(),
        currency: currency != null ? Value(currency) : const Value<String>.absent(),
      ),
    );
  }

  Future<void> softDeleteAccount(int id) => _dao.softDelete(id);

  Stream<List<AccountEntity>> watchActiveAccounts() => _dao.watchActive();

  Future<List<AccountEntity>> getActiveAccounts() => _dao.getActive();

  Future<List<AccountEntity>> getChangedAccounts(DateTime since) => _dao.getChangesSince(since);
}
