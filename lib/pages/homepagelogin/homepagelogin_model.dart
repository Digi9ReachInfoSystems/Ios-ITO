
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'homepagelogin_widget.dart' show HomepageloginWidget;
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class HomepageloginModel extends FlutterFlowModel<HomepageloginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getServices)] action in Homepagelogin widget.
  ApiCallResponse? apiResulti35;
   String? appversion;
  // Stores action output result for [Custom Action - jsontodata] action in Homepagelogin widget.
  List<ServicesStruct>? servicer;
  ApiCallResponse? newversion;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;

  int carouselCurrentIndex = 1;

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
