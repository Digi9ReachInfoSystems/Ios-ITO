import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/services/school_api_service.dart';
import 'data/repositories/school_auth_repository.dart';
import 'bloc/auth/school_auth_bloc.dart';
import 'presentation/login/school_login_page.dart';

Route<dynamic> schoolLoginRoute() {
  return MaterialPageRoute(
    builder: (context) {
      return RepositoryProvider<SchoolApiService>(
        create: (_) => SchoolApiService(),
        child: RepositoryProvider<SchoolAuthRepository>(
          create: (context) => SchoolAuthRepository(
            apiService: context.read<SchoolApiService>(),
          ),
          child: BlocProvider<SchoolAuthBloc>(
            create: (context) => SchoolAuthBloc(
              repository: context.read<SchoolAuthRepository>(),
            ),
            child: const SchoolLoginPage(),
          ),
        ),
      );
    },
  );
}
