import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (loginOutside)] action in profile widget.
  ApiCallResponse? apiResult83f;
  // Stores action output result for [Backend Call - API (validate Token)] action in profile widget.
  ApiCallResponse? validatetoken;
  // Stores action output result for [Backend Call - API (get new token)] action in profile widget.
  ApiCallResponse? getnewtoken;
  // Stores action output result for [Backend Call - API (subcsriptions)] action in Row widget.
  ApiCallResponse? subApi;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
