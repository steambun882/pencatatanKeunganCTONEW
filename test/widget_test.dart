import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pencatatan_keuangan/app/app.dart';

void main() {
  testWidgets(
    'menampilkan navigasi dasar dan konten onboarding dalam bahasa Indonesia',
    (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: PencatatanKeuanganApp()),
      );

      await tester.pumpAndSettle();

      expect(find.text('Dasbor'), findsWidgets);
      expect(find.byKey(const Key('onboarding-banner')), findsOneWidget);
    },
  );

  testWidgets('mengizinkan penggantian mode tema melalui halaman pengaturan', (
    tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: PencatatanKeuanganApp()),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.text('Pengaturan').first);
    await tester.pumpAndSettle();

    final segmentedFinder =
        find.byKey(const Key('settings_theme_mode_segmented'));
    expect(segmentedFinder, findsOneWidget);

    var segmented = tester.widget<SegmentedButton<ThemeMode>>(segmentedFinder);
    expect(segmented.selected, equals(<ThemeMode>{ThemeMode.system}));

    await tester.tap(find.text('Gelap'));
    await tester.pumpAndSettle();

    segmented = tester.widget<SegmentedButton<ThemeMode>>(segmentedFinder);
    expect(segmented.selected, equals(<ThemeMode>{ThemeMode.dark}));
  });
}
