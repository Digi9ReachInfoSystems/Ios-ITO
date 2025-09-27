import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/ordersshimmer/ordersshimmer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'subscription_model.dart';
export 'subscription_model.dart';

class SubscriptionWidget extends StatefulWidget {
  const SubscriptionWidget({
    super.key,
    required this.serviceName,
  });

  final String? serviceName;

  @override
  State<SubscriptionWidget> createState() => _SubscriptionWidgetState();
}

class _SubscriptionWidgetState extends State<SubscriptionWidget> {
  late SubscriptionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'subscription'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SUBSCRIPTION_subscription_ON_INIT_STATE');
      logFirebaseEvent('subscription_update_page_state');
      setState(() {
        _model.servicess = widget.serviceName!;
      });
    });
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
      future: SubcsriptionsCall.call(
        userId: FFAppState().userInfo.userId,
        stdId: FFAppState().userInfo.stdId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: const OrdersshimmerWidget(),
          );
        }
        final subscriptionSubcsriptionsResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                    logFirebaseEvent('SUBSCRIPTION_arrow_back_ios_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.pop();
                  },
                ),
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'r5v23md7' /* My Subscriptions */,
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final servicename = SubcsriptionsCall.subscriptions(
                                subscriptionSubcsriptionsResponse.jsonBody,
                              )?.toList() ??
                              [];
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(servicename.length,
                                  (servicenameIndex) {
                                final servicenameItem =
                                    servicename[servicenameIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'SUBSCRIPTION_PAGE_BUTTON_BTN_ON_TAP');
                                      logFirebaseEvent(
                                          'Button_update_page_state');
                                      setState(() {
                                        _model.servicess =
                                            valueOrDefault<String>(
                                          functions
                                              .jsontostringlist(getJsonField(
                                            servicenameItem,
                                            r'''$.serviceName''',
                                          )),
                                          'Monthly Test',
                                        );
                                      });
                                    },
                                    text: getJsonField(
                                      servicenameItem,
                                      r'''$.serviceName''',
                                    ).toString(),
                                    options: FFButtonOptions(
                                      height: functions.jsontostringlist(
                                                  getJsonField(
                                                servicenameItem,
                                                r'''$.serviceName''',
                                              )) ==
                                              _model.servicess
                                          ? 70.0
                                          : 60.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: valueOrDefault<Color>(
                                        functions.jsontostringlist(getJsonField(
                                                  servicenameItem,
                                                  r'''$.serviceName''',
                                                )) ==
                                                _model.servicess
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .alternate,
                                        FlutterFlowTheme.of(context).alternate,
                                      ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: valueOrDefault<Color>(
                                              functions.jsontostringlist(
                                                          getJsonField(
                                                        servicenameItem,
                                                        r'''$.serviceName''',
                                                      )) ==
                                                      _model.servicess
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                          ),
                                      elevation: 3.0,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Builder(
                            builder: (context) {
                              final subs = SubcsriptionsCall.products(
                                    subscriptionSubcsriptionsResponse.jsonBody,
                                  )
                                      ?.where((e) =>
                                          functions
                                              .jsontostringlist(getJsonField(
                                            e,
                                            r'''$.service_name''',
                                          )) ==
                                          _model.servicess)
                                      .toList()
                                      .toList() ??
                                  [];
                              return DataTable2(
                                columns: [
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'm36votur' /* Sr.No */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'lf8q88su' /* Subject Name */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '74ikobry' /* Purchase date */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'isa0zys0' /* Expiry Date */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                                rows: (subs as Iterable)
                                    .mapIndexed((subsIndex, subsItem) => [
                                          Text(
                                            functions.index(subsIndex).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                subsItem,
                                                r'''$.subject_name''',
                                              )?.toString(),
                                              'nxAX',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                subsItem,
                                                r'''$.purchase''',
                                              )?.toString(),
                                              '20-12-2023',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                subsItem,
                                                r'''$.expiry''',
                                              )?.toString(),
                                              '20-12-2023',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                        ].map((c) => DataCell(c)).toList())
                                    .map((e) => DataRow(cells: e))
                                    .toList(),
                                headingRowColor: WidgetStateProperty.all(
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                headingRowHeight: 56.0,
                                dataRowColor: WidgetStateProperty.all(
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                dataRowHeight: 80.0,
                                border: TableBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                dividerThickness: 2.0,
                                columnSpacing: 2.0,
                                showBottomBorder: true,
                                minWidth: 49.0,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
