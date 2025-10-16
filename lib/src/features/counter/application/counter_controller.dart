import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/counter_repository.dart';

final counterControllerProvider =
    AsyncNotifierProvider<CounterController, int>(CounterController.new);

class CounterController extends AsyncNotifier<int> {
  CounterRepository get _repository => ref.read(counterRepositoryProvider);

  @override
  FutureOr<int> build() async {
    final repository = ref.watch(counterRepositoryProvider);
    return repository.fetch();
  }

  Future<void> increment() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final nextValue = await _repository.increment();
      return nextValue;
    });
  }

  Future<void> reset() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.reset();
      return _repository.fetch();
    });
  }
}
