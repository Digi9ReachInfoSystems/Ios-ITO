import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/shimmerservice/shimmerservice_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'monthlyexam_model.dart';
export 'monthlyexam_model.dart';

class MonthlyexamWidget extends StatefulWidget {
  const MonthlyexamWidget({
    super.key,
    this.serviceid,
    String? choosenservice,
  }) : choosenservice = choosenservice ?? 'Test';

  final String? serviceid;
  final String choosenservice;

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
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
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
          title: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 20.0),
            child: Text(
              functions.removehyphen(widget.choosenservice),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: const Color(0xFF272727),
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FutureBuilder<ApiCallResponse>(
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
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return const ShimmerserviceWidget();
                    }
                    final containerSubjectsResponse = snapshot.data!;
                    return Container(
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 15.0),
                        child: Builder(
                          builder: (context) {
                            final children = SubjectsCall.productsByservice(
                                  containerSubjectsResponse.jsonBody,
                                )?.toList() ??
                                [];
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 12.0,
                                childAspectRatio: 0.8,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
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
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('Alert!'),
                                              content: const Text(
                                                  'Tests will be conducted on our website'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      logFirebaseEvent('Container_navigate_to');

                                      context.pushNamed(
                                        'annualExamStart',
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
      alignment: const AlignmentDirectional(0, 0),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 45,
        decoration: BoxDecoration(
          color: functions.jsontostringlist(getJsonField(
                    childrenItem,
                    r'''$.subscription_status''',
                  )) ==
                  'Subscribed'
              ? const Color(0xFF9868FF)
              : FlutterFlowTheme.of(context).alternate,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Text(
            getJsonField(
              childrenItem,
              r'''$.subscription_status''',
            ).toString(),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  color: functions.jsontostringlist(getJsonField(
                            childrenItem,
                            r'''$.subscription_status''',
                          )) ==
                          'Subscribed'
                      ? FlutterFlowTheme.of(context).alternate
                      : FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 16,
                ),
          ),
        ),
      ),
    ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Column(
  mainAxisSize: MainAxisSize.max,
  children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        getJsonField(
          childrenItem,
          r'''$.subject_icon''',
        ).toString(),
        width: MediaQuery.sizeOf(context).width * 0.2,
        height: MediaQuery.sizeOf(context).height * 0.1,
        fit: BoxFit.cover,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        getJsonField(
          childrenItem,
          r'''$.subject_name''',
        ).toString(),
        textAlign: TextAlign.center,
        style: FlutterFlowTheme.of(context).bodyMedium,
      ),
    ),
  ],
)
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
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('MONTHLYEXAM_PAGE_BUY_NOW_BTN_ON_TAP');
                        if (widget.choosenservice == 'summer-quiz-competition') {
          logFirebaseEvent('Button_navigate_to');
          context.pushNamed('summerquiz');
        } else {
          logFirebaseEvent('Button_navigate_to');
          context.pushNamed('productsmenu');
        }
      },
                      text: FFLocalizations.of(context).getText(
                        'wmg69ah6' /* Buy Now */,
                      ),
                      options: FFButtonOptions(
                        width: 343.0,
                        height: 48.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 10.0)).around(const SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
