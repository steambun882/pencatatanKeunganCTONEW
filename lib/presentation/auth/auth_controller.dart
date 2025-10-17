import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pencatatan_keuangan/core/core.dart';
import 'package:pencatatan_keuangan/data/data.dart';
import 'package:pencatatan_keuangan/domain/domain.dart';

final authStateProvider = StreamProvider<AppUser?>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return repository.authStateChanges;
});

final currentUserProvider = Provider<AppUser?>((ref) {
  return ref.watch(authStateProvider).maybeWhen(
        data: (user) => user,
        orElse: () => null,
      );
});

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  final cacheService = ref.watch(cacheServiceProvider);
  return AuthController(
    repository: repository,
    cacheService: cacheService,
  );
});

class AuthController extends StateNotifier<AsyncValue<void>> {
  AuthController({
    required AuthRepository repository,
    required CacheService cacheService,
  })  : _repository = repository,
        _cacheService = cacheService,
        super(const AsyncData<void>(null));

  final AuthRepository _repository;
  final CacheService _cacheService;

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await _execute(
      () => _repository.signInWithEmail(
        email: email,
        password: password,
      ),
    );
  }

  Future<void> registerWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    await _execute(
      () => _repository.registerWithEmail(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    await _execute(_repository.signInWithGoogle);
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _execute(() => _repository.sendPasswordResetEmail(email));
  }

  Future<void> signOut({bool clearCache = true}) async {
    await _execute(() async {
      await _repository.signOut();
      if (clearCache) {
        await _cacheService.clearAll();
      }
    });
  }

  Future<void> _execute(Future<void> Function() operation) async {
    state = const AsyncLoading<void>();
    try {
      await operation();
      state = const AsyncData<void>(null);
    } on AuthException catch (error, stackTrace) {
      state = AsyncError<void>(error, stackTrace);
      rethrow;
    } catch (error, stackTrace) {
      const fallback =
          AuthException('Unexpected error occurred. Please try again.');
      state = AsyncError<void>(fallback, stackTrace);
      throw fallback;
    }
  }
}
