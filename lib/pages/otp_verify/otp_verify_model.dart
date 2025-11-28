import '/flutter_flow/flutter_flow_util.dart';
import 'otp_verify_widget.dart' show OtpVerifyWidget;
import 'package:flutter/material.dart';

class OtpVerifyModel extends FlutterFlowModel<OtpVerifyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
