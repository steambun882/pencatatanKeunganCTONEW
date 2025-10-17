import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/shared.dart';
import 'providers/transactions_overview_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overview = ref.watch(transactionsOverviewProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Pencatatan Keuangan')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Card(
            elevation: 0,
            color: colorScheme.surfaceContainerHigh,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.pie_chart_rounded,
                    size: 64,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Kelola keuangan Anda dengan mudah',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Mulai catat pemasukan dan pengeluaran harian untuk melihat tren dan membuat keputusan yang lebih baik.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  overview.when(
                    data: (value) {
                      final hasTransactions =
                          value.totalIncome != 0 || value.totalExpense != 0;

                      if (!hasTransactions) {
                        return const Column(
                          children: [
                            Text(
                              'Belum ada transaksi yang tercatat. Tambahkan transaksi pertama Anda untuk melihat ringkasan di sini.',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 24),
                          ],
                        );
                      }

                      return _TransactionsSummary(overview: value);
                    },
                    error: (_, __) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Ringkasan transaksi tidak dapat dimuat.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    loading: () => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle_outline),
                    label: const Text('Tambah transaksi pertama'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TransactionsSummary extends StatelessWidget {
  const _TransactionsSummary({required this.overview});

  final TransactionsOverview overview;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        _SummaryTile(
          label: 'Total pemasukan',
          value: formatRupiah(overview.totalIncome),
          textStyle: textTheme.bodyLarge,
        ),
        const SizedBox(height: 8),
        _SummaryTile(
          label: 'Total pengeluaran',
          value: formatRupiah(overview.totalExpense),
          textStyle: textTheme.bodyLarge,
        ),
        const Divider(height: 32),
        _SummaryTile(
          label: 'Saldo sementara',
          value: formatRupiah(overview.balance),
          textStyle: textTheme.titleMedium,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _SummaryTile extends StatelessWidget {
  const _SummaryTile({
    required this.label,
    required this.value,
    required this.textStyle,
  });

  final String label;
  final String value;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            label,
            style: textStyle,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          value,
          style: textStyle?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
