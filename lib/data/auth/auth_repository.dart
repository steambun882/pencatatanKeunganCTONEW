import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:pencatatan_keuangan/core/core.dart';
import 'package:pencatatan_keuangan/domain/domain.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return AuthRepository(
    auth: auth,
    googleSignIn: GoogleSignIn(),
  );
});

class AuthRepository {
  AuthRepository({
    required FirebaseAuth auth,
    GoogleSignIn? googleSignIn,
  })  : _auth = auth,
        _googleSignIn = googleSignIn ?? GoogleSignIn() {
    if (kIsWeb) {
      unawaited(_auth.setPersistence(Persistence.LOCAL));
    }
  }

  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  Stream<AppUser?> get authStateChanges =>
      _auth.authStateChanges().map(_mapUser);

  AppUser? get currentUser => _mapUser(_auth.currentUser);

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await _runFirebaseCall(
      () => _auth.signInWithEmailAndPassword(
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
    await _runFirebaseCall(() async {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (name.isNotEmpty) {
        await credential.user?.updateDisplayName(name);
        await credential.user?.reload();
      }
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        final provider = GoogleAuthProvider();
        await _auth.signInWithPopup(provider);
        return;
      }

      final account = await _googleSignIn.signIn();
      if (account == null) {
        throw const AuthException('Sign in aborted by the user.');
      }

      final authentication = await account.authentication;
      if (authentication.accessToken == null &&
          authentication.idToken == null) {
        throw const AuthException(
          'Failed to retrieve Google authentication tokens.',
        );
      }
      final credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken,
      );

      await _auth.signInWithCredential(credential);
    } on AuthException {
      rethrow;
    } on FirebaseAuthException catch (error) {
      throw AuthException(_messageFromCode(error.code));
    } catch (_) {
      throw const AuthException(
        'Failed to sign in with Google. Please try again later.',
      );
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _runFirebaseCall(
      () => _auth.sendPasswordResetEmail(email: email),
    );
  }

  Future<void> signOut() async {
    await _runFirebaseCall(() async {
      await _auth.signOut();
      if (!kIsWeb) {
        await _googleSignIn.signOut();
      }
    });
  }

  AppUser? _mapUser(User? user) {
    if (user == null) {
      return null;
    }

    return AppUser(
      id: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }

  Future<void> _runFirebaseCall(Future<void> Function() operation) async {
    try {
      await operation();
    } on FirebaseAuthException catch (error) {
      throw AuthException(_messageFromCode(error.code));
    } on FirebaseException catch (_) {
      throw const AuthException(
        'We could not complete that request. Please try again later.',
      );
    } catch (_) {
      throw const AuthException(
        'Something went wrong. Please try again.',
      );
    }
  }

  String _messageFromCode(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No account found with that email address.';
      case 'wrong-password':
      case 'invalid-credential':
        return 'The email or password you entered is incorrect.';
      case 'user-disabled':
        return 'This account has been disabled. Please contact support.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'email-already-in-use':
        return 'An account already exists for that email.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'invalid-email':
        return 'The email address appears to be invalid.';
      default:
        return 'Authentication failed. Please try again.';
    }
  }
}
