import 'package:indian_talent_olympiad/backend/schema/update_alert_record.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cartvalue_copy_widget.dart' show CartvalueCopyWidget;
import 'package:flutter/material.dart';

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
