import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/testshimmer/testshimmer_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

import 'schedule_model.dart';
export 'schedule_model.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({super.key});

  static String routeName = 'schedule';
  static String routePath = '/schedule';

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget>
    with TickerProviderStateMixin {
  late ScheduleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduleModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'schedule'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SCHEDULE_PAGE_schedule_ON_INIT_STATE');
      Function() _navigate = () {};
      logFirebaseEvent('schedule_backend_call');
      _model.validatetoken = await ValidateTokenCall.call(
        token: FFAppState().userInfo.token,
      );

      if ((_model.validatetoken?.succeeded ?? true)) {
        logFirebaseEvent('schedule_backend_call');
        _model.apiResultqqp = await ScheduleCall.call(
          stdId: FFAppState().userInfo.stdId,
          serviceId: '2',
          token: FFAppState().userInfo.token,
        );

        if ((_model.apiResultqqp?.succeeded ?? true)) {
          logFirebaseEvent('schedule_custom_action');
          _model.slot11 = await actions.jsomtotimelineslot1(
            ScheduleCall.slot1(
              (_model.apiResultqqp?.jsonBody ?? ''),
            )!
                .toList(),
          );
          logFirebaseEvent('schedule_custom_action');
          _model.slot22 = await actions.jsomtotimelineslot1(
            ScheduleCall.slot2(
              (_model.apiResultqqp?.jsonBody ?? ''),
            )!
                .toList(),
          );
          logFirebaseEvent('schedule_update_app_state');
          FFAppState().slot1annual =
              _model.slot11!.toList().cast<TimelinedocumentStruct>();
          FFAppState().slot2annual =
              _model.slot22!.toList().cast<TimelinedocumentStruct>();
          safeSetState(() {});
        } else {
          logFirebaseEvent('schedule_alert_dialog');
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  title: Text('failed'),
                  content: Text('Not Scheduled yet'),
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
        }
      } else {
        logFirebaseEvent('schedule_backend_call');
        _model.getnewtoken = await GetNewTokenCall.call(
          userID: FFAppState().userInfo.token,
        );

        if ((_model.getnewtoken?.succeeded ?? true)) {
          logFirebaseEvent('schedule_update_app_state');
          FFAppState().updateUserInfoStruct(
            (e) => e
              ..token = getJsonField(
                (_model.getnewtoken?.jsonBody ?? ''),
                r'''$.jwt_token''',
              ).toString(),
          );
          FFAppState().update(() {});
        } else {
          logFirebaseEvent('schedule_show_snack_bar');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Your session has expired. Please log in again to continue.',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).primary,
            ),
          );
          logFirebaseEvent('schedule_auth');
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          _navigate = () =>
              context.goNamedAuth(OnBoardingWidget.routeName, context.mounted);
        }
      }

      _navigate();
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              FFLocalizations.of(context).getText(
                'ur85jst5' /* Schedule */,
              ),
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    fontSize: 18,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0, 0),
                        child: FlutterFlowButtonTabBar(
                          useToggleButtonStyle: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 15,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                          unselectedLabelStyle: TextStyle(),
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          backgroundColor: Colors.white,
                          unselectedBackgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          unselectedBorderColor:
                              FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2,
                          borderRadius: 15,
                          elevation: 0,
                          buttonMargin:
                              EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          padding: EdgeInsets.all(4),
                          tabs: [
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                '0lhtqklb' /* Olympiad Exams */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'xz4fot1o' /* Saturday Tests */,
                              ),
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            FutureBuilder<ApiCallResponse>(
                              future: _model.yearlyschedule(
                                requestFn: () => ScheduleCall.call(
                                  stdId: FFAppState().userInfo.stdId,
                                  serviceId: '2',
                                  token: FFAppState().userInfo.token,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return TestshimmerWidget();
                                }
                                final columnScheduleResponse = snapshot.data!;

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 8),
                                        child: Builder(
                                          builder: (context) {
                                            final slot = functions
                                                .anualexamdynamicslot(
                                                    columnScheduleResponse
                                                        .jsonBody)
                                                .toList();

                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: List.generate(
                                                    slot.length, (slotIndex) {
                                                  final slotItem =
                                                      slot[slotIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SCHEDULE_PAGE_Container_e6bimogf_ON_TAP');
                                                      if (_model.selectedSlot !=
                                                          functions.index(
                                                              slotIndex)) {
                                                        logFirebaseEvent(
                                                            'Container_haptic_feedback');
                                                        HapticFeedback
                                                            .selectionClick();
                                                        logFirebaseEvent(
                                                            'Container_update_page_state');
                                                        _model.selectedSlot =
                                                            functions.index(
                                                                slotIndex);
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 150,
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                        color: functions.index(
                                                                    slotIndex) ==
                                                                _model
                                                                    .selectedSlot
                                                            ? Color(0xF753B5FD)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    10, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (functions.index(
                                                                    slotIndex) !=
                                                                _model
                                                                    .selectedSlot)
                                                              Icon(
                                                                Icons
                                                                    .radio_button_off_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 24,
                                                              ),
                                                            if (functions.index(
                                                                    slotIndex) ==
                                                                _model
                                                                    .selectedSlot)
                                                              Icon(
                                                                Icons
                                                                    .radio_button_checked_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 24,
                                                              ),
                                                            Text(
                                                              slotItem,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .readexPro(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      functions.index(slotIndex) ==
                                                                              _model
                                                                                  .selectedSlot
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .secondaryBackground
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                    fontSize:
                                                                        14,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 7)),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).divide(SizedBox(width: 10)),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height:
                                            MediaQuery.sizeOf(context).height,
                                        child: custom_widgets.Anualexamcalendar(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          height: double.infinity,
                                          examdata:
                                              columnScheduleResponse.jsonBody,
                                          slot: _model.selectedSlot!,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            FutureBuilder<ApiCallResponse>(
                              future: _model.monthlyschedule(
                                requestFn: () => ScheduleCall.call(
                                  stdId: FFAppState().userInfo.stdId,
                                  serviceId: '1',
                                  token: FFAppState().userInfo.token,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return TestshimmerWidget();
                                }
                                final columnScheduleResponse = snapshot.data!;

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: double.infinity,
                                        child:
                                            custom_widgets.Monthlyexamcalendar(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          height: double.infinity,
                                          monthlyexamdata:
                                              columnScheduleResponse.jsonBody,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
