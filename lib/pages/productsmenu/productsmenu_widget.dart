import 'package:indian_talent_olympiad/backend/schema/structs/coupon_struct.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/special_offershimeer/special_offershimeer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'productsmenu_model.dart';
export 'productsmenu_model.dart';

class ProductsmenuWidget extends StatefulWidget {
  const ProductsmenuWidget({super.key});

  @override
  State<ProductsmenuWidget> createState() => _ProductsmenuWidgetState();
}

class _ProductsmenuWidgetState extends State<ProductsmenuWidget>
    with TickerProviderStateMixin {
  late ProductsmenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductsmenuModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'productsmenu'});
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
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: GetAllProductsCall.call(
        std: FFAppState().userInfo.stdId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const SpecialOffershimeerWidget(),
          );
        }
        final productsmenuGetAllProductsResponse = snapshot.data!;
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
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'pvowosuk' /* Special Offers */,
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
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
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.1,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'd06wd1d2' /* Monthly Test */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Container(
                                      height: 650.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: const Alignment(0.0, 0),
                                            child: TabBar(
                                              labelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              unselectedLabelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                              unselectedLabelStyle: const TextStyle(),
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              padding: const EdgeInsets.all(4.0),
                                              tabs: [
                                                Tab(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'i9c93ejf' /* 3 months */,
                                                  ),
                                                ),
                                                Tab(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '1cz44jqn' /* 6 Months */,
                                                  ),
                                                ),
                                                Tab(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '9wc3vk3m' /* 1 Year */,
                                                  ),
                                                ),
                                              ],
                                              controller:
                                                  _model.tabBarController,
                                              onTap: (i) async {
                                                [
                                                  () async {},
                                                  () async {},
                                                  () async {}
                                                ][i]();
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              controller:
                                                  _model.tabBarController,
                                              children: [
                                                Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final subProducts =
                                                          GetAllProductsCall
                                                                  .monthsThree(
                                                                productsmenuGetAllProductsResponse
                                                                    .jsonBody,
                                                              )?.toList() ??
                                                              [];
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        primary: false,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            subProducts.length,
                                                        itemBuilder: (context,
                                                            subProductsIndex) {
                                                          final subProductsItem =
                                                              subProducts[
                                                                  subProductsIndex];
                                                          return Theme(
                                                            data: ThemeData(
                                                              unselectedWidgetColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                            ),
                                                            child:
                                                                CheckboxListTile(
                                                              value: _model
                                                                      .checkboxListTileValueMap1[
                                                                  subProductsItem] ??= FFAppState()
                                                                      .productids
                                                                      .contains(
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.product_id''',
                                                                      ).toString()) ==
                                                                  true,
                                                              onChanged:
                                                                  (newValue) async {
                                                                setState(() =>
                                                                    _model.checkboxListTileValueMap1[
                                                                            subProductsItem] =
                                                                        newValue!);
                                                                if (newValue!) {
                                                                  logFirebaseEvent(
                                                                      'PRODUCTSMENU_CheckboxListTile_9wf939ya_O');
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_app_state');
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                        .addToTotalcart(
                                                                            CartitemsStruct(
                                                                      productId:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.product_id''',
                                                                      ).toString(),
                                                                      productamount:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.INR''',
                                                                      ).toString(),
                                                                      productname:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.product_name''',
                                                                      ).toString(),
                                                                      producttypes:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.service_type''',
                                                                      ).toString(),
                                                                    ));
                                                                    FFAppState()
                                                                        .addToProductids(
                                                                            getJsonField(
                                                                      subProductsItem,
                                                                      r'''$.product_id''',
                                                                    ).toString());
                                                                    FFAppState()
                                                                            .couponscode =
                                                                        CouponStruct();
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_page_state');
                                                                  setState(() {
                                                                    _model.addToTotalAmount(
                                                                        subProductsItem
                                                                            .toString());
                                                                    _model.added =
                                                                        true;
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_app_state');
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                            .couponscode =
                                                                        CouponStruct();
                                                                    FFAppState()
                                                                        .applied = [];
                                                                    FFAppState()
                                                                            .discountamount =
                                                                        0.0;
                                                                    FFAppState()
                                                                            .finalamount =
                                                                        functions.minusdiscountamount(
                                                                            valueOrDefault<double>(
                                                                              functions.payableamount(FFAppState().cartvalue, FFAppState().deliveryfee),
                                                                              0.0,
                                                                            ),
                                                                            FFAppState().discountamount)!;
                                                                  });
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'PRODUCTSMENU_CheckboxListTile_9wf939ya_O');
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_app_state');
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                        .removeFromTotalcart(
                                                                            CartitemsStruct(
                                                                      productId:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.product_id''',
                                                                      ).toString(),
                                                                      productamount:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.INR''',
                                                                      ).toString(),
                                                                      productname:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.product_name''',
                                                                      ).toString(),
                                                                      producttypes:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.service_type''',
                                                                      ).toString(),
                                                                    ));
                                                                    FFAppState()
                                                                        .removeFromProductids(
                                                                            getJsonField(
                                                                      subProductsItem,
                                                                      r'''$.product_id''',
                                                                    ).toString());
                                                                    FFAppState()
                                                                            .cartvalue =
                                                                        valueOrDefault<
                                                                            double>(
                                                                      functions.finalcartamount(FFAppState()
                                                                          .totalcart
                                                                          .toList()),
                                                                      0.0,
                                                                    );
                                                                    FFAppState()
                                                                            .deliveryfee =
                                                                        valueOrDefault<
                                                                            double>(
                                                                      functions.getdelivery(FFAppState()
                                                                          .totalcart
                                                                          .toList()),
                                                                      0.0,
                                                                    );
                                                                    FFAppState()
                                                                            .finalamount =
                                                                        valueOrDefault<
                                                                            double>(
                                                                      functions.payableamount(
                                                                          FFAppState()
                                                                              .cartvalue,
                                                                          FFAppState()
                                                                              .deliveryfee),
                                                                      0.0,
                                                                    );
                                                                    FFAppState()
                                                                            .couponscode =
                                                                        CouponStruct();
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_page_state');
                                                                  setState(() {
                                                                    _model.removeFromTotalAmount(
                                                                        subProductsItem
                                                                            .toString());
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_app_state');
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                            .couponscode =
                                                                        CouponStruct();
                                                                    FFAppState()
                                                                        .applied = [];
                                                                    FFAppState()
                                                                            .discountamount =
                                                                        0.0;
                                                                    FFAppState()
                                                                            .finalamount =
                                                                        functions.minusdiscountamount(
                                                                            valueOrDefault<double>(
                                                                              functions.payableamount(FFAppState().cartvalue, FFAppState().deliveryfee),
                                                                              0.0,
                                                                            ),
                                                                            FFAppState().discountamount)!;
                                                                  });
                                                                }
                                                              },
                                                              title: Text(
                                                                getJsonField(
                                                                  subProductsItem,
                                                                  r'''$.product_name''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                              ),
                                                              subtitle: Text(
                                                                getJsonField(
                                                                  subProductsItem,
                                                                  r'''$.INR''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              checkColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              dense: false,
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final sixMonths =
                                                          GetAllProductsCall
                                                                  .sixMonths(
                                                                productsmenuGetAllProductsResponse
                                                                    .jsonBody,
                                                              )?.toList() ??
                                                              [];
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            sixMonths.length,
                                                        itemBuilder: (context,
                                                            sixMonthsIndex) {
                                                          final sixMonthsItem =
                                                              sixMonths[
                                                                  sixMonthsIndex];
                                                          return Theme(
                                                            data: ThemeData(
                                                              unselectedWidgetColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                            ),
                                                            child:
                                                                CheckboxListTile(
                                                              value: _model
                                                                      .checkboxListTileValueMap2[
                                                                  sixMonthsItem] ??= FFAppState()
                                                                      .productids
                                                                      .contains(
                                                                          getJsonField(
                                                                        sixMonthsItem,
                                                                        r'''$.product_id''',
                                                                      ).toString()) ==
                                                                  true,
                                                              onChanged:
                                                                  (newValue) async {
                                                                setState(() =>
                                                                    _model.checkboxListTileValueMap2[
                                                                            sixMonthsItem] =
                                                                        newValue!);
                                                                if (newValue!) {
                                                                  logFirebaseEvent(
                                                                      'PRODUCTSMENU_CheckboxListTile_l3k3oe8d_O');
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_app_state');
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                        .addToTotalcart(
                                                                            CartitemsStruct(
                                                                      productId:
                                                                          getJsonField(
                                                                        sixMonthsItem,
                                                                        r'''$.product_id''',
                                                                      ).toString(),
                                                                      productamount:
                                                                          getJsonField(
                                                                        sixMonthsItem,
                                                                        r'''$.INR''',
                                                                      ).toString(),
                                                                      productname:
                                                                          getJsonField(
                                                                        sixMonthsItem,
                                                                        r'''$.product_name''',
                                                                      ).toString(),
                                                                      producttypes:
                                                                          getJsonField(
                                                                        sixMonthsItem,
                                                                        r'''$.service_type''',
                                                                      ).toString(),
                                                                    ));
                                                                    FFAppState()
                                                                        .addToProductids(
                                                                            getJsonField(
                                                                      sixMonthsItem,
                                                                      r'''$.product_id''',
                                                                    ).toString());
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_app_state');
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                            .couponscode =
                                                                        CouponStruct();
                                                                    FFAppState()
                                                                        .applied = [];
                                                                    FFAppState()
                                                                            .discountamount =
                                                                        0.0;
                                                                    FFAppState()
                                                                            .finalamount =
                                                                        functions.minusdiscountamount(
                                                                            valueOrDefault<double>(
                                                                              functions.payableamount(FFAppState().cartvalue, FFAppState().deliveryfee),
                                                                              0.0,
                                                                            ),
                                                                            FFAppState().discountamount)!;
                                                                  });
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'PRODUCTSMENU_CheckboxListTile_l3k3oe8d_O');
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_app_state');
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                        .removeFromTotalcart(
                                                                            CartitemsStruct(
                                                                      productId:
                                                                          getJsonField(
                                                                        sixMonthsItem,
                                                                        r'''$.product_id''',
                                                                      ).toString(),
                                                                      productamount:
                                                                          getJsonField(
                                                                        sixMonthsItem,
                                                                        r'''$.INR''',
                                                                      ).toString(),
                                                                      productname:
                                                                          getJsonField(
                                                                        sixMonthsItem,
                                                                        r'''$.product_name''',
                                                                      ).toString(),
                                                                      producttypes:
                                                                          getJsonField(
                                                                        sixMonthsItem,
                                                                        r'''$.service_type''',
                                                                      ).toString(),
                                                                    ));
                                                                    FFAppState()
                                                                        .removeFromProductids(
                                                                            getJsonField(
                                                                      sixMonthsItem,
                                                                      r'''$.product_id''',
                                                                    ).toString());
                                                                    FFAppState()
                                                                            .cartvalue =
                                                                        valueOrDefault<
                                                                            double>(
                                                                      functions.finalcartamount(FFAppState()
                                                                          .totalcart
                                                                          .toList()),
                                                                      0.0,
                                                                    );
                                                                    FFAppState()
                                                                            .deliveryfee =
                                                                        valueOrDefault<
                                                                            double>(
                                                                      functions.getdelivery(FFAppState()
                                                                          .totalcart
                                                                          .toList()),
                                                                      0.0,
                                                                    );
                                                                    FFAppState()
                                                                            .finalamount =
                                                                        valueOrDefault<
                                                                            double>(
                                                                      functions.payableamount(
                                                                          FFAppState()
                                                                              .cartvalue,
                                                                          FFAppState()
                                                                              .deliveryfee),
                                                                      0.0,
                                                                    );
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_app_state');
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                            .couponscode =
                                                                        CouponStruct();
                                                                    FFAppState()
                                                                        .applied = [];
                                                                    FFAppState()
                                                                            .discountamount =
                                                                        0.0;
                                                                    FFAppState()
                                                                            .finalamount =
                                                                        functions.minusdiscountamount(
                                                                            valueOrDefault<double>(
                                                                              functions.payableamount(FFAppState().cartvalue, FFAppState().deliveryfee),
                                                                              0.0,
                                                                            ),
                                                                            FFAppState().discountamount)!;
                                                                  });
                                                                }
                                                              },
                                                              title: Text(
                                                                getJsonField(
                                                                  sixMonthsItem,
                                                                  r'''$.product_name''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                              ),
                                                              subtitle: Text(
                                                                getJsonField(
                                                                  sixMonthsItem,
                                                                  r'''$.INR''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              checkColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              dense: false,
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final subProducts =
                                                          GetAllProductsCall
                                                                  .oneYear(
                                                                productsmenuGetAllProductsResponse
                                                                    .jsonBody,
                                                              )?.toList() ??
                                                              [];
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            subProducts.length,
                                                        itemBuilder: (context,
                                                            subProductsIndex) {
                                                          final subProductsItem =
                                                              subProducts[
                                                                  subProductsIndex];
                                                          return Theme(
                                                            data: ThemeData(
                                                              unselectedWidgetColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                            ),
                                                            child:
                                                                CheckboxListTile(
                                                              value: _model
                                                                      .checkboxListTileValueMap3[
                                                                  subProductsItem] ??= FFAppState()
                                                                      .productids
                                                                      .contains(
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.product_id''',
                                                                      ).toString()) ==
                                                                  true,
                                                              onChanged:
                                                                  (newValue) async {
                                                                setState(() =>
                                                                    _model.checkboxListTileValueMap3[
                                                                            subProductsItem] =
                                                                        newValue!);
                                                                if (newValue!) {
                                                                  logFirebaseEvent(
                                                                      'PRODUCTSMENU_CheckboxListTile_oe8041yj_O');
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_app_state');
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                        .addToTotalcart(
                                                                            CartitemsStruct(
                                                                      productId:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.product_id''',
                                                                      ).toString(),
                                                                      productamount:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.INR''',
                                                                      ).toString(),
                                                                      productname:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.product_name''',
                                                                      ).toString(),
                                                                      producttypes:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.service_type''',
                                                                      ).toString(),
                                                                    ));
                                                                    FFAppState()
                                                                        .addToProductids(
                                                                            getJsonField(
                                                                      subProductsItem,
                                                                      r'''$.product_id''',
                                                                    ).toString());
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_app_state');
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                            .couponscode =
                                                                        CouponStruct();
                                                                    FFAppState()
                                                                        .applied = [];
                                                                    FFAppState()
                                                                            .discountamount =
                                                                        0.0;
                                                                    FFAppState()
                                                                            .finalamount =
                                                                        functions.minusdiscountamount(
                                                                            valueOrDefault<double>(
                                                                              functions.payableamount(FFAppState().cartvalue, FFAppState().deliveryfee),
                                                                              0.0,
                                                                            ),
                                                                            FFAppState().discountamount)!;
                                                                  });
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'PRODUCTSMENU_CheckboxListTile_oe8041yj_O');
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_app_state');
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                        .removeFromTotalcart(
                                                                            CartitemsStruct(
                                                                      productId:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.product_id''',
                                                                      ).toString(),
                                                                      productamount:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.INR''',
                                                                      ).toString(),
                                                                      productname:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.product_name''',
                                                                      ).toString(),
                                                                      producttypes:
                                                                          getJsonField(
                                                                        subProductsItem,
                                                                        r'''$.service_type''',
                                                                      ).toString(),
                                                                    ));
                                                                    FFAppState()
                                                                        .removeFromProductids(
                                                                            getJsonField(
                                                                      subProductsItem,
                                                                      r'''$.product_id''',
                                                                    ).toString());
                                                                    FFAppState()
                                                                            .cartvalue =
                                                                        valueOrDefault<
                                                                            double>(
                                                                      functions.finalcartamount(FFAppState()
                                                                          .totalcart
                                                                          .toList()),
                                                                      0.0,
                                                                    );
                                                                    FFAppState()
                                                                            .deliveryfee =
                                                                        valueOrDefault<
                                                                            double>(
                                                                      functions.getdelivery(FFAppState()
                                                                          .totalcart
                                                                          .toList()),
                                                                      0.0,
                                                                    );
                                                                    FFAppState()
                                                                            .finalamount =
                                                                        valueOrDefault<
                                                                            double>(
                                                                      functions.payableamount(
                                                                          FFAppState()
                                                                              .cartvalue,
                                                                          FFAppState()
                                                                              .deliveryfee),
                                                                      0.0,
                                                                    );
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_app_state');
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                            .couponscode =
                                                                        CouponStruct();
                                                                    FFAppState()
                                                                        .applied = [];
                                                                    FFAppState()
                                                                            .discountamount =
                                                                        0.0;
                                                                    FFAppState()
                                                                            .finalamount =
                                                                        functions.minusdiscountamount(
                                                                            valueOrDefault<double>(
                                                                              functions.payableamount(FFAppState().cartvalue, FFAppState().deliveryfee),
                                                                              0.0,
                                                                            ),
                                                                            FFAppState().discountamount)!;
                                                                  });
                                                                }
                                                              },
                                                              title: Text(
                                                                getJsonField(
                                                                  subProductsItem,
                                                                  r'''$.product_name''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                              ),
                                                              subtitle: Text(
                                                                getJsonField(
                                                                  subProductsItem,
                                                                  r'''$.INR''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              checkColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              dense: false,
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
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
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'PRODUCTSMENU_PAGE_Text_gku1z3dp_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_navigate_to');

                                              context.pushNamed('Cartvalue');
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'o339ehv3' /* Go to cart */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 16.0,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final products =
                                  GetAllProductsCall.productsExcept(
                                        productsmenuGetAllProductsResponse
                                            .jsonBody,
                                      )?.toList() ??
                                      [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: products.length,
                                itemBuilder: (context, productsIndex) {
                                  final productsItem = products[productsIndex];
                                  return Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -1.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.1,
                                              decoration: BoxDecoration(
                                                color: functions
                                                    .color(productsIndex),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Text(
                                                      getJsonField(
                                                        productsItem,
                                                        r'''$.serviceName''',
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
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final subProducts =
                                                    getJsonField(
                                                  productsItem,
                                                  r'''$.products''',
                                                ).toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: subProducts.length,
                                                  itemBuilder: (context,
                                                      subProductsIndex) {
                                                    final subProductsItem =
                                                        subProducts[
                                                            subProductsIndex];
                                                    return Theme(
                                                      data: ThemeData(
                                                        unselectedWidgetColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                      child: CheckboxListTile(
                                                        value: _model
                                                                .checkboxListTileValueMap4[
                                                            subProductsItem] ??= FFAppState()
                                                                .productids
                                                                .contains(
                                                                    getJsonField(
                                                                  subProductsItem,
                                                                  r'''$.product_id''',
                                                                ).toString()) ==
                                                            true,
                                                        onChanged:
                                                            (newValue) async {
                                                          setState(() => _model
                                                                      .checkboxListTileValueMap4[
                                                                  subProductsItem] =
                                                              newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'PRODUCTSMENU_CheckboxListTile_xpp5gzsd_O');
                                                            logFirebaseEvent(
                                                                'CheckboxListTile_update_app_state');
                                                            setState(() {
                                                              FFAppState()
                                                                  .addToTotalcart(
                                                                      CartitemsStruct(
                                                                productId:
                                                                    getJsonField(
                                                                  subProductsItem,
                                                                  r'''$.product_id''',
                                                                ).toString(),
                                                                productamount:
                                                                    getJsonField(
                                                                  subProductsItem,
                                                                  r'''$.INR''',
                                                                ).toString(),
                                                                productname:
                                                                    getJsonField(
                                                                  subProductsItem,
                                                                  r'''$.product_name''',
                                                                ).toString(),
                                                                producttypes:
                                                                    getJsonField(
                                                                  subProductsItem,
                                                                  r'''$.service_type''',
                                                                ).toString(),
                                                              ));
                                                              FFAppState()
                                                                  .addToProductids(
                                                                      getJsonField(
                                                                subProductsItem,
                                                                r'''$.product_id''',
                                                              ).toString());
                                                            });
                                                            logFirebaseEvent(
                                                                'CheckboxListTile_update_page_state');
                                                            setState(() {
                                                              _model.addToTotalAmount(
                                                                  productsItem
                                                                      .toString());
                                                            });
                                                            logFirebaseEvent(
                                                                'CheckboxListTile_update_app_state');
                                                            setState(() {
                                                              FFAppState()
                                                                      .couponscode =
                                                                  CouponStruct();
                                                              FFAppState()
                                                                  .applied = [];
                                                              FFAppState()
                                                                      .discountamount =
                                                                  0.0;
                                                              FFAppState().finalamount = functions
                                                                  .minusdiscountamount(
                                                                      valueOrDefault<
                                                                          double>(
                                                                        functions.payableamount(
                                                                            FFAppState().cartvalue,
                                                                            FFAppState().deliveryfee),
                                                                        0.0,
                                                                      ),
                                                                      FFAppState()
                                                                          .discountamount)!;
                                                            });
                                                          } else {
                                                            logFirebaseEvent(
                                                                'PRODUCTSMENU_CheckboxListTile_xpp5gzsd_O');
                                                            logFirebaseEvent(
                                                                'CheckboxListTile_update_app_state');
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                  .removeFromTotalcart(
                                                                      CartitemsStruct(
                                                                productId:
                                                                    getJsonField(
                                                                  subProductsItem,
                                                                  r'''$.product_id''',
                                                                ).toString(),
                                                                productamount:
                                                                    getJsonField(
                                                                  subProductsItem,
                                                                  r'''$.INR''',
                                                                ).toString(),
                                                                productname:
                                                                    getJsonField(
                                                                  subProductsItem,
                                                                  r'''$.product_name''',
                                                                ).toString(),
                                                                producttypes:
                                                                    getJsonField(
                                                                  subProductsItem,
                                                                  r'''$.service_type''',
                                                                ).toString(),
                                                              ));
                                                              FFAppState()
                                                                  .removeFromProductids(
                                                                      getJsonField(
                                                                subProductsItem,
                                                                r'''$.product_id''',
                                                              ).toString());
                                                              FFAppState()
                                                                      .cartvalue =
                                                                  valueOrDefault<
                                                                      double>(
                                                                functions.finalcartamount(
                                                                    FFAppState()
                                                                        .totalcart
                                                                        .toList()),
                                                                0.0,
                                                              );
                                                              FFAppState()
                                                                      .deliveryfee =
                                                                  valueOrDefault<
                                                                      double>(
                                                                functions.getdelivery(
                                                                    FFAppState()
                                                                        .totalcart
                                                                        .toList()),
                                                                0.0,
                                                              );
                                                              FFAppState()
                                                                      .finalamount =
                                                                  valueOrDefault<
                                                                      double>(
                                                                functions.payableamount(
                                                                    FFAppState()
                                                                        .cartvalue,
                                                                    FFAppState()
                                                                        .deliveryfee),
                                                                0.0,
                                                              );
                                                            });
                                                            logFirebaseEvent(
                                                                'CheckboxListTile_update_page_state');
                                                            setState(() {
                                                              _model.removeFromTotalAmount(
                                                                  productsItem
                                                                      .toString());
                                                            });
                                                            logFirebaseEvent(
                                                                'CheckboxListTile_update_app_state');
                                                            setState(() {
                                                              FFAppState()
                                                                      .couponscode =
                                                                  CouponStruct();
                                                              FFAppState()
                                                                  .applied = [];
                                                              FFAppState()
                                                                      .discountamount =
                                                                  0.0;
                                                              FFAppState().finalamount = functions
                                                                  .minusdiscountamount(
                                                                      valueOrDefault<
                                                                          double>(
                                                                        functions.payableamount(
                                                                            FFAppState().cartvalue,
                                                                            FFAppState().deliveryfee),
                                                                        0.0,
                                                                      ),
                                                                      FFAppState()
                                                                          .discountamount)!;
                                                            });
                                                          }
                                                        },
                                                        title: Text(
                                                          getJsonField(
                                                            subProductsItem,
                                                            r'''$.product_name''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 14.0,
                                                              ),
                                                        ),
                                                        subtitle: Text(
                                                          getJsonField(
                                                            subProductsItem,
                                                            r'''$.INR''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                        tileColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        checkColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.1,
                                            decoration: BoxDecoration(
                                              color: functions
                                                  .color(productsIndex),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: InkWell(
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
                                                          'PRODUCTSMENU_PAGE_Text_r1050mdd_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text_navigate_to');

                                                      context.pushNamed(
                                                          'Cartvalue');
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '1in3u6bk' /* Go to cart */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 16.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                        ],
                      ),
                    ),
                    if (FFAppState().totalcart.isNotEmpty)
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.09,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PRODUCTSMENU_PAGE_SocialPost_2_ON_TAP');
                            logFirebaseEvent('SocialPost_2_navigate_to');

                            context.pushNamed('Cartvalue');
                            logFirebaseEvent('SocialPost_2_update_app_state');
                            FFAppState().update(() {
                              FFAppState().applied = [];
                              FFAppState().discountamount = 0.0;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  offset: const Offset(0.0, 1.0),
                                )
                              ],
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primary,
                                  const Color(0xFF514EFF)
                                ],
                                stops: const [0.0, 1.0],
                                begin: const AlignmentDirectional(0.0, -1.0),
                                end: const AlignmentDirectional(0, 1.0),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '${FFAppState().totalcart.length.toString()} item added',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'hayn8cia' /* Continue */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.east,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Lottie.asset(
                                  'assets/lottie_animations/Animation_-_1708324297486.json',
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  fit: BoxFit.cover,
                                  repeat: false,
                                  animate: true,
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
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
