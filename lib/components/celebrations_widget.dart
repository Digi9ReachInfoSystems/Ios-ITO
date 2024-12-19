import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'celebrations_model.dart';
export 'celebrations_model.dart';

class CelebrationsWidget extends StatefulWidget {
  const CelebrationsWidget({super.key});

  @override
  State<CelebrationsWidget> createState() => _CelebrationsWidgetState();
}

class _CelebrationsWidgetState extends State<CelebrationsWidget> {
  late CelebrationsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CelebrationsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Lottie.asset(
        'assets/lottie_animations/Animation_-_1709374124064.json',
        width: 150.0,
        height: 130.0,
        fit: BoxFit.cover,
        animate: true,
      ),
    );
  }
}
