import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_widget_widget.dart';
import '/components/notification_popup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/homeshimmer/homeshimmer_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'homepagelogin_widget.dart' show HomepageloginWidget;
import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomepageloginModel extends FlutterFlowModel<HomepageloginWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (validate Token)] action in Homepagelogin widget.
  ApiCallResponse? validatetoken;
  // Stores action output result for [Backend Call - API (getServices)] action in Homepagelogin widget.
  ApiCallResponse? apiResulti35;
  // Stores action output result for [Backend Call - API (appcheck)] action in Homepagelogin widget.
  ApiCallResponse? newversion;
  // Stores action output result for [Custom Action - upgrader] action in Homepagelogin widget.
  String? appversion;
  // Stores action output result for [Custom Action - jsontodata] action in Homepagelogin widget.
  List<ServicesStruct>? servicer;
  // Stores action output result for [Backend Call - API (get new token)] action in Homepagelogin widget.
  ApiCallResponse? getnewtoken;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
