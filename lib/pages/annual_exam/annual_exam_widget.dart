import '/backend/api_requests/api_calls.dart';
import '/components/empty_widget_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/shimmerservice/shimmerservice_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'annual_exam_model.dart';
export 'annual_exam_model.dart';

class AnnualExamWidget extends StatefulWidget {
  const AnnualExamWidget({
    super.key,
    this.serviceid,
    String? choosenservice,
  }) : this.choosenservice = choosenservice ?? 'Test';

  final String? serviceid;
  final String choosenservice;

  static String routeName = 'annualExam';
  static String routePath = '/annualExam';

  @override
  State<AnnualExamWidget> createState() => _AnnualExamWidgetState();
}

class _AnnualExamWidgetState extends State<AnnualExamWidget>
    with TickerProviderStateMixin {
  late AnnualExamModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnnualExamModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'annualExam'});
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
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF272727),
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('ANNUAL_EXAM_arrow_back_rounded_ICN_ON_TA');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 20.0),
            child: Text(
              functions.removehyphen(widget.choosenservice),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.outfit(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Color(0xFF272727),
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
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
            children: [
              Expanded(
                child: FutureBuilder<ApiCallResponse>(
                  future: SubjectsCall.call(
                    stdId: valueOrDefault<String>(
                      FFAppState().userInfo.stdId,
                      '9',
                    ),
                    userId: valueOrDefault<String>(
                      FFAppState().userInfo.userId,
                      '255735',
                    ),
                    serviceId: valueOrDefault<String>(
                      widget.serviceid,
                      '1',
                    ),
                    token: FFAppState().userInfo.token,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return ShimmerserviceWidget();
                    }
                    final containerSubjectsResponse = snapshot.data!;

                    return Container(
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: FlutterFlowButtonTabBar(
                              useToggleButtonStyle: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                              unselectedLabelStyle: TextStyle(),
                              labelColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              unselectedBackgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              unselectedBorderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              elevation: 0.0,
                              buttonMargin: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              padding: EdgeInsets.all(4.0),
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'ymw2w5bt' /* Round 1 */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '9fxheure' /* Round 2 */,
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
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 15.0),
                                  child: Builder(
                                    builder: (context) {
                                      final children =
                                          SubjectsCall.productsByservice(
                                                containerSubjectsResponse
                                                    .jsonBody,
                                              )
                                                  ?.where((e) =>
                                                      functions
                                                          .jsontostringlist(
                                                              getJsonField(
                                                        e,
                                                        r'''$.round''',
                                                      )) ==
                                                      '1')
                                                  .toList()
                                                  .toList() ??
                                              [];
                                      if (children.isEmpty) {
                                        return EmptyWidgetWidget(
                                          datatype: 'Annual Exam',
                                        );
                                      }

                                      return MasonryGridView.builder(
                                        gridDelegate:
                                            SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              MediaQuery.sizeOf(context).width <
                                                      500.0
                                                  ? 2
                                                  : 4,
                                        ),
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        itemCount: children.length,
                                        itemBuilder: (context, childrenIndex) {
                                          final childrenItem =
                                              children[childrenIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ANNUAL_EXAM_Container_6j40vfz3_ON_TAP');
                                              if ((functions.jsontostringlist(
                                                          getJsonField(
                                                        childrenItem,
                                                        r'''$.subject_alias''',
                                                      )) ==
                                                      'Drawing') ||
                                                  (functions.jsontostringlist(
                                                          getJsonField(
                                                        childrenItem,
                                                        r'''$.subject_alias''',
                                                      )) ==
                                                      'Essay')) {
                                                logFirebaseEvent(
                                                    'Container_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: Text('Alert!'),
                                                        content: Text(
                                                            'Tests will be conducted on our website'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  AnnualExamStartWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'subjectid': serializeParam(
                                                      getJsonField(
                                                        childrenItem,
                                                        r'''$.subject_id''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'serviceid': serializeParam(
                                                      widget.serviceid,
                                                      ParamType.String,
                                                    ),
                                                    'choosensubject':
                                                        serializeParam(
                                                      getJsonField(
                                                        childrenItem,
                                                        r'''$.subject_name''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'alias': serializeParam(
                                                      getJsonField(
                                                        childrenItem,
                                                        r'''$.subject_alias''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'round': serializeParam(
                                                      '1',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 5.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                        color: functions.jsontostringlist(
                                                                    getJsonField(
                                                                  childrenItem,
                                                                  r'''$.subscription_status''',
                                                                )) ==
                                                                'Subscribed'
                                                            ? Color(0xFF9868FF)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12.0),
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              childrenItem,
                                                              r'''$.subscription_status''',
                                                            ).toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: functions.jsontostringlist(
                                                                              getJsonField(
                                                                            childrenItem,
                                                                            r'''$.subscription_status''',
                                                                          )) ==
                                                                          'Subscribed'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  fontSize:
                                                                      16.0,
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
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          getJsonField(
                                                            childrenItem,
                                                            r'''$.subject_icon''',
                                                          ).toString(),
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.15,
                                                          fit: BoxFit.scaleDown,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    childrenItem,
                                                                    r'''$.title''',
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .readexPro(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 15.0),
                                  child: Builder(
                                    builder: (context) {
                                      final children = SubjectsCall
                                                  .productsByservice(
                                            containerSubjectsResponse.jsonBody,
                                          )
                                              ?.where((e) =>
                                                  (SubjectsCall.qaulified(
                                                        containerSubjectsResponse
                                                            .jsonBody,
                                                      )?.contains(getJsonField(
                                                        e,
                                                        r'''$.subject_id''',
                                                      ).toString()) ==
                                                      true) &&
                                                  (functions.jsontostringlist(
                                                          getJsonField(
                                                        e,
                                                        r'''$.round''',
                                                      )) ==
                                                      '2'))
                                              .toList()
                                              .toList() ??
                                          [];
                                      if (children.isEmpty) {
                                        return Center(
                                          child: EmptyWidgetWidget(
                                            datatype: 'Annual Exam',
                                          ),
                                        );
                                      }

                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              MediaQuery.sizeOf(context).width <
                                                      500.0
                                                  ? 2
                                                  : 4,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 12.0,
                                          childAspectRatio: 0.8,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: children.length,
                                        itemBuilder: (context, childrenIndex) {
                                          final childrenItem =
                                              children[childrenIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ANNUAL_EXAM_Container_ttq8bja4_ON_TAP');
                                              if ((functions.jsontostringlist(
                                                          getJsonField(
                                                        childrenItem,
                                                        r'''$.subject_alias''',
                                                      )) ==
                                                      'Drawing') ||
                                                  (functions.jsontostringlist(
                                                          getJsonField(
                                                        childrenItem,
                                                        r'''$.subject_alias''',
                                                      )) ==
                                                      'Essay')) {
                                                logFirebaseEvent(
                                                    'Container_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: Text('Alert!'),
                                                        content: Text(
                                                            'Tests will be conducted on our website'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  AnnualExamStartWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'subjectid': serializeParam(
                                                      getJsonField(
                                                        childrenItem,
                                                        r'''$.subject_id''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'serviceid': serializeParam(
                                                      widget.serviceid,
                                                      ParamType.String,
                                                    ),
                                                    'choosensubject':
                                                        serializeParam(
                                                      getJsonField(
                                                        childrenItem,
                                                        r'''$.subject_name''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'alias': serializeParam(
                                                      getJsonField(
                                                        childrenItem,
                                                        r'''$.subject_alias''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'round': serializeParam(
                                                      '2',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 5.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                        color: functions.jsontostringlist(
                                                                    getJsonField(
                                                                  childrenItem,
                                                                  r'''$.subscription_status''',
                                                                )) ==
                                                                'Subscribed'
                                                            ? Color(0xFF9868FF)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12.0),
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              childrenItem,
                                                              r'''$.subscription_status''',
                                                            ).toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: functions.jsontostringlist(
                                                                              getJsonField(
                                                                            childrenItem,
                                                                            r'''$.subscription_status''',
                                                                          )) ==
                                                                          'Subscribed'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  fontSize:
                                                                      16.0,
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
                                                        ),
                                                      ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        getJsonField(
                                                          childrenItem,
                                                          r'''$.subject_icon''',
                                                        ).toString(),
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.15,
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            5.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    childrenItem,
                                                                    r'''$.title''',
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .readexPro(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ANNUAL_EXAM_PAGE_BUY_NOW_BTN_ON_TAP');
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed(ProductsmenuWidget.routeName);
                  },
                  text: FFLocalizations.of(context).getText(
                    'b7cvfov7' /* Buy Now */,
                  ),
                  options: FFButtonOptions(
                    width: 343.0,
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 10.0)).around(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
