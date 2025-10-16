import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:indian_talent_olympiad/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart'; // for getBaseUrl()

class ApiTokenManager {
  static final _storage = const FlutterSecureStorage();
  static String? _token;
  static DateTime? _expiry;
  static bool _isRefreshing = false;

  /// Initialize stored token at app start
  static Future<void> init() async {
    _token = await _storage.read(key: 'token');
    final expiryString = await _storage.read(key: 'expiry');
    if (expiryString != null) {
      _expiry = DateTime.tryParse(expiryString);
    }
  }

  /// Save token and expiry
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

  /// Get token
  static String? get token => _token;

  /// Check expiry with 1-min buffer
  static bool get isExpired {
    if (_expiry == null) return false;
    final now = DateTime.now();
    return now.isAfter(_expiry!.subtract(const Duration(minutes: 1)));
  }

  /// Clear token (logout)
  static Future<void> clear() async {
    _token = null;
    _expiry = null;
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'expiry');
  }

  /// Automatically refresh token if expired
  static Future<void> refreshIfNeeded() async {
    if (!isExpired || _isRefreshing || _token == null) return;

    _isRefreshing = true;
    try {
      print('♻️ Refreshing expired token...');

      final response = await http.post(
        Uri.parse('${getBaseUrl()}/student/auth/generate_auth_token'),
        headers: {
          'Authorization': 'Bearer $_token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final newToken = data['token']?['firebase_token'];
        final expiresAt = data['token']?['expires_at'];

        if (newToken != null) {
          await setToken(newToken, expiresAt);
          print('✅ Token refreshed successfully');
        } else {
          print('⚠️ Token refresh failed: missing firebase_token');
        }
      } else {
        print('⚠️ Token refresh failed: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('⚠️ Token refresh error: $e');
    } finally {
      _isRefreshing = false;
    }
  }

  /// Unified headers for all API calls
  static Map<String, String> get headers {
    final Map<String, String> h = {'Content-Type': 'application/json'};
    if (_token != null) h['Authorization'] = 'Bearer $_token';
    return h;
  }
}
