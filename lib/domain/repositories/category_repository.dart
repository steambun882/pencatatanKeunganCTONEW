import '../entities/transaction_category.dart';

abstract class CategoryRepository {
  Stream<List<TransactionCategory>> watchAll();

  Future<List<TransactionCategory>> fetchAll();

  Future<TransactionCategory?> findById(String id);

  Future<void> save(TransactionCategory category);

  Future<void> delete(String id);
}
