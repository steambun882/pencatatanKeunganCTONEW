import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Abstraction for storing small pieces of data such as flags or settings.
abstract class LocalPreferences {
  Future<bool?> getBool(String key);

  Future<void> setBool(String key, bool value);

  Future<String?> getString(String key);

  Future<void> setString(String key, String? value);

  Future<void> remove(String key);
}

/// Simple in-memory implementation that emulates a persistent key-value store.
class InMemoryLocalPreferences implements LocalPreferences {
  InMemoryLocalPreferences({this.writeDelay = Duration.zero});

  final Duration writeDelay;
  final Map<String, Object?> _storage = <String, Object?>{};

  Future<T> _withOptionalDelay<T>(T Function() action) async {
    if (writeDelay > Duration.zero) {
      await Future<void>.delayed(writeDelay);
    }
    return action();
  }

  @override
  Future<bool?> getBool(String key) async {
    final value = _storage[key];
    return value is bool ? value : null;
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await _withOptionalDelay(() {
      _storage[key] = value;
      return true;
    });
  }

  @override
  Future<String?> getString(String key) async {
    final value = _storage[key];
    return value is String ? value : null;
  }

  @override
  Future<void> setString(String key, String? value) async {
    await _withOptionalDelay(() {
      if (value == null) {
        _storage.remove(key);
      } else {
        _storage[key] = value;
      }
      return true;
    });
  }

  @override
  Future<void> remove(String key) async {
    await _withOptionalDelay(() {
      _storage.remove(key);
      return true;
    });
  }
}

final localPreferencesProvider = Provider<LocalPreferences>(
  (ref) => InMemoryLocalPreferences(),
);
