import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pencatatan_keuangan/shared/preferences/local_preferences.dart';

const _onboardingPreferenceKey = 'onboarding.completed';

final onboardingControllerProvider =
    AsyncNotifierProvider<OnboardingController, bool>(
  OnboardingController.new,
);

class OnboardingController extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final preferences = ref.watch(localPreferencesProvider);
    final completed = await preferences.getBool(_onboardingPreferenceKey) ?? false;
    return !completed;
  }

  Future<void> completeOnboarding() async {
    final preferences = ref.watch(localPreferencesProvider);
    state = const AsyncValue.loading();
    try {
      await preferences.setBool(_onboardingPreferenceKey, true);
      state = const AsyncValue.data(false);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
