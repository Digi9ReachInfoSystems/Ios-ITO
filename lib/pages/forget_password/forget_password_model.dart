import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forget_password_widget.dart' show ForgetPasswordWidget;
import 'package:flutter/material.dart';

class ForgetPasswordModel extends FlutterFlowModel<ForgetPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for forgetemail widget.
  FocusNode? forgetemailFocusNode;
  TextEditingController? forgetemailTextController;
  String? Function(BuildContext, String?)? forgetemailTextControllerValidator;
  // Stores action output result for [Backend Call - API (forgetPassword)] action in Button widget.
  ApiCallResponse? apiResult1rd;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    forgetemailFocusNode?.dispose();
    forgetemailTextController?.dispose();
  }
}
