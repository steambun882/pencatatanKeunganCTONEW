import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:pencatatan_keuangan/presentation/presentation.dart';

enum AppRoute { dashboard, transactions, reports, settings }

extension AppRoutePath on AppRoute {
  String get path => switch (this) {
        AppRoute.dashboard => '/dashboard',
        AppRoute.transactions => '/transaksi',
        AppRoute.reports => '/laporan',
        AppRoute.settings => '/pengaturan',
      };
}

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoute.dashboard.path,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        redirect: (_, __) => AppRoute.dashboard.path,
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => AppShell(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.dashboard.path,
                name: AppRoute.dashboard.name,
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: DashboardPage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.transactions.path,
                name: AppRoute.transactions.name,
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: TransactionsPage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.reports.path,
                name: AppRoute.reports.name,
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: ReportsPage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.settings.path,
                name: AppRoute.settings.name,
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: SettingsPage(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
