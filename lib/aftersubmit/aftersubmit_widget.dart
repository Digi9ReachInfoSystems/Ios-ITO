import 'package:lottie/lottie.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
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
      );
      if ((_model.apiResulttp1?.succeeded ?? true)) {
        logFirebaseEvent('aftersubmit_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                title: const Text('Congrats'),
                content: const Text('Congrats the exam Was submitted Successfully'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: const Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        logFirebaseEvent('aftersubmit_navigate_to');

        context.goNamed('Homepagelogin');
      } else {
        logFirebaseEvent('aftersubmit_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                title: const Text('Failed'),
                content:
                    const Text('Submitting Exam Failed due to Internal Server Issue'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: const Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        logFirebaseEvent('aftersubmit_navigate_to');

        context.goNamed('Homepagelogin');
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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(

          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'jwu5nwmn' /* Submitting test */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: const [],
          centerTitle: true,
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'qvqfypux' /* Woohoo! You’ve Made It! 🎊 */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'v38dczqc' /* We’re submitting your exam now */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Lottie.asset(
                    'assets/lottie_animations/Animation_-_1729761055499.json',
                    width: 200,
                    height: 200,
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
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).success,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
