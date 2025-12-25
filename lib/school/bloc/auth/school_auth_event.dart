import 'package:equatable/equatable.dart';

/// Base class for all School Auth events
abstract class SchoolAuthEvent extends Equatable {
  const SchoolAuthEvent();

  @override
  List<Object?> get props => [];
}

/// Triggered when school user clicks LOGIN
class SchoolLoginRequested extends SchoolAuthEvent {
  final String username;
  final String password;

  const SchoolLoginRequested({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}

/// Triggered when user explicitly logs out
class SchoolLogoutRequested extends SchoolAuthEvent {
  const SchoolLogoutRequested();
}

/// Triggered on app start to check if school is already logged in
class SchoolAuthCheckRequested extends SchoolAuthEvent {
  const SchoolAuthCheckRequested();
}
