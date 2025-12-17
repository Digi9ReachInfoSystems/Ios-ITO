import '/flutter_flow/flutter_flow_util.dart';
import 'faqs_widget.dart' show FaqsWidget;
import 'package:flutter/material.dart';

class FaqsModel extends FlutterFlowModel<FaqsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
