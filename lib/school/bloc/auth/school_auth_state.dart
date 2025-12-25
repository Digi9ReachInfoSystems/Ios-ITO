import 'package:equatable/equatable.dart';
import '../../data/models/school_user.dart';

/// Base class for all School Auth states
abstract class SchoolAuthState extends Equatable {
  const SchoolAuthState();

  @override
  List<Object?> get props => [];
}

/// Initial state (app just started)
class SchoolAuthInitial extends SchoolAuthState {
  const SchoolAuthInitial();
}

/// While login API is in progress
class SchoolAuthLoading extends SchoolAuthState {
  const SchoolAuthLoading();
}

/// Login success
class SchoolAuthAuthenticated extends SchoolAuthState {
  final SchoolUser schoolUser;

  const SchoolAuthAuthenticated({
    required this.schoolUser,
  });

  @override
  List<Object?> get props => [schoolUser];
}

/// User explicitly logged out
class SchoolAuthUnauthenticated extends SchoolAuthState {
  const SchoolAuthUnauthenticated();
}

/// Any login / auth failure
class SchoolAuthFailure extends SchoolAuthState {
  final String message;

  const SchoolAuthFailure({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
