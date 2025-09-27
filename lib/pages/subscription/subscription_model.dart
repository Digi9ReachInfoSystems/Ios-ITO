import '/flutter_flow/flutter_flow_util.dart';
import 'subscription_widget.dart' show SubscriptionWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class SubscriptionModel extends FlutterFlowModel<SubscriptionWidget> {
  ///  Local state fields for this page.

  String servicess = 'Monthly Test';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
