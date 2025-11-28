import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'powerwebview_widget.dart' show PowerwebviewWidget;
import 'package:flutter/material.dart';

class PowerwebviewModel extends FlutterFlowModel<PowerwebviewWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (statusCheck)] action in powerwebview widget.
  ApiCallResponse? status;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
