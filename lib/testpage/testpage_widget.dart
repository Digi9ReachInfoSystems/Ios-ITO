import '../custom_code/widgets/test_widget_new.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'testpage_model.dart';
export 'testpage_model.dart';

class TestpageWidget extends StatefulWidget {
  const TestpageWidget({
    Key? key,
    required this.testId,
    String? timer,
  })  : this.timer = timer ?? '15',
        super(key: key);

  final String? testId;
  final String timer;

  @override
  _TestpageWidgetState createState() => _TestpageWidgetState();
}

class _TestpageWidgetState extends State<TestpageWidget> {
  late TestpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestpageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'testpage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TESTPAGE_PAGE_testpage_ON_INIT_STATE');
      logFirebaseEvent('testpage_timer');
      _model.timerController.onStartTimer();
      logFirebaseEvent('testpage_update_app_state');
      setState(() {
        FFAppState().testid = valueOrDefault<String>(
          widget.testId,
          'abc',
        );
        FFAppState().starttime = getCurrentTimestamp;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: FlutterFlowTimer(
              initialTime: functions.convertminutestomilliseconds(widget.timer),
              getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                value,
                hours: false,
                milliSecond: false,
              ),
              controller: _model.timerController,
              updateStateInterval: Duration(milliseconds: 1000),
              onChanged: (value, displayTime, shouldUpdate) {
                _model.timerMilliseconds = value;
                _model.timerValue = displayTime;
                if (shouldUpdate) setState(() {});
              },
              onEnded: () async {
                testWidgetKey.currentState?.submitTest();
                logFirebaseEvent('TESTTimer_1ecycrg6_ON_TIMER_END');
                logFirebaseEvent('Timer_update_app_state');
                setState(() {
                  FFAppState().timetaken = widget.timer;
                });
                logFirebaseEvent('Timer_alert_dialog');
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                        child: AlertDialog(
                      title: Text('Time Up!!'),
                      content: Text('The Allocated Time Has Ended ! '),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(alertDialogContext),
                          child: Text('Ok'),
                        ),
                      ],
                    ));
                  },
                );
              },
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Outfit',
                    color: Color(0xFFB82929),
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            actions: [],
            centerTitle: true,
            toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, -1.00),
                      child: Text(
                        valueOrDefault<String>(
                          FFAppState().subjectname,
                          'Subject Name',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFF272727),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  's359z0hh' /* Start time */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: dateTimeFormat(
                                  'jm',
                                  FFAppState().starttime,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                icon: Icon(
                                  Icons.access_time_sharp,
                                  size: 12.0,
                                ),
                                options: FFButtonOptions(
                                  width: 150.0,
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.0, 0.0, 2.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF863DFF),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 1.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'prq5kn4s' /* End time */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: dateTimeFormat(
                                  'jm',
                                  functions.dynamicEnd(FFAppState().time,
                                      FFAppState().starttime),
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                icon: Icon(
                                  Icons.access_time_sharp,
                                  size: 12.0,
                                ),
                                options: FFButtonOptions(
                                  width: 150.0,
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.0, 0.0, 2.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFFF5858),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 1.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 8.0,
                      height: MediaQuery.sizeOf(context).height * 1.5,
                      child: custom_widgets.TestWidgetNew(
                        key: testWidgetKey,
                         width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        questions: FFAppState().questions.questionName,
                        questionimage: FFAppState().questions.questionimage,
                        answer1: FFAppState().questions.answer1,
                        answer2: FFAppState().questions.answer2,
                        answer3: FFAppState().questions.answer3,
                        answer4: FFAppState().questions.answer4,
                        questionid: FFAppState().questions.questionId,
                        answerimage1: FFAppState().questions.answerimage1,
                        answerimage2: FFAppState().questions.answerimage2,
                        answerimage3: FFAppState().questions.answerimage3,
                        answerimage4: FFAppState().questions.answerimage4,
                        questions2: FFAppState().questions.questionName2,
                        question2image: FFAppState().questions.questionImage2,
                        sectionbanswer1: FFAppState().questions.sectionBanswer1,
                        sectionbanswer2: FFAppState().questions.sectionBanswer2,
                        sectionbanswer3: FFAppState().questions.sectionBanswer3,
                        sectionbanswer4: FFAppState().questions.sectionBanswer4,
                        question2Id: FFAppState().questions.question2Id,
                        sectionbanswerimage1:
                            FFAppState().questions.sectionBanswerimage1,
                        sectionbanswerimage2:
                            FFAppState().questions.sectionBanswerimage2,
                        sectionbanswerimage3:
                            FFAppState().questions.sectionBanswerimage3,
                        sectionbanswerimage4:
                            FFAppState().questions.sectionBanswerimage4,
                        question3Id: FFAppState().questions.question3Id,
                        questions3: FFAppState().questions.questions3,
                        questionimage3: FFAppState().questions.question3image,
                        sectionCanswer1: FFAppState().questions.section3Answer1,
                        sectionCanswer2: FFAppState().questions.section3answer2,
                        sectionCanswer3: FFAppState().questions.section3answer3,
                        sectionCanswer4: FFAppState().questions.section3answer4,
                        sectionCanswerimage1:
                            FFAppState().questions.section3answerimage1,
                        sectionCanswerimage2:
                            FFAppState().questions.section3answerimage2,
                        sectionCanswerimage3:
                            FFAppState().questions.section3answerimage3,
                        sectionCanswerimage4:
                            FFAppState().questions.section3answerimage4,    
                        submit: () async {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
