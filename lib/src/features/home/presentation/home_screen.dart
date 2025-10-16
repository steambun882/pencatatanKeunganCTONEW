import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../counter/application/counter_controller.dart';
import '../../../l10n/generated/app_localizations.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(counterControllerProvider);
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.appTitle),
      ),
      body: Center(
        child: switch (counterState) {
          AsyncData<int>(:final value) => _CounterContent(value: value),
          AsyncError(:final error) => _CounterError(message: error.toString()),
          _ => _CounterLoading(message: localizations.loadingMessage),
        },
      ),
      floatingActionButton: _CounterActions(
        onIncrement: () => ref
            .read(counterControllerProvider.notifier)
            .increment(),
        onReset: () => ref.read(counterControllerProvider.notifier).reset(),
      ),
    );
  }
}

class _CounterContent extends StatelessWidget {
  const _CounterContent({required this.value});

  final int value;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          localizations.counterLabel(value),
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _CounterLoading extends StatelessWidget {
  const _CounterLoading({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text(
          message,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _CounterError extends StatelessWidget {
  const _CounterError({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.error_outline,
          color: Theme.of(context).colorScheme.error,
        ),
        const SizedBox(height: 16),
        Text(
          localizations.genericErrorMessage,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          message,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _CounterActions extends StatelessWidget {
  const _CounterActions({
    required this.onIncrement,
    required this.onReset,
  });

  final VoidCallback onIncrement;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton.extended(
          heroTag: 'increment',
          onPressed: onIncrement,
          icon: const Icon(Icons.add),
          label: Text(localizations.incrementButton),
        ),
        const SizedBox(height: 12),
        FloatingActionButton.extended(
          heroTag: 'reset',
          onPressed: onReset,
          icon: const Icon(Icons.refresh),
          label: Text(localizations.resetButton),
        ),
      ],
    );
  }
}
