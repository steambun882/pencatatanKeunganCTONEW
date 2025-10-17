import '../entities/money_transaction.dart';

abstract class TransactionRepository {
  Stream<List<MoneyTransaction>> watchAll();

  Future<List<MoneyTransaction>> fetchAll();

  Future<MoneyTransaction?> findById(String id);

  Future<void> save(MoneyTransaction transaction);

  Future<void> delete(String id);
}
