import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';
  static String get envName => dotenv.env['APP_ENV'] ?? 'unknown';
}
