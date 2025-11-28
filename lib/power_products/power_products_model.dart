import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/ordersshimmer/ordersshimmer_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'power_products_widget.dart' show PowerProductsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PowerProductsModel extends FlutterFlowModel<PowerProductsWidget> {
  ///  Local state fields for this page.

  List<int> selectdNo = [];
  void addToSelectdNo(int item) => selectdNo.add(item);
  void removeFromSelectdNo(int item) => selectdNo.remove(item);
  void removeAtIndexFromSelectdNo(int index) => selectdNo.removeAt(index);
  void insertAtIndexInSelectdNo(int index, int item) =>
      selectdNo.insert(index, item);
  void updateSelectdNoAtIndex(int index, Function(int) updateFn) =>
      selectdNo[index] = updateFn(selectdNo[index]);

  double? powercartvalue;

  double? discountfee;

  double? deliveryfee;

  double? powerfinalamount;

  int items = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for CheckboxListTile widget.
  Map<dynamic, bool> checkboxListTileValueMap = {};
  List<dynamic> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap1 = {};
  List<dynamic> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
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
