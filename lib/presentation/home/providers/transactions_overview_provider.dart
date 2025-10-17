import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/providers.dart';
import '../../../domain/domain.dart';

class TransactionsOverview {
  const TransactionsOverview({
    required this.totalIncome,
    required this.totalExpense,
  });

  final int totalIncome;
  final int totalExpense;

  int get balance => totalIncome - totalExpense;
}

final transactionsOverviewProvider =
    Provider<AsyncValue<TransactionsOverview>>((ref) {
  return ref.watch(transactionsStreamProvider).whenData(
    (transactions) {
      final income = transactions
          .where((transaction) => transaction.type.isIncome)
          .fold<int>(0, (previousValue, transaction) => previousValue + transaction.amount);

      final expense = transactions
          .where((transaction) => transaction.type.isExpense)
          .fold<int>(0, (previousValue, transaction) => previousValue + transaction.amount);

      return TransactionsOverview(totalIncome: income, totalExpense: expense);
    },
  );
});
