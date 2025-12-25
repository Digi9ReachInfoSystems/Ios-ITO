import 'package:dio/dio.dart';

class SchoolApiService {
  final Dio _dio;

  SchoolApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://www.olympiadx.com/RESTapi',
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            responseType: ResponseType.json,
            headers: {
              'Accept': 'application/json',
            },
          ),
        );

  Future<Map<String, dynamic>> login({
    required String loginId,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/school-v1/auth/login',
        data: {
          // ✅ REAL API CONTRACT (BODY)
          'login_id': loginId,
          'password': password,
        },
        options: Options(
          headers: {
            // ⚠️ TEMPORARY BACKEND BUG WORKAROUND
            // REMOVE LATER
            'mobile': loginId,
            'password': password,
          },
        ),
      );

      if (response.data is! Map<String, dynamic>) {
        throw Exception('Invalid response format from server');
      }

      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      final data = e.response?.data;

      if (data is String) {
        // backend sometimes sends plain text / html
        throw Exception(data);
      }

      throw Exception(
        data?['message'] ?? 'School login failed',
      );
    }
  }
}
