import 'package:indian_talent_olympiad/backend/schema/update_alert_record.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'cartvalue_copy_widget.dart' show CartvalueCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CartvalueCopyModel extends FlutterFlowModel<CartvalueCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
   int? version;
   String? oldversion;
  // Stores action output result for [Backend Call - API (submitregistration)] action in Button widget.
  ApiCallResponse? apiResult3ma;
  UpdateAlertRecord? newversion;
  // Stores action output result for [Custom Action - generateSha] action in Button widget.
  String? sha256;
  // Stores action output result for [Backend Call - API (phonepe)] action in Button widget.
  ApiCallResponse? payApi;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
