import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/special_offershimeer/special_offershimeer_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'productsmenu_model.dart';
export 'productsmenu_model.dart';

class ProductsmenuWidget extends StatefulWidget {
  const ProductsmenuWidget({super.key});

  static String routeName = 'productsmenu';
  static String routePath = '/productsmenu';

  @override
  State<ProductsmenuWidget> createState() => _ProductsmenuWidgetState();
}

class _ProductsmenuWidgetState extends State<ProductsmenuWidget>
    with TickerProviderStateMixin {
  late ProductsmenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductsmenuModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'productsmenu'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PRODUCTSMENU_productsmenu_ON_INIT_STATE');
      Function() _navigate = () {};
      logFirebaseEvent('productsmenu_backend_call');
      _model.validatetoken = await ValidateTokenCall.call(
        token: FFAppState().userInfo.token,
      );

      if (!(_model.validatetoken?.succeeded ?? true)) {
        logFirebaseEvent('productsmenu_backend_call');
        _model.getnewtoken = await GetNewTokenCall.call(
          userID: FFAppState().userInfo.token,
        );

        if ((_model.getnewtoken?.succeeded ?? true)) {
          logFirebaseEvent('productsmenu_update_app_state');
          FFAppState().updateUserInfoStruct(
            (e) => e
              ..token = getJsonField(
                (_model.getnewtoken?.jsonBody ?? ''),
                r'''$.jwt_token''',
              ).toString(),
          );
          FFAppState().update(() {});
        } else {
          logFirebaseEvent('productsmenu_show_snack_bar');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Your session has expired. Please log in again to continue.',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).primary,
            ),
          );
          logFirebaseEvent('productsmenu_auth');
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          _navigate = () =>
              context.goNamedAuth(OnBoardingWidget.routeName, context.mounted);
        }
      }

      _navigate();
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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
      future: GetAllProductsCall.call(
        std: FFAppState().userInfo.stdId,
        token: FFAppState().userInfo.token,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
              child: SpecialOffershimeerWidget(),
            ),
          );
        }
        final productsmenuGetAllProductsResponse = snapshot.data!;

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
              title: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'pvowosuk' /* Special Offers */,
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          fontSize: 16,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.5,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Stack(
                  alignment: AlignmentDirectional(0, 1),
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -1),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 10),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'd06wd1d2' /* Monthly Test */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 20,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
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
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Container(
                                      height: 450,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment(0, 0),
                                            child: TabBar(
                                              labelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              unselectedLabelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                              unselectedLabelStyle: TextStyle(),
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              padding: EdgeInsets.all(4),
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
                                                  elevation: 1,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
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

                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              subProducts
                                                                  .length,
                                                              (subProductsIndex) {
                                                            final subProductsItem =
                                                                subProducts[
                                                                    subProductsIndex];
                                                            return Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child: Theme(
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
                                                                    safeSetState(() =>
                                                                        _model.checkboxListTileValueMap1[subProductsItem] =
                                                                            newValue!);
                                                                    if (newValue!) {
                                                                      logFirebaseEvent(
                                                                          'PRODUCTSMENU_CheckboxListTile_9wf939ya_O');
                                                                      logFirebaseEvent(
                                                                          'CheckboxListTile_update_app_state');
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
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                      logFirebaseEvent(
                                                                          'CheckboxListTile_update_page_state');
                                                                      _model.addToTotalAmount(
                                                                          subProductsItem
                                                                              .toString());
                                                                      _model.added =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'CheckboxListTile_update_app_state');
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
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'PRODUCTSMENU_CheckboxListTile_9wf939ya_O');
                                                                      logFirebaseEvent(
                                                                          'CheckboxListTile_update_app_state');
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
                                                                            FFAppState().cartvalue,
                                                                            FFAppState().deliveryfee),
                                                                        0.0,
                                                                      );
                                                                      FFAppState()
                                                                              .couponscode =
                                                                          CouponStruct();
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                      logFirebaseEvent(
                                                                          'CheckboxListTile_update_page_state');
                                                                      _model.removeFromTotalAmount(
                                                                          subProductsItem
                                                                              .toString());
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'CheckboxListTile_update_app_state');
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
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
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
                                                                          font:
                                                                              GoogleFonts.outfit(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              14,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  subtitle:
                                                                      Text(
                                                                    getJsonField(
                                                                      subProductsItem,
                                                                      r'''$.INR''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.readexPro(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              12,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  tileColor: FlutterFlowTheme.of(
                                                                          context)
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
                                                              ),
                                                            );
                                                          }),
                                                        ),
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
                                                  elevation: 4,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
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

                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              sixMonths.length,
                                                              (sixMonthsIndex) {
                                                            final sixMonthsItem =
                                                                sixMonths[
                                                                    sixMonthsIndex];
                                                            return Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child: Theme(
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
                                                                    safeSetState(() =>
                                                                        _model.checkboxListTileValueMap2[sixMonthsItem] =
                                                                            newValue!);
                                                                    if (newValue!) {
                                                                      logFirebaseEvent(
                                                                          'PRODUCTSMENU_CheckboxListTile_l3k3oe8d_O');
                                                                      logFirebaseEvent(
                                                                          'CheckboxListTile_update_app_state');
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
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                      logFirebaseEvent(
                                                                          'CheckboxListTile_update_app_state');
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
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'PRODUCTSMENU_CheckboxListTile_l3k3oe8d_O');
                                                                      logFirebaseEvent(
                                                                          'CheckboxListTile_update_app_state');
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
                                                                            FFAppState().cartvalue,
                                                                            FFAppState().deliveryfee),
                                                                        0.0,
                                                                      );
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                      logFirebaseEvent(
                                                                          'CheckboxListTile_update_app_state');
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
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
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
                                                                          font:
                                                                              GoogleFonts.outfit(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              14,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  subtitle:
                                                                      Text(
                                                                    getJsonField(
                                                                      sixMonthsItem,
                                                                      r'''$.INR''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.readexPro(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              12,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  tileColor: FlutterFlowTheme.of(
                                                                          context)
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
                                                              ),
                                                            );
                                                          }),
                                                        ),
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
                                                  elevation: 4,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
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

                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              subProducts
                                                                  .length,
                                                              (subProductsIndex) {
                                                            final subProductsItem =
                                                                subProducts[
                                                                    subProductsIndex];
                                                            return Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child: Theme(
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
                                                                    safeSetState(() =>
                                                                        _model.checkboxListTileValueMap3[subProductsItem] =
                                                                            newValue!);
                                                                    if (newValue!) {
                                                                      logFirebaseEvent(
                                                                          'PRODUCTSMENU_CheckboxListTile_oe8041yj_O');
                                                                      logFirebaseEvent(
                                                                          'CheckboxListTile_update_app_state');
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
                                                                          .update(
                                                                              () {});
                                                                      logFirebaseEvent(
                                                                          'CheckboxListTile_update_app_state');
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
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'PRODUCTSMENU_CheckboxListTile_oe8041yj_O');
                                                                      logFirebaseEvent(
                                                                          'CheckboxListTile_update_app_state');
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
                                                                            FFAppState().cartvalue,
                                                                            FFAppState().deliveryfee),
                                                                        0.0,
                                                                      );
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                      logFirebaseEvent(
                                                                          'CheckboxListTile_update_app_state');
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
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
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
                                                                          font:
                                                                              GoogleFonts.outfit(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              14,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  subtitle:
                                                                      Text(
                                                                    getJsonField(
                                                                      subProductsItem,
                                                                      r'''$.INR''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.readexPro(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              12,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  tileColor: FlutterFlowTheme.of(
                                                                          context)
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
                                                              ),
                                                            );
                                                          }),
                                                        ),
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
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'PRODUCTSMENU_Container_x0kn2zbx_ON_TAP');
                                      logFirebaseEvent('Container_navigate_to');

                                      context.pushNamed(
                                          CartvalueCopyWidget.routeName);

                                      logFirebaseEvent(
                                          'Container_update_app_state');
                                      FFAppState().applied = [];
                                      FFAppState().discountamount = 0.0;
                                      FFAppState().update(() {});
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.1,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PRODUCTSMENU_PAGE_Text_gku1z3dp_ON_TAP');
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
                                                      font:
                                                          GoogleFonts.readexPro(
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      fontSize: 16,
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
                                        ],
                                      ),
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
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, -1),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 10),
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
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 20,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
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
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 4,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                                                    return Material(
                                                      color: Colors.transparent,
                                                      child: Theme(
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
                                                            safeSetState(() =>
                                                                _model.checkboxListTileValueMap4[
                                                                        subProductsItem] =
                                                                    newValue!);
                                                            if (newValue!) {
                                                              logFirebaseEvent(
                                                                  'PRODUCTSMENU_CheckboxListTile_xpp5gzsd_O');
                                                              logFirebaseEvent(
                                                                  'CheckboxListTile_update_app_state');
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
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'CheckboxListTile_update_page_state');
                                                              _model.addToTotalAmount(
                                                                  productsItem
                                                                      .toString());
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'CheckboxListTile_update_app_state');
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
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'PRODUCTSMENU_CheckboxListTile_xpp5gzsd_O');
                                                              logFirebaseEvent(
                                                                  'CheckboxListTile_update_app_state');
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
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              logFirebaseEvent(
                                                                  'CheckboxListTile_update_page_state');
                                                              _model.removeFromTotalAmount(
                                                                  productsItem
                                                                      .toString());
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'CheckboxListTile_update_app_state');
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
                                                              safeSetState(
                                                                  () {});
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
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 14,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
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
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 12,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
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
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'PRODUCTSMENU_Container_5i2h7r28_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                  CartvalueCopyWidget
                                                      .routeName);

                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().applied = [];
                                              FFAppState().discountamount = 0.0;
                                              FFAppState().update(() {});
                                            },
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
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
                                                        AlignmentDirectional(
                                                            0, 0),
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize: 16,
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
                                                ],
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
                        ],
                      ),
                    ),
                    if (FFAppState().totalcart.isNotEmpty)
                      Container(
                        width: MediaQuery.sizeOf(context).width,
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

                            context.pushNamed(CartvalueWidget.routeName);

                            logFirebaseEvent('SocialPost_2_update_app_state');
                            FFAppState().applied = [];
                            FFAppState().discountamount = 0.0;
                            FFAppState().update(() {});
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  offset: Offset(
                                    0.0,
                                    1,
                                  ),
                                )
                              ],
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primary,
                                  Color(0xFF514EFF)
                                ],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${FFAppState().totalcart.length.toString()} item added',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 0, 0),
                                            child: Icon(
                                              Icons.east,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Lottie.asset(
                                  'assets/jsons/Animation_-_1708324297486.json',
                                  width: MediaQuery.sizeOf(context).width,
                                  height: MediaQuery.sizeOf(context).height,
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
