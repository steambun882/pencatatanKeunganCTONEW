import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/money_transaction.dart';
import '../domain/entities/transaction_category.dart';
import '../domain/repositories/category_repository.dart';
import '../domain/repositories/transaction_repository.dart';
import 'local/app_database.dart';
import 'repositories/category_repository_impl.dart';
import 'repositories/transaction_repository_impl.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return DriftTransactionRepository(database);
});

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return DriftCategoryRepository(database);
});

final transactionsStreamProvider = StreamProvider<List<MoneyTransaction>>((ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.watchAll();
});

final categoriesStreamProvider = StreamProvider<List<TransactionCategory>>((ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.watchAll();
});
