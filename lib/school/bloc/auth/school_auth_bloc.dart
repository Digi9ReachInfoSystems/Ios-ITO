import 'package:flutter_bloc/flutter_bloc.dart';
import 'school_auth_event.dart';
import 'school_auth_state.dart';
import '../../data/repositories/school_auth_repository.dart';
import '../../data/models/school_user.dart';

class SchoolAuthBloc extends Bloc<SchoolAuthEvent, SchoolAuthState> {
  final SchoolAuthRepository repository;

  SchoolAuthBloc({required this.repository})
      : super(const SchoolAuthInitial()) {
    on<SchoolLoginRequested>(_onLoginRequested);
    on<SchoolLogoutRequested>(_onLogoutRequested);
  }

  /// Handles school login
  Future<void> _onLoginRequested(
    SchoolLoginRequested event,
    Emitter<SchoolAuthState> emit,
  ) async {
    emit(const SchoolAuthLoading());

    try {
      final SchoolUser user = await repository.login(
        username: event.username,
        password: event.password,
      );

      emit(SchoolAuthAuthenticated(schoolUser: user));
    } catch (e) {
      emit(
        SchoolAuthFailure(
          message: e.toString().replaceAll('Exception:', '').trim(),
        ),
      );
    }
  }

  /// Handles logout
  void _onLogoutRequested(
    SchoolLogoutRequested event,
    Emitter<SchoolAuthState> emit,
  ) {
    emit(const SchoolAuthUnauthenticated());
  }
}
