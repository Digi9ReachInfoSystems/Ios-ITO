import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_talent_olympiad/flutter_flow/flutter_flow_util.dart';

import '../../bloc/auth/school_auth_bloc.dart';
import '../../bloc/auth/school_auth_event.dart';
import '../../bloc/auth/school_auth_state.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';

class SchoolLoginPage extends StatefulWidget {
  const SchoolLoginPage({super.key});

  @override
  State<SchoolLoginPage> createState() => _SchoolLoginPageState();
}

class _SchoolLoginPageState extends State<SchoolLoginPage> {
  final _schoolIdController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _schoolIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SchoolAuthBloc, SchoolAuthState>(
      listener: (context, state) {
        if (state is SchoolAuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          print(  state.message);
        }

        if (state is SchoolAuthAuthenticated) {
          // TODO: Navigate to School Dashboard
          context.goNamed('SchoolDashboard');
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TITLE (same vibe as student)
            Text(
              'Welcome School',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                    fontSize: 24,
                    color: const Color(0xFF272727),
                  ),
            ),

            const SizedBox(height: 6),

            Text(
              'Login using your school credentials',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.poppins(),
                    color: const Color(0xFF272727),
                  ),
            ),

            const SizedBox(height: 20),

            /// SCHOOL ID
            TextFormField(
              controller: _schoolIdController,
              decoration: _inputDecoration(
                context,
                label: 'School ID / Username',
              ),
            ),

            const SizedBox(height: 16),

            /// PASSWORD
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: _inputDecoration(
                context,
                label: 'Password',
              ),
            ),

            const SizedBox(height: 24),

            /// LOGIN BUTTON
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.05,
              child: BlocBuilder<SchoolAuthBloc, SchoolAuthState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is SchoolAuthLoading
                        ? null
                        : () {
                            context.read<SchoolAuthBloc>().add(
                                  SchoolLoginRequested(
                                    username: _schoolIdController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  ),
                                );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          FlutterFlowTheme.of(context).primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: state is SchoolAuthLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Sign In',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  color: Colors.white,
                                ),
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(BuildContext context,
      {required String label}) {
    return InputDecoration(
      labelText: label,
      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
            font: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w500,
            ),
            color: const Color(0xFF57636C),
          ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFE0E3E7), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF4B39EF), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.all(24),
    );
  }
}
