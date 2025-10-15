import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiTokenManager {
  static final _storage = const FlutterSecureStorage();
  static String? _token;
  static DateTime? _expiry;

 static Future<void> init() async {
    _token = await _storage.read(key: 'token');
    final expiryString = await _storage.read(key: 'expiry');
    if (expiryString != null) {
      _expiry = DateTime.tryParse(expiryString);
    }
  }
  /// Set token & expiry once after login
   static Future<void> setToken(String token, String? expiresAt) async {
    _token = token;
    _expiry = expiresAt != null && expiresAt.isNotEmpty
        ? DateTime.tryParse(expiresAt)
        : null;

    await _storage.write(key: 'token', value: token);
    if (_expiry != null) {
      await _storage.write(key: 'expiry', value: _expiry!.toIso8601String());
    }
  }

  /// Get the current token
  static String? get token => _token;

  /// Check if token is expired (with 1-min buffer)
  static bool get isExpired {
    if (_expiry == null) return false;
    final now = DateTime.now();
    return now.isAfter(_expiry!.subtract(const Duration(minutes: 1)));
  }

  /// Clear token (on logout)
  static Future<void> clear() async {
    _token = null;
    _expiry = null;
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'expiry');
  }

  /// Refresh token automatically if expired
  static Future<void> refreshIfNeeded(Future<String?> Function() refreshFunction) async {
    if (isExpired) {
      final newToken = await refreshFunction();
      if (newToken != null) {
        _token = newToken;
        // Optionally: update expiry if returned
      }
    }
  }

  /// Headers for all API requests
  static Map<String, String> get headers {
    final Map<String, String> h = {'Content-Type': 'application/json'};
    if (_token != null) h['Authorization'] = 'Bearer $_token';
    return h;
  }

  
}
