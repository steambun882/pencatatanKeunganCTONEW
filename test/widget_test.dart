import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pencatatan_keuangan/app/app.dart';
import 'package:pencatatan_keuangan/presentation/home/providers/transactions_overview_provider.dart';

void main() {
  testWidgets('renders onboarding call to action on the home page', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          transactionsOverviewProvider.overrideWithValue(
            AsyncValue.data(const TransactionsOverview(
              totalIncome: 0,
              totalExpense: 0,
            )),
          ),
        ],
        child: const PencatatanKeuanganApp(),
      ),
    );

    expect(find.text('Kelola keuangan Anda dengan mudah'), findsOneWidget);
    expect(find.text('Tambah transaksi pertama'), findsOneWidget);
  });
}
