import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:pencatatan_keuangan/app/router.dart';
import 'package:pencatatan_keuangan/presentation/onboarding/onboarding_banner.dart';
import 'package:pencatatan_keuangan/shared/shared.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final onboardingState = ref.watch(onboardingControllerProvider);
    final onboardingNotifier = ref.read(onboardingControllerProvider.notifier);
    final padding = ResponsiveBreakpoints.pagePadding(context);

    void completeOnboarding() {
      onboardingNotifier.completeOnboarding();
    }

    final hasOnboardingContent = onboardingState.isLoading ||
        onboardingState.hasError ||
        (onboardingState.value ?? false);

    Widget onboardingWidget = const SizedBox.shrink();
    if (onboardingState.isLoading) {
      onboardingWidget = const _OnboardingLoadingCard();
    } else if (onboardingState.hasError) {
      onboardingWidget = OnboardingBanner(
        key: const Key('onboarding-banner'),
        title: l10n.onboardingTitle,
        description: l10n.onboardingDescription,
        primaryLabel: l10n.onboardingActionPrimary,
        secondaryLabel: l10n.onboardingActionSecondary,
        onPrimaryPressed: completeOnboarding,
        onSecondaryPressed: completeOnboarding,
      );
    } else if (onboardingState.value ?? false) {
      onboardingWidget = OnboardingBanner(
        key: const Key('onboarding-banner'),
        title: l10n.onboardingTitle,
        description: l10n.onboardingDescription,
        primaryLabel: l10n.onboardingActionPrimary,
        secondaryLabel: l10n.onboardingActionSecondary,
        onPrimaryPressed: completeOnboarding,
        onSecondaryPressed: completeOnboarding,
      );
    }

    return SingleChildScrollView(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          onboardingWidget,
          if (hasOnboardingContent) const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.dashboardQuickActionsTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.dashboardQuickActionsDescription,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      FilledButton.icon(
                        icon: const Icon(Icons.add_rounded),
                        onPressed: () => context.go(AppRoute.transactions.path),
                        label: Text(l10n.navTransactions),
                      ),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.bar_chart_rounded),
                        onPressed: () => context.go(AppRoute.reports.path),
                        label: Text(l10n.navReports),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingLoadingCard extends StatelessWidget {
  const _OnboardingLoadingCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.onboardingDescription,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
