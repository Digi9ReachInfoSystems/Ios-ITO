import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'empty_widget_model.dart';
export 'empty_widget_model.dart';

class EmptyWidgetWidget extends StatefulWidget {
  const EmptyWidgetWidget({
    super.key,
    required this.datatype,
  });

  final String? datatype;

  @override
  State<EmptyWidgetWidget> createState() => _EmptyWidgetWidgetState();
}

class _EmptyWidgetWidgetState extends State<EmptyWidgetWidget> {
  late EmptyWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.hourglass_empty_rounded,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
        Text(
          'No ${widget.datatype} available at the moment.',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.readexPro(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                fontSize: 12.0,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
        ),
      ].divide(SizedBox(height: 5.0)),
    );
  }
}
