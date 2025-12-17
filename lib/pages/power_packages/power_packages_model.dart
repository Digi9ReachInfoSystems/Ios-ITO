import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/special_offershimeer/special_offershimeer_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'power_packages_widget.dart' show PowerPackagesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PowerPackagesModel extends FlutterFlowModel<PowerPackagesWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (validate Token)] action in powerPackages widget.
  ApiCallResponse? validatetoken;
  // Stores action output result for [Backend Call - API (get new token)] action in powerPackages widget.
  ApiCallResponse? getnewtoken;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
