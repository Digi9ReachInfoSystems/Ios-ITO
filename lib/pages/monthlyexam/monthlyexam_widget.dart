import '/backend/api_requests/api_calls.dart';
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
import 'monthlyexam_model.dart';
export 'monthlyexam_model.dart';

class MonthlyexamWidget extends StatefulWidget {
  const MonthlyexamWidget({
    super.key,
    this.serviceid,
    String? choosenservice,
  }) : this.choosenservice = choosenservice ?? 'Test';

  final String? serviceid;
  final String choosenservice;

  static String routeName = 'monthlyexam';
  static String routePath = '/monthlyexam';

  @override
  State<MonthlyexamWidget> createState() => _MonthlyexamWidgetState();
}

class _MonthlyexamWidgetState extends State<MonthlyexamWidget> {
  late MonthlyexamModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthlyexamModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'monthlyexam'});
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
              logFirebaseEvent('MONTHLYEXAM_arrow_back_rounded_ICN_ON_TA');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
          title: Text(
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
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 15.0),
                        child: Builder(
                          builder: (context) {
                            final children = SubjectsCall.productsByservice(
                                  containerSubjectsResponse.jsonBody,
                                )?.toList() ??
                                [];

                            return MasonryGridView.builder(
                              gridDelegate:
                                  SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    MediaQuery.sizeOf(context).width < 500.0
                                        ? 2
                                        : 4,
                              ),
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              itemCount: children.length,
                              itemBuilder: (context, childrenIndex) {
                                final childrenItem = children[childrenIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MONTHLYEXAM_Container_ht6xftzw_ON_TAP');
                                    if (((SubjectsCall.alias(
                                              containerSubjectsResponse
                                                  .jsonBody,
                                            )?.elementAtOrNull(
                                                childrenIndex)) ==
                                            'Drawing') ||
                                        ((SubjectsCall.alias(
                                              containerSubjectsResponse
                                                  .jsonBody,
                                            )?.elementAtOrNull(
                                                childrenIndex)) ==
                                            'Essay')) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
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
                                      logFirebaseEvent('Container_navigate_to');

                                      context.pushNamed(
                                        AnnualExamStartWidget.routeName,
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
                                          'choosensubject': serializeParam(
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
                                            getJsonField(
                                              childrenItem,
                                              r'''$.round''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 7.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    functions.jsontostringlist(
                                                                getJsonField(
                                                              childrenItem,
                                                              r'''$.subscription_status''',
                                                            )) ==
                                                            'Subscribed'
                                                        ? Color(0xFF9868FF)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                  topRight:
                                                      Radius.circular(12.0),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    childrenItem,
                                                    r'''$.subscription_status''',
                                                  ).toString(),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
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
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12.0),
                                                  bottomRight:
                                                      Radius.circular(12.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 15.0),
                                                    child: ClipRRect(
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
                                                                0.1,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Text(
                                                      getJsonField(
                                                        childrenItem,
                                                        r'''$.subject_name''',
                                                      ).toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                ],
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
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('MONTHLYEXAM_PAGE_BUY_NOW_BTN_ON_TAP');
                    if (widget.choosenservice == 'summer-quiz-competition') {
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(SummerquizWidget.routeName);
                    } else {
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(ProductsmenuWidget.routeName);
                    }
                  },
                  text: FFLocalizations.of(context).getText(
                    'wmg69ah6' /* Buy Now */,
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
