import '/flutter_flow/flutter_flow_util.dart';
import 'certificate_viewer_widget.dart' show CertificateViewerWidget;
import 'package:flutter/material.dart';

class CertificateViewerModel extends FlutterFlowModel<CertificateViewerWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap = {};
  List<dynamic> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
