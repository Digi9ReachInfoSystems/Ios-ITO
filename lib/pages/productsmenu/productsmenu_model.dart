import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/special_offershimeer/special_offershimeer_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'productsmenu_widget.dart' show ProductsmenuWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProductsmenuModel extends FlutterFlowModel<ProductsmenuWidget> {
  ///  Local state fields for this page.

  List<String> totalAmount = [];
  void addToTotalAmount(String item) => totalAmount.add(item);
  void removeFromTotalAmount(String item) => totalAmount.remove(item);
  void removeAtIndexFromTotalAmount(int index) => totalAmount.removeAt(index);
  void insertAtIndexInTotalAmount(int index, String item) =>
      totalAmount.insert(index, item);
  void updateTotalAmountAtIndex(int index, Function(String) updateFn) =>
      totalAmount[index] = updateFn(totalAmount[index]);

  String amount = '0';

  bool added = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (validate Token)] action in productsmenu widget.
  ApiCallResponse? validatetoken;
  // Stores action output result for [Backend Call - API (get new token)] action in productsmenu widget.
  ApiCallResponse? getnewtoken;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for CheckboxListTile widget.
  Map<dynamic, bool> checkboxListTileValueMap1 = {};
  List<dynamic> get checkboxListTileCheckedItems1 =>
      checkboxListTileValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for CheckboxListTile widget.
  Map<dynamic, bool> checkboxListTileValueMap2 = {};
  List<dynamic> get checkboxListTileCheckedItems2 =>
      checkboxListTileValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for CheckboxListTile widget.
  Map<dynamic, bool> checkboxListTileValueMap3 = {};
  List<dynamic> get checkboxListTileCheckedItems3 =>
      checkboxListTileValueMap3.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for CheckboxListTile widget.
  Map<dynamic, bool> checkboxListTileValueMap4 = {};
  List<dynamic> get checkboxListTileCheckedItems4 =>
      checkboxListTileValueMap4.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
