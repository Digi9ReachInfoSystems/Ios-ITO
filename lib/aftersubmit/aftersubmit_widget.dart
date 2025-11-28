import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'aftersubmit_model.dart';
export 'aftersubmit_model.dart';

class AftersubmitWidget extends StatefulWidget {
  const AftersubmitWidget({
    super.key,
    this.testid,
    this.totaltime,
  });

  final String? testid;
  final String? totaltime;

  static String routeName = 'aftersubmit';
  static String routePath = '/aftersubmit';

  @override
  State<AftersubmitWidget> createState() => _AftersubmitWidgetState();
}

class _AftersubmitWidgetState extends State<AftersubmitWidget> {
  late AftersubmitModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AftersubmitModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'aftersubmit'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('AFTERSUBMIT_aftersubmit_ON_INIT_STATE');
      logFirebaseEvent('aftersubmit_backend_call');
      _model.apiResulttp1 = await SubmitanswerstobackendCall.call(
        testId: FFAppState().testid,
        userAnswersJson:
            functions.convertdatatypetopjson(FFAppState().answers.toList()),
        attemptedQuestions: FFAppState().attemptedquestions,
        userId: FFAppState().userInfo.userId,
        takenTime: FFAppState().timetaken,
        sessionId: functions.sessionCode(),
        token: FFAppState().userInfo.token,
      );

      if ((_model.apiResulttp1?.succeeded ?? true)) {
        logFirebaseEvent('aftersubmit_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                title: Text('Congrats'),
                content: Text('Congrats the exam was submitted Successfully'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        logFirebaseEvent('aftersubmit_navigate_to');

        context.goNamed(HomepageloginWidget.routeName);
      } else {
        logFirebaseEvent('aftersubmit_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                title: Text('Failed'),
                content:
                    Text('Submitting Exam Failed due to Internal Server Issue'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        logFirebaseEvent('aftersubmit_navigate_to');

        context.goNamed(HomepageloginWidget.routeName);
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'jwu5nwmn' /* Submitting test */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.5,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'qvqfypux' /* Woohoo! You’ve Made It! 🎊 */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'v38dczqc' /* We’re submitting your exam now */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Lottie.asset(
                        'assets/jsons/Animation_-_1729761055499.json',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.contain,
                        animate: true,
                      ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '01gw6jiy' /* Please don’t press the back bu... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).success,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
