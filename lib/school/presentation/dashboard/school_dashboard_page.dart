import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';

class SchoolDashboardPage extends StatelessWidget {
  const SchoolDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'School Dashboard',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: FlutterFlowTheme.of(context).primary,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.school,
              size: 80,
              color: FlutterFlowTheme.of(context).primary,
            ),
            const SizedBox(height: 16),
            Text(
              'School Login Successful',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This is a dummy dashboard',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
