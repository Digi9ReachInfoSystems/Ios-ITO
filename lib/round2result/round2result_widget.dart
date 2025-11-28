import '/backend/api_requests/api_calls.dart';
import '/components/celebrations_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'round2result_model.dart';
export 'round2result_model.dart';

class Round2resultWidget extends StatefulWidget {
  const Round2resultWidget({super.key});

  static String routeName = 'round2result';
  static String routePath = '/round2result';

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
        token: FFAppState().userInfo.token,
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
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.sizeOf(context).height * 0.1),
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
                            if ((RoundresultsCall.results(
                                          round2resultRoundresultsResponse
                                              .jsonBody,
                                        ) !=
                                        null &&
                                    (RoundresultsCall.results(
                                      round2resultRoundresultsResponse.jsonBody,
                                    ))!
                                        .isNotEmpty) ==
                                true)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'hx34s5iu' /* Congratulations */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0x97FF0101),
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  FFAppState().userInfo.studentName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Lottie.asset(
                          'assets/jsons/Animation_-_1709374341378.json',
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
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
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
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
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
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
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
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
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
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                    dataRowBuilder: (resultsItem, resultsIndex, selected,
                            onSelectChanged) =>
                        DataRow(
                      color: WidgetStateProperty.all(
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'ROUND2RESULT_VIEW_CERTIFICATE_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              CertificateViewerWidget.routeName,
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
                            '2dk2arzo' /* View Certificate */,
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
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 8.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
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
                    verticalDividerColor:
                        FlutterFlowTheme.of(context).alternate,
                    verticalDividerThickness: 1.0,
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
