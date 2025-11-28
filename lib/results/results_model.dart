import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'results_widget.dart' show ResultsWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ResultsModel extends FlutterFlowModel<ResultsWidget> {
  @override
  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  @override
  void dispose() {}
}
