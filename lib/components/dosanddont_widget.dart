import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'dosanddont_model.dart';
export 'dosanddont_model.dart';

class DosanddontWidget extends StatefulWidget {
  const DosanddontWidget({
    super.key,
    required this.testid,
    required this.totaltime,
  });

  final String? testid;
  final String? totaltime;

  @override
  State<DosanddontWidget> createState() => _DosanddontWidgetState();
}

class _DosanddontWidgetState extends State<DosanddontWidget>
    with TickerProviderStateMixin {
  late DosanddontModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, 100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DosanddontModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DOSANDDONT_COMP_dosanddont_ON_INIT_STATE');
      logFirebaseEvent('dosanddont_timer');
      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: FlutterFlowTimer(
                initialTime: _model.timerMilliseconds,
                getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                  value,
                  hours: false,
                  milliSecond: false,
                ),
                controller: _model.timerController,
                updateStateInterval: const Duration(milliseconds: 1000),
                onChanged: (value, displayTime, shouldUpdate) {
                  _model.timerMilliseconds = value;
                  _model.timerValue = displayTime;
                  if (shouldUpdate) setState(() {});
                },
                onEnded: () async {
                  logFirebaseEvent('DOSANDDONT_Timer_xqwc8c9l_ON_TIMER_END');
                  logFirebaseEvent('Timer_navigate_to');

                  context.pushNamed(
                    'testpage',
                    queryParameters: {
                      'testId': serializeParam(
                        widget.testid,
                        ParamType.String,
                      ),
                      'timer': serializeParam(
                        widget.totaltime,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                },
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Please Wait for 1 Minute !!",
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).error,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const TextSpan(
                      text:" Hold on while you finish reading the instructions. Your exam will commence one minute after you've completed this step.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                textAlign: TextAlign.center, textScaler: TextScaler.linear(MediaQuery.of(context).textScaleFactor),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:"Important : No Second Chances !!",
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).error,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const TextSpan(
                      text: " Remember, if you navigate back or close the app, you will not be given a second chance to take the exam.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                textAlign: TextAlign.center, textScaler: TextScaler.linear(MediaQuery.of(context).textScaleFactor),
              ),
            ),
            Divider(
              thickness: 1,
              color: FlutterFlowTheme.of(context).primaryText,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'pcslqnf9' /* DO'S */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: const Color(0xFF008000),
                              fontSize: 18.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '1). Make sure your ITO App is updated.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '2). Check device internet/Wi-Fi connectivity.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '3). Check that the device front camera and microphone are operational.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '4). Check that the gadget is completely charged.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '5). Use a blank paper to do rough work.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '6). Take a mock tests before the main exam.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '7). Make sure all other tabs/background apps are closed.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '8). Before submitting the exam, double-check your answers.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '9). Before starting the exam, change your mobile screen saver time to 1 hour. If the screen remains idle, the phone may lock/sleep, which may submit the exam.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '60dnzx5k' /* DON'TS */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: const Color(0x97FF0101),
                              fontSize: 18.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '1). Avoid using numerous apps.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '2). Never use a book for rough work. ',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '3). Avoid closing exam before completing.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '4). Avoid using calculators or similar equipment.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '5). Do not press the device\'s back/home button.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '6). Avoid looking around or moving out of your seat.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '7). Do not cover the camera during the examination.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '8). Do not submit before checking the answers.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '9). Do not lock your mobile phone during the exam, as doing so will result in the exam\'s submission.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
