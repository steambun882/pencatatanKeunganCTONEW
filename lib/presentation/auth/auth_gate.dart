import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pencatatan_keuangan/domain/domain.dart';
import 'package:pencatatan_keuangan/presentation/home/home_page.dart';

import 'auth_controller.dart';
import 'onboarding_page.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user != null) {
          return const HomePage();
        }
        return const OnboardingPage();
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => _AuthErrorView(error: error),
    );
  }
}

class _AuthErrorView extends ConsumerWidget {
  const _AuthErrorView({required this.error});

  final Object error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = error is AuthException
        ? error.message
        : 'We were unable to determine your authentication status.';

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48),
              const SizedBox(height: 16),
              Text(
                message,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  ref.invalidate(authStateProvider);
                },
                child: const Text('Try again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
