import '/backend/api_requests/api_calls.dart';
import '/components/celebrations_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'round2result_model.dart';
export 'round2result_model.dart';

class Round2resultWidget extends StatefulWidget {
  const Round2resultWidget({super.key});

  @override
  State<Round2resultWidget> createState() => _Round2resultWidgetState();
}

class _Round2resultWidgetState extends State<Round2resultWidget> {
  late Round2resultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Round2resultModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'round2result'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: RoundresultsCall.call(
        userId: FFAppState().userInfo.userId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: CelebrationsWidget(),
          );
        }
        final round2resultRoundresultsResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.sizeOf(context).height * 0.15),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).warning,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'ROUND2RESULT_arrow_back_rounded_ICN_ON_T');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.pop();
                  },
                ),
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  "Congratulations",
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0x97FF0101),
                                        fontSize: 26.0,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Text(
                                  FFAppState().userInfo.studentName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        fontSize: 23.0,
                                      ),
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                        Lottie.asset(
                          'assets/lottie_animations/Animation_-_1709374341378.json',
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                          animate: true,
                        ),
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
                elevation: 2.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Builder(
                builder: (context) {
                  final results = RoundresultsCall.results(
                        round2resultRoundresultsResponse.jsonBody,
                      )?.toList() ??
                      [];
                  return FlutterFlowDataTable<dynamic>(
                    controller: _model.paginatedDataTableController,
                    data: results,
                    columnsBuilder: (onSortChanged) => [
                      DataColumn2(
                        label: DefaultTextStyle.merge(
                          softWrap: true,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'zqlo4x42' /* Subject  */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                          ),
                        ),
                      ),
                      DataColumn2(
                        label: DefaultTextStyle.merge(
                          softWrap: true,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'hbqawvkf' /* Round 1 Score
(%) */
                              ,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 14.0,
                                ),
                          ),
                        ),
                      ),
                      DataColumn2(
                        label: DefaultTextStyle.merge(
                          softWrap: true,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '2ytpxpva' /* State Rank R2 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 14.0,
                                ),
                          ),
                        ),
                      ),
                      DataColumn2(
                        label: DefaultTextStyle.merge(
                          softWrap: true,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'xiq73b2w' /* Award */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                          ),
                        ),
                      ),
                      DataColumn2(
                        label: DefaultTextStyle.merge(
                          softWrap: true,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '6pfbm3ma' /* Action */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                          ),
                        ),
                      ),
                    ],
                    dataRowBuilder: (resultsItem, resultsIndex, selected,
                            onSelectChanged) =>
                        DataRow(
                      color: MaterialStateProperty.all(
                        resultsIndex % 2 == 0
                            ? FlutterFlowTheme.of(context).secondaryBackground
                            : FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      cells: [
                        Text(
            getJsonField(
                      resultsItem,
                      r'''$.subject''',
                    ) ==
                    null
                ? '  '
                : getJsonField(
                    resultsItem,
                    r'''$.subject''',
                  ).toString(),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                ),
          ),
                        Text(
            getJsonField(
                      resultsItem,
                      r'''$.round_1_score''',
                    ) ==
                    null
                ? '  '
                : getJsonField(
                    resultsItem,
                    r'''$.round_1_score''',
                  ).toString(),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                ),
          ),
                         Text(
            getJsonField(
                      resultsItem,
                      r'''$.rank''',
                    ) ==
                    null
                ? '  '
                : getJsonField(
                    resultsItem,
                    r'''$.rank''',
                  ).toString(),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                ),
          ),
                         Text(
            getJsonField(
                      resultsItem,
                      r'''$.award''',
                    ) ==
                    null
                ? '  '
                : getJsonField(
                    resultsItem,
                    r'''$.award''',
                  ).toString(),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                ),
          ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'ROUND2RESULT_PAGE_CERTIFICATE_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              'certificateViewer',
                              queryParameters: {
                                'resultId': serializeParam(
                                  getJsonField(
                                    resultsItem,
                                    r'''$.result_id''',
                                  ).toString(),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            '2dk2arzo' /* Certificate */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                1.0, 0.0, 1.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).warning,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 10.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ].map((c) => DataCell(c)).toList(),
                    ),
                    paginated: false,
                    selectable: false,
                    headingRowHeight: 56.0,
                    dataRowHeight: 85.0,
                    columnSpacing: 8.0,
                    headingRowColor: FlutterFlowTheme.of(context).warning,
                    borderRadius: BorderRadius.circular(16.0),
                    addHorizontalDivider: true,
                    addTopAndBottomDivider: false,
                    hideDefaultHorizontalDivider: false,
                    horizontalDividerColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    horizontalDividerThickness: 10.0,
                    addVerticalDivider: true,
      verticalDividerColor: FlutterFlowTheme.of(context).alternate,
      verticalDividerThickness: 1,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
