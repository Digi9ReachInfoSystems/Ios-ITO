import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'results_model.dart';
export 'results_model.dart';

class ResultsWidget extends StatefulWidget {
  const ResultsWidget({super.key});

  @override
  State<ResultsWidget> createState() => _ResultsWidgetState();
}

class _ResultsWidgetState extends State<ResultsWidget> {
  late ResultsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'results'});
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
              logFirebaseEvent('RESULTS_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'vj4qh330' /* Result */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF272727),
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FutureBuilder<ApiCallResponse>(
                  future: ResultsCall.call(
                    mobile: FFAppState().userInfo.mobileNo,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final dataTableResultsResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final result = ResultsCall.resultdata(
                              dataTableResultsResponse.jsonBody,
                            )?.toList() ??
                            [];
                        return DataTable2(
                          columns: [
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '5l0bjwvu' /* Subject */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelLarge,
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '0ra0d9dd' /* Score */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelLarge,
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '7wf3q826' /* Remark */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 15.0,
                                      ),
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'tz0i2ur5' /* Topper */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelLarge,
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'qt6isp12' /* Action  */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelLarge,
                                ),
                              ),
                            ),
                          ],
                          rows: (result as Iterable)
                              .mapIndexed((resultIndex, resultItem) => [
                                    Container(
                                      decoration: const BoxDecoration(),
                                      child: Text(
                                        getJsonField(
                                          resultItem,
                                          r'''$.subject''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 10.0,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      getJsonField(
                                        resultItem,
                                        r'''$.score''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 10.0,
                                          ),
                                    ),
                                    Text(
                                      getJsonField(
                                        resultItem,
                                        r'''$.Remark''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 10.0,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        getJsonField(
                                          resultItem,
                                          r'''$.topper''',
                                        )?.toString(),
                                        '\" \"',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 10.0,
                                          ),
                                    ),
                                    Visibility(
                                      visible: getJsonField(
                                        resultItem,
                                        r'''$.qualified''',
                                      ),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'RESULTS_PAGE_REGISTER_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context
                                              .pushNamed('roundregistration');
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'zp0dxc0f' /* Register */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
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
                                      ),
                                    ),
                                  ].map((c) => DataCell(c)).toList())
                              .map((e) => DataRow(cells: e))
                              .toList(),
                          headingRowColor: WidgetStateProperty.all(
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          headingRowHeight: 56.0,
                          dataRowColor: WidgetStateProperty.all(
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          dataRowHeight: 65.0,
                          border: TableBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          dividerThickness: 1.0,
                          columnSpacing: 10.0,
                          showBottomBorder: true,
                          minWidth: 49.0,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
