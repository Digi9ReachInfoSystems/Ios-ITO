import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'powercart_widget.dart' show PowercartWidget;
import 'package:flutter/material.dart';

class PowercartModel extends FlutterFlowModel<PowercartWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (products Subscription)] action in Button widget.
  ApiCallResponse? apiResult3ma;
  // Stores action output result for [Custom Action - generateSha] action in Button widget.
  String? sha256;
  // Stores action output result for [Backend Call - API (phonepe)] action in Button widget.
  ApiCallResponse? payApi;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
