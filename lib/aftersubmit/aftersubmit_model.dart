import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'aftersubmit_widget.dart' show AftersubmitWidget;
import 'package:flutter/material.dart';

class AftersubmitModel extends FlutterFlowModel<AftersubmitWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Submitanswerstobackend)] action in aftersubmit widget.
  ApiCallResponse? apiResulttp1;

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
