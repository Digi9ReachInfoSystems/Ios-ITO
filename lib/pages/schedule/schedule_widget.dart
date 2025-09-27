

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/testshimmer/testshimmer_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/timelinewidgetdatatype.dart' as custom_widgets;
import '/custom_code/widgets/timelinewidget.dart' as custom_widgets;

import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'schedule_model.dart';
export 'schedule_model.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({super.key});

  @override
  _ScheduleWidgetState createState() => _ScheduleWidgetState();
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
      logFirebaseEvent('schedule_backend_call');
      _model.apiResultqqp = await ScheduleCall.call(
        stdId: FFAppState().userInfo.stdId,
        serviceId: '2',
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
        setState(() {
          FFAppState().slot1annual =
              _model.slot11!.toList().cast<TimelinedocumentStruct>();
          FFAppState().slot2annual =
              _model.slot22!.toList().cast<TimelinedocumentStruct>();
        });
      } else {
        logFirebaseEvent('schedule_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              title: const Text('failed'),
              content: const Text('Not Scheduled yet'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            ));
          },
        );
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
          title: Align(
            alignment: const AlignmentDirectional(0.00, 0.00),
            child: Text(
              FFLocalizations.of(context).getText(
                'ur85jst5' /* Schedule */,
              ),
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
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
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: const Alignment(0.0, 0),
                        child: FlutterFlowButtonTabBar(
                          useToggleButtonStyle: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                  ),
                          unselectedLabelStyle: const TextStyle(),
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          backgroundColor: Colors.white,
                          unselectedBackgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          unselectedBorderColor:
                              FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 15.0,
                          elevation: 0.0,
                          buttonMargin: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              4.0, 4.0, 4.0, 4.0),
                          tabs: [
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'u6rknuzx' /* Annually */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'pjoyr1ma' /* Monthly */,
                              ),
                            ),
                          ],
                          controller: _model.tabBarController,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            FutureBuilder<ApiCallResponse>(
                              future: ScheduleCall.call(
                                stdId: FFAppState().userInfo.stdId,
                                serviceId: '2',
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return const TestshimmerWidget();
                                }
                                final columnScheduleResponse = snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (_model.pageViewCurrentIndex1 == 0)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'SCHEDULE_PAGE_SLOT_1_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_page_view');
                                                  await _model
                                                      .pageViewController1
                                                      ?.animateToPage(
                                                    0,
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '4ty88jva' /* Slot 1 */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                          if (_model.pageViewCurrentIndex1 == 1)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'SCHEDULE_PAGE_SLOT_1_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_page_view');
                                                  await _model
                                                      .pageViewController1
                                                      ?.animateToPage(
                                                    0,
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'i4ta3xs4' /* Slot 1 */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                          if (_model.pageViewCurrentIndex1 == 1)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'SCHEDULE_PAGE_SLOT_2_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_page_view');
                                                  await _model
                                                      .pageViewController1
                                                      ?.animateToPage(
                                                    1,
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'cd3iwrym' /* Slot 2 */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                          if (_model.pageViewCurrentIndex1 == 0)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'SCHEDULE_PAGE_SLOT_2_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_page_view');
                                                  await _model
                                                      .pageViewController1
                                                      ?.animateToPage(
                                                    1,
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'wzhklxll' /* Slot 2 */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 500.0,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 40.0),
                                              child: PageView(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                controller: _model
                                                        .pageViewController1 ??=
                                                    PageController(
                                                        initialPage: 0),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                children: [
                                                  SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    child: custom_widgets
                                                        .Timelinewidgetdatatype(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      timrlinewidget:
                                                          FFAppState()
                                                              .slot1annual,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    child: custom_widgets
                                                        .Timelinewidgetdatatype(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      timrlinewidget:
                                                          FFAppState()
                                                              .slot2annual,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.00, -1.00),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 16.0),
                                                child: smooth_page_indicator
                                                    .SmoothPageIndicator(
                                                  controller: _model
                                                          .pageViewController1 ??=
                                                      PageController(
                                                          initialPage: 0),
                                                  count: 2,
                                                  axisDirection:
                                                      Axis.horizontal,
                                                  onDotClicked: (i) async {
                                                    await _model
                                                        .pageViewController1!
                                                        .animateToPage(
                                                      i,
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.ease,
                                                    );
                                                  },
                                                  effect: smooth_page_indicator
                                                      .ExpandingDotsEffect(
                                                    expansionFactor: 3.0,
                                                    spacing: 8.0,
                                                    radius: 16.0,
                                                    dotWidth: 16.0,
                                                    dotHeight: 8.0,
                                                    dotColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    activeDotColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    paintStyle:
                                                        PaintingStyle.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            FutureBuilder<ApiCallResponse>(
                              future: ScheduleCall.call(
                                stdId: FFAppState().userInfo.stdId,
                                serviceId: '1',
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return const TestshimmerWidget();
                                }
                                final columnScheduleResponse = snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'SCHEDULE_PAGE_G_K_&_ESSAY_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_page_view');
                                                await _model.pageViewController2
                                                    ?.animateToPage(
                                                  0,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '8dlxc90l' /* GK & Essay */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        3.0, 3.0, 3.0, 3.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'SCHEDULE_ENGLISH_&_DRAWING_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_page_view');
                                                await _model.pageViewController2
                                                    ?.animateToPage(
                                                  1,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'dlhjtg0k' /* English & Drawing */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 4.0, 4.0, 4.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'SCHEDULE_PAGE_SCIENCE_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_page_view');
                                                await _model.pageViewController2
                                                    ?.animateToPage(
                                                  2,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'xad3ap9j' /* Science */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'SCHEDULE_PAGE_MATHS_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_page_view');
                                                await _model.pageViewController2
                                                    ?.animateToPage(
                                                  3,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'c6w79sqe' /* Maths */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: const Color(0xFF489965),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 500.0,
                                      decoration: const BoxDecoration(),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 500.0,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 40.0),
                                              child: PageView(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                controller: _model
                                                        .pageViewController2 ??=
                                                    PageController(
                                                        initialPage: 0),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                children: [
                                                  SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    child: custom_widgets
                                                        .Timelinewidget(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      dates: (ScheduleCall.gk(
                                                        columnScheduleResponse
                                                            .jsonBody,
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList(),
                                                      subjects: (ScheduleCall
                                                              .gk(
                                                        columnScheduleResponse
                                                            .jsonBody,
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList(),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    child: custom_widgets
                                                        .Timelinewidget(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      dates: (ScheduleCall
                                                              .drawing(
                                                        columnScheduleResponse
                                                            .jsonBody,
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList(),
                                                      subjects: (ScheduleCall
                                                              .drawing(
                                                        columnScheduleResponse
                                                            .jsonBody,
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList(),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    child: custom_widgets
                                                        .Timelinewidget(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      dates: (ScheduleCall
                                                              .science(
                                                        columnScheduleResponse
                                                            .jsonBody,
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList(),
                                                      subjects: (ScheduleCall
                                                              .science(
                                                        columnScheduleResponse
                                                            .jsonBody,
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList(),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    child: custom_widgets
                                                        .Timelinewidget(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      dates: (ScheduleCall
                                                              .maths(
                                                        columnScheduleResponse
                                                            .jsonBody,
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList(),
                                                      subjects: (ScheduleCall
                                                              .maths(
                                                        columnScheduleResponse
                                                            .jsonBody,
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.00, -1.00),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 16.0),
                                                child: smooth_page_indicator
                                                    .SmoothPageIndicator(
                                                  controller: _model
                                                          .pageViewController2 ??=
                                                      PageController(
                                                          initialPage: 0),
                                                  count: 4,
                                                  axisDirection:
                                                      Axis.horizontal,
                                                  onDotClicked: (i) async {
                                                    await _model
                                                        .pageViewController2!
                                                        .animateToPage(
                                                      i,
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.ease,
                                                    );
                                                  },
                                                  effect: smooth_page_indicator
                                                      .ExpandingDotsEffect(
                                                    expansionFactor: 3.0,
                                                    spacing: 8.0,
                                                    radius: 16.0,
                                                    dotWidth: 16.0,
                                                    dotHeight: 8.0,
                                                    dotColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    activeDotColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    paintStyle:
                                                        PaintingStyle.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
