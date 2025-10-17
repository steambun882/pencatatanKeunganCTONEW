import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pencatatan_keuangan/core/core.dart';
import 'package:pencatatan_keuangan/presentation/presentation.dart';

class PencatatanKeuanganApp extends ConsumerWidget {
  const PencatatanKeuanganApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final environment = ref.watch(appEnvironmentProvider);

    return MaterialApp(
      title:
          environment.isProd ? 'Pencatatan Keuangan' : 'Pencatatan Keuangan (Dev)',
      debugShowCheckedModeBanner: environment.isDev,
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
