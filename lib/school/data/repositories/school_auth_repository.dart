import '../models/school_user.dart';
import '../services/school_api_service.dart';

class SchoolAuthRepository {
  final SchoolApiService _apiService;

  SchoolAuthRepository({
    required SchoolApiService apiService,
  }) : _apiService = apiService;

  /// Handles school login
  ///
  /// Converts raw API JSON → SchoolUser model
  /// Throws exception on failure
  Future<SchoolUser> login({
    required String username,
    required String password,
  }) async {
    final response = await _apiService.login(
      loginId: username,
      password: password,
    );

    // Defensive parsing (API is inconsistent)
    final data = response['data'] ??
        response['session_data'] ??
        response;

    return SchoolUser.fromJson(data);
  }
}
