import '/backend/api_requests/api_calls.dart';
import '/components/empty_widget_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'annual_exam_start_widget.dart' show AnnualExamStartWidget;
import 'package:flutter/material.dart';

class AnnualExamStartModel extends FlutterFlowModel<AnnualExamStartWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - API (getquestionsox)] action in Button widget.
  ApiCallResponse? apiResult0o8;
  // Stores action output result for [Backend Call - API (getquestionsox)] action in Button widget.
  ApiCallResponse? apiResult0o12;
  // Model for empty_widget component.
  late EmptyWidgetModel emptyWidgetModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<dynamic>();

  @override
  void initState(BuildContext context) {
    emptyWidgetModel = createModel(context, () => EmptyWidgetModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emptyWidgetModel.dispose();
    paginatedDataTableController.dispose();
  }
}
