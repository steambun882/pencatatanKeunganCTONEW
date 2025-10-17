import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:pencatatan_keuangan/app/router.dart';
import 'package:pencatatan_keuangan/shared/shared.dart';

class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final destinations = <_Destination>[
      _Destination(
        route: AppRoute.dashboard,
        label: l10n.navDashboard,
        icon: Icons.space_dashboard_outlined,
        selectedIcon: Icons.space_dashboard_rounded,
      ),
      _Destination(
        route: AppRoute.transactions,
        label: l10n.navTransactions,
        icon: Icons.receipt_long_outlined,
        selectedIcon: Icons.receipt_long,
      ),
      _Destination(
        route: AppRoute.reports,
        label: l10n.navReports,
        icon: Icons.bar_chart_outlined,
        selectedIcon: Icons.bar_chart,
      ),
      _Destination(
        route: AppRoute.settings,
        label: l10n.navSettings,
        icon: Icons.tune_outlined,
        selectedIcon: Icons.tune,
      ),
    ];
    final isCompact = ResponsiveBreakpoints.isCompact(context);
    final currentDestination = destinations[navigationShell.currentIndex];

    final navigationRail = NavigationRail(
      selectedIndex: navigationShell.currentIndex,
      labelType: NavigationRailLabelType.all,
      onDestinationSelected: _onDestinationSelected,
      destinations: destinations
          .map(
            (item) => NavigationRailDestination(
              icon: Icon(item.icon),
              selectedIcon: Icon(item.selectedIcon),
              label: Text(item.label),
            ),
          )
          .toList(growable: false),
    );

    final navigationBar = NavigationBar(
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: _onDestinationSelected,
      destinations: destinations
          .map(
            (item) => NavigationDestination(
              key: ValueKey<String>('nav-${item.route.name}'),
              icon: Icon(item.icon),
              selectedIcon: Icon(item.selectedIcon),
              label: item.label,
            ),
          )
          .toList(growable: false),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(currentDestination.label),
      ),
      body: Row(
        children: [
          if (!isCompact) navigationRail,
          Expanded(
            child: SafeArea(
              child: navigationShell,
            ),
          ),
        ],
      ),
      bottomNavigationBar: isCompact ? navigationBar : null,
    );
  }
}

class _Destination {
  const _Destination({
    required this.route,
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final AppRoute route;
  final String label;
  final IconData icon;
  final IconData selectedIcon;
}
