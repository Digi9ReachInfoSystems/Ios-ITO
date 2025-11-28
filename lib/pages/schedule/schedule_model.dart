import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/testshimmer/testshimmer_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'schedule_widget.dart' show ScheduleWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ScheduleModel extends FlutterFlowModel<ScheduleWidget> {
  ///  Local state fields for this page.

  int? selectedSlot = 1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (validate Token)] action in schedule widget.
  ApiCallResponse? validatetoken;
  // Stores action output result for [Backend Call - API (schedule)] action in schedule widget.
  ApiCallResponse? apiResultqqp;
  // Stores action output result for [Custom Action - jsomtotimelineslot1] action in schedule widget.
  List<TimelinedocumentStruct>? slot11;
  // Stores action output result for [Custom Action - jsomtotimelineslot1] action in schedule widget.
  List<TimelinedocumentStruct>? slot22;
  // Stores action output result for [Backend Call - API (get new token)] action in schedule widget.
  ApiCallResponse? getnewtoken;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  /// Query cache managers for this widget.

  final _monthlyscheduleManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> monthlyschedule({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _monthlyscheduleManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMonthlyscheduleCache() => _monthlyscheduleManager.clear();
  void clearMonthlyscheduleCacheKey(String? uniqueKey) =>
      _monthlyscheduleManager.clearRequest(uniqueKey);

  final _yearlyscheduleManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> yearlyschedule({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _yearlyscheduleManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearYearlyscheduleCache() => _yearlyscheduleManager.clear();
  void clearYearlyscheduleCacheKey(String? uniqueKey) =>
      _yearlyscheduleManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();

    /// Dispose query cache managers for this widget.

    clearMonthlyscheduleCache();

    clearYearlyscheduleCache();
  }
}
