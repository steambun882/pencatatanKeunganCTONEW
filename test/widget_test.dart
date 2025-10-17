import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pencatatan_keuangan/app/app.dart';

void main() {
  testWidgets('renders onboarding call to action on the home page', (
    tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: PencatatanKeuanganApp()),
    );

    expect(find.text('Kelola keuangan Anda dengan mudah'), findsOneWidget);
    expect(find.text('Tambah transaksi pertama'), findsOneWidget);
  });
}
