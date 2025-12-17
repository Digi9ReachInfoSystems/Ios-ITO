import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'product_webview_widget.dart' show ProductWebviewWidget;
import 'package:flutter/material.dart';

class ProductWebviewModel extends FlutterFlowModel<ProductWebviewWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (statusCheck)] action in productWebview widget.
  ApiCallResponse? status;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
