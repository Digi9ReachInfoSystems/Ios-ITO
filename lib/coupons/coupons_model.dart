import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/testshimmer/testshimmer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'coupons_widget.dart' show CouponsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CouponsModel extends FlutterFlowModel<CouponsWidget> {
  ///  Local state fields for this page.

  List<String> couponcodes = [];
  void addToCouponcodes(String item) => couponcodes.add(item);
  void removeFromCouponcodes(String item) => couponcodes.remove(item);
  void removeAtIndexFromCouponcodes(int index) => couponcodes.removeAt(index);
  void insertAtIndexInCouponcodes(int index, String item) =>
      couponcodes.insert(index, item);
  void updateCouponcodesAtIndex(int index, Function(String) updateFn) =>
      couponcodes[index] = updateFn(couponcodes[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

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
