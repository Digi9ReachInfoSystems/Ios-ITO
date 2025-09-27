import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/special_offershimeer/special_offershimeer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'notices_model.dart';
export 'notices_model.dart';

class NoticesWidget extends StatefulWidget {
  const NoticesWidget({super.key});

  @override
  State<NoticesWidget> createState() => _NoticesWidgetState();
}

class _NoticesWidgetState extends State<NoticesWidget>
    with TickerProviderStateMixin {
  late NoticesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoticesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'notices'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
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
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('NOTICES_PAGE_arrow_back_ios_ICN_ON_TAP');
                logFirebaseEvent('IconButton_navigate_back');
                context.pop();
              },
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '3a2g8wen' /* Notice Board */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.black,
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
          child: FutureBuilder<ApiCallResponse>(
            future: NoticesCall.call(
              stdId: valueOrDefault<String>(
                FFAppState().userInfo.stdId,
                '1',
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return const SpecialOffershimeerWidget();
              }
              final tabBarNoticesResponse = snapshot.data!;
              return Column(
                children: [
                  Align(
                    alignment: const Alignment(0.0, 0),
                    child: TabBar(
                      labelColor: FlutterFlowTheme.of(context).primary,
                      unselectedLabelColor: const Color(0xFF009FE0),
                      labelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Readex Pro',
                                fontWeight: FontWeight.w600,
                              ),
                      unselectedLabelStyle: const TextStyle(),
                      indicatorColor: FlutterFlowTheme.of(context).primary,
                      padding: const EdgeInsets.all(4.0),
                      tabs: [
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'kjtra433' /* Monthly */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'p8rd8s7e' /* Annual */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'tysktm7o' /* Ecopy */,
                          ),
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Builder(
                            builder: (context) {
                              final monthly = NoticesCall.monthly(
                                    tabBarNoticesResponse.jsonBody,
                                  )?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: monthly.length,
                                itemBuilder: (context, monthlyIndex) {
                                  final monthlyItem = monthly[monthlyIndex];
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.2,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          functions.color(monthlyIndex),
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text(
                                                  getJsonField(
                                                    monthlyItem,
                                                    r'''$.title''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    getJsonField(
                                                      monthlyItem,
                                                      r'''$.content''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(1.0, 1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 20.0, 5.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'NOTICES_PAGE_READ_MORE_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_launch_u_r_l');
                                                  await launchURL(getJsonField(
                                                    monthlyItem,
                                                    r'''$.file_path''',
                                                  ).toString());
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'e6wtkp3w' /* Read More */,
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
                                                      .secondaryBackground,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall,
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Builder(
                            builder: (context) {
                              final annualy = NoticesCall.annual(
                                    tabBarNoticesResponse.jsonBody,
                                  )?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: annualy.length,
                                itemBuilder: (context, annualyIndex) {
                                  final annualyItem = annualy[annualyIndex];
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.2,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          functions.color(annualyIndex),
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text(
                                                  getJsonField(
                                                    annualyItem,
                                                    r'''$.title''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    getJsonField(
                                                      annualyItem,
                                                      r'''$.content''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(1.0, 1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 20.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'NOTICES_PAGE_READ_MORE_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_launch_u_r_l');
                                                  await launchURL(getJsonField(
                                                    annualyItem,
                                                    r'''$.file_path''',
                                                  ).toString());
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '9l8n24wf' /* Read More */,
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
                                                      .secondaryBackground,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall,
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Builder(
                            builder: (context) {
                              final instructions = NoticesCall.instructions(
                                    tabBarNoticesResponse.jsonBody,
                                  )?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: instructions.length,
                                itemBuilder: (context, instructionsIndex) {
                                  final instructionsItem =
                                      instructions[instructionsIndex];
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.2,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          functions.color(instructionsIndex),
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: const BoxDecoration(),
                                                    child: Text(
                                                      getJsonField(
                                                        instructionsItem,
                                                        r'''$.title''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: const BoxDecoration(),
                                                    child: Text(
                                                      getJsonField(
                                                        instructionsItem,
                                                        r'''$.content''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(1.0, 1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 20.0, 5.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'NOTICES_PAGE_READ_MORE_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_launch_u_r_l');
                                                  await launchURL(getJsonField(
                                                    instructionsItem,
                                                    r'''$.file_path''',
                                                  ).toString());
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'dhw6vntt' /* Read More */,
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
                                                      .secondaryBackground,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall,
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
