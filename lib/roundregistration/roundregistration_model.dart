import '/flutter_flow/flutter_flow_util.dart';
import 'roundregistration_widget.dart' show RoundregistrationWidget;
import 'package:flutter/material.dart';

class RoundregistrationModel extends FlutterFlowModel<RoundregistrationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.
String selectedComboId = '';

  RoundregistrationModel() {
    // Initialize selectedComboId here if needed
  }
  
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}