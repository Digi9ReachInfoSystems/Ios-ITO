import '/flutter_flow/flutter_flow_util.dart';
import 'coupons_widget.dart' show CouponsWidget;
import 'package:flutter/material.dart';

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
