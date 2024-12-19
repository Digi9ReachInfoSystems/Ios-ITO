import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'forget_password_widget.dart' show ForgetPasswordWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
