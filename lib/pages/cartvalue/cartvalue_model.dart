import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cartvalue_widget.dart' show CartvalueWidget;
import 'package:flutter/material.dart';

class CartvalueModel extends FlutterFlowModel<CartvalueWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (products Subscription)] action in Button widget.
  ApiCallResponse? apiResult3ma;
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
