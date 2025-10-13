import 'dart:async';

class ApiTokenManager {
  static String? _token;
  static DateTime? _expiry;

  /// Set token & expiry once after login
  static void setToken(String token, String? expiresAt) {
    _token = token;

    if (expiresAt != null && expiresAt.isNotEmpty) {
      try {
        _expiry = DateTime.parse(expiresAt);
      } catch (_) {
        _expiry = null;
      }
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
  static void clear() {
    _token = null;
    _expiry = null;
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
