import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'forget_password_widget.dart' show ForgetPasswordWidget;
import 'package:flutter/material.dart';

class ForgetPasswordModel extends FlutterFlowModel<ForgetPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for forgetemail widget.
  FocusNode? forgetemailFocusNode;
  TextEditingController? forgetemailController;
  String? Function(BuildContext, String?)? forgetemailControllerValidator;
  // Stores action output result for [Backend Call - API (forgetPassword)] action in Button widget.
  ApiCallResponse? apiResult1rd;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    forgetemailFocusNode?.dispose();
    forgetemailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
