import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/ordersshimmer/ordersshimmer_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

import 'power_products_model.dart';
export 'power_products_model.dart';

class PowerProductsWidget extends StatefulWidget {
  const PowerProductsWidget({
    super.key,
    required this.productId,
  });

  final dynamic productId;

  static String routeName = 'powerProducts';
  static String routePath = '/powerProducts';

  @override
  State<PowerProductsWidget> createState() => _PowerProductsWidgetState();
}

class _PowerProductsWidgetState extends State<PowerProductsWidget> {
  late PowerProductsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PowerProductsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'powerProducts'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POWER_PRODUCTS_powerProducts_ON_INIT_STA');
      logFirebaseEvent('powerProducts_update_app_state');
      FFAppState().powercartvalue = 0.0;
      FFAppState().powerfinalamount = 0.0;
      FFAppState().powercomboid = [];
      FFAppState().powercart = [];
      FFAppState().deliveryfee = 0.0;
      FFAppState().powerdiscount = 0.0;
      FFAppState().powerId = [];
      safeSetState(() {});
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
      future: PowerPackagesCall.call(
        stdId: FFAppState().userInfo.stdId,
        token: FFAppState().userInfo.token,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: OrdersshimmerWidget(),
          );
        }
        final powerProductsPowerPackagesResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('POWER_PRODUCTS_PAGE_Icon_xqja99h4_ON_TAP');
                  logFirebaseEvent('Icon_navigate_back');
                  context.safePop();
                },
                child: Icon(
                  Icons.chevron_left_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30,
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.5,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        child: CarouselSlider(
                          items: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'xqiwpl1p' /* SELECT ANY 1 AND
SAVE 5% */
                                    ,
                                  ),
                                  textAlign: TextAlign.center,
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
                                            .primaryBackground,
                                        fontSize: 16,
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
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '9lje1twj' /* SELECT ANY 2 AND
SAVE 10% */
                                    ,
                                  ),
                                  textAlign: TextAlign.center,
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
                                            .primaryBackground,
                                        fontSize: 16,
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
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).warning,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'xwi26acd' /* SELECT ANY 3 AND
SAVE 15% */
                                    ,
                                  ),
                                  textAlign: TextAlign.center,
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
                                            .primaryBackground,
                                        fontSize: 16,
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
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).error,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'uej0qot5' /* SELECT ANY 4 AND
SAVE 20% */
                                    ,
                                  ),
                                  textAlign: TextAlign.center,
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
                                            .primaryBackground,
                                        fontSize: 16,
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
                          carouselController: _model.carouselController ??=
                              CarouselSliderController(),
                          options: CarouselOptions(
                            initialPage: 1,
                            viewportFraction: 0.5,
                            disableCenter: true,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.25,
                            enableInfiniteScroll: true,
                            scrollDirection: Axis.horizontal,
                            autoPlay: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayInterval:
                                Duration(milliseconds: (800 + 4000)),
                            autoPlayCurve: Curves.linear,
                            pauseAutoPlayInFiniteScroll: true,
                            onPageChanged: (index, _) =>
                                _model.carouselCurrentIndex = index,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
                        child: Builder(
                          builder: (context) {
                            final combos = PowerPackagesCall.combos(
                                  powerProductsPowerPackagesResponse.jsonBody,
                                )
                                    ?.where((e) =>
                                        getJsonField(
                                          e,
                                          r'''$.package_id''',
                                        ) ==
                                        widget!.productId)
                                    .toList()
                                    ?.toList() ??
                                [];

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: combos.length,
                              separatorBuilder: (_, __) => SizedBox(height: 5),
                              itemBuilder: (context, combosIndex) {
                                final combosItem = combos[combosIndex];
                                return Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 5),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Material(
                                                color: Colors.transparent,
                                                child: Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  child: CheckboxListTile(
                                                    value: _model
                                                            .checkboxListTileValueMap[
                                                        combosItem] ??= FFAppState()
                                                            .powercomboid
                                                            .contains(
                                                                getJsonField(
                                                              combosItem,
                                                              r'''$.comboDetails.combo_id''',
                                                            ).toString()) ==
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() =>
                                                          _model.checkboxListTileValueMap[
                                                                  combosItem] =
                                                              newValue!);
                                                      if (newValue!) {
                                                        logFirebaseEvent(
                                                            'POWER_PRODUCTS_CheckboxListTile_cgc9m3o2');
                                                        logFirebaseEvent(
                                                            'CheckboxListTile_update_page_state');
                                                        _model.items =
                                                            _model.items + 1;
                                                        _model.discountfee =
                                                            functions
                                                                .percent(
                                                                    valueOrDefault<
                                                                        int>(
                                                                  _model.items,
                                                                  0,
                                                                ))
                                                                ?.toDouble();
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'CheckboxListTile_update_app_state');
                                                        FFAppState()
                                                            .addToPowercart(
                                                                PowercartStruct(
                                                          productId:
                                                              getJsonField(
                                                            combosItem,
                                                            r'''$.package_id''',
                                                          ).toString(),
                                                          productname:
                                                              getJsonField(
                                                            combosItem,
                                                            r'''$.comboName''',
                                                          ).toString(),
                                                          productamount:
                                                              getJsonField(
                                                            combosItem,
                                                            r'''$.comboDetails.INR''',
                                                          ).toString(),
                                                          producttypes: functions
                                                              .minusdiscountamount(
                                                                  functions.doubletoString(getJsonField(
                                                                    combosItem,
                                                                    r'''$.comboDetails.INR''',
                                                                  ).toString()),
                                                                  functions.doubletoString(functions.discountedamount(
                                                                      FFAppState().noofselected.length.toString(),
                                                                      getJsonField(
                                                                        combosItem,
                                                                        r'''$.comboDetails.INR''',
                                                                      ).toString())))
                                                              .toString(),
                                                          deliverablecount:
                                                              getJsonField(
                                                            combosItem,
                                                            r'''$.comboDetails.deliverable_item_count''',
                                                          ).toString(),
                                                        ));
                                                        FFAppState()
                                                            .addToPowercomboid(
                                                                getJsonField(
                                                          combosItem,
                                                          r'''$.comboDetails.combo_id''',
                                                        ).toString());
                                                        FFAppState()
                                                                .powercartvalue =
                                                            functions.powercartamount(
                                                                FFAppState()
                                                                    .powercart
                                                                    .toList());
                                                        FFAppState()
                                                            .addToPowerId(
                                                                int.parse(
                                                                    getJsonField(
                                                          combosItem,
                                                          r'''$.comboDetails.product_ids''',
                                                        )));
                                                        FFAppState()
                                                            .update(() {});
                                                        logFirebaseEvent(
                                                            'CheckboxListTile_update_app_state');
                                                        FFAppState()
                                                                .deliveryfee =
                                                            functions.powerdeliveryfee(
                                                                FFAppState()
                                                                    .powercart
                                                                    .toList());
                                                        FFAppState()
                                                            .update(() {});
                                                        logFirebaseEvent(
                                                            'CheckboxListTile_update_app_state');
                                                        FFAppState().powerfinalamount = functions
                                                            .grandtotal(
                                                                valueOrDefault<
                                                                    double>(
                                                                  functions.powercartamount(
                                                                      FFAppState()
                                                                          .powercart
                                                                          .toList()),
                                                                  0.0,
                                                                ).toString(),
                                                                functions
                                                                    .calculatetotalamount(
                                                                        _model
                                                                            .discountfee!
                                                                            .toString(),
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions
                                                                              .powercartamount(FFAppState().powercart.toList())
                                                                              .toString(),
                                                                          '0.0',
                                                                        ))
                                                                    .toString(),
                                                                FFAppState()
                                                                    .deliveryfee
                                                                    .toString());
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        logFirebaseEvent(
                                                            'POWER_PRODUCTS_CheckboxListTile_cgc9m3o2');
                                                        logFirebaseEvent(
                                                            'CheckboxListTile_update_page_state');
                                                        _model.items =
                                                            _model.items + -1;
                                                        _model.discountfee =
                                                            functions
                                                                .percent(
                                                                    valueOrDefault<
                                                                        int>(
                                                                  _model.items,
                                                                  0,
                                                                ))
                                                                ?.toDouble();
                                                        safeSetState(() {});
                                                        // Action 1
                                                        logFirebaseEvent(
                                                            'CheckboxListTile_Action1');
                                                        FFAppState()
                                                            .removeFromPowercart(
                                                                PowercartStruct(
                                                          productId:
                                                              getJsonField(
                                                            combosItem,
                                                            r'''$.package_id''',
                                                          ).toString(),
                                                          productname:
                                                              getJsonField(
                                                            combosItem,
                                                            r'''$.comboName''',
                                                          ).toString(),
                                                          productamount:
                                                              getJsonField(
                                                            combosItem,
                                                            r'''$.comboDetails.INR''',
                                                          ).toString(),
                                                          producttypes: functions
                                                              .minusdiscountamount(
                                                                  functions.doubletoString(getJsonField(
                                                                    combosItem,
                                                                    r'''$.comboDetails.INR''',
                                                                  ).toString()),
                                                                  functions.doubletoString(functions.discountedamount(
                                                                      FFAppState().noofselected.length.toString(),
                                                                      getJsonField(
                                                                        combosItem,
                                                                        r'''$.comboDetails.INR''',
                                                                      ).toString())))
                                                              .toString(),
                                                          deliverablecount:
                                                              getJsonField(
                                                            combosItem,
                                                            r'''$.comboDetails.deliverable_item_count''',
                                                          ).toString(),
                                                        ));
                                                        FFAppState()
                                                            .removeFromPowercomboid(
                                                                getJsonField(
                                                          combosItem,
                                                          r'''$.comboDetails.combo_id''',
                                                        ).toString());
                                                        FFAppState()
                                                                .powercartvalue =
                                                            functions.powercartamount(
                                                                FFAppState()
                                                                    .powercart
                                                                    .toList());
                                                        FFAppState()
                                                                .deliveryfee =
                                                            functions.powerdeliveryfee(
                                                                FFAppState()
                                                                    .powercart
                                                                    .toList());
                                                        FFAppState()
                                                            .removeFromPowerId(
                                                                int.parse(
                                                                    getJsonField(
                                                          combosItem,
                                                          r'''$.comboDetails.product_ids''',
                                                        )));
                                                        FFAppState()
                                                            .update(() {});
                                                        logFirebaseEvent(
                                                            'CheckboxListTile_update_app_state');
                                                        FFAppState().powerfinalamount = functions.grandtotal(
                                                            functions
                                                                .powercartamount(
                                                                    FFAppState()
                                                                        .powercart
                                                                        .toList())
                                                                .toString(),
                                                            functions
                                                                .calculatetotalamount(
                                                                    _model
                                                                        .discountfee!
                                                                        .toString(),
                                                                    functions
                                                                        .powercartamount(FFAppState()
                                                                            .powercart
                                                                            .toList())
                                                                        .toString())
                                                                .toString(),
                                                            FFAppState()
                                                                .deliveryfee
                                                                .toString());
                                                        FFAppState()
                                                            .update(() {});
                                                      }
                                                    },
                                                    title: Text(
                                                      getJsonField(
                                                        combosItem,
                                                        r'''$.comboName''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
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
                                                                fontSize: 18,
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
                                                      '₹ ${getJsonField(
                                                        combosItem,
                                                        r'''$.comboDetails.INR''',
                                                      ).toString()}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                fontSize: 16,
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
                                                    tileColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent3,
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
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          final products = getJsonField(
                                            combosItem,
                                            r'''$.comboProducts''',
                                          ).toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: products.length,
                                            itemBuilder:
                                                (context, productsIndex) {
                                              final productsItem =
                                                  products[productsIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape: CircleBorder(),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkboxValueMap1[
                                                          productsItem] ??= true,
                                                      onChanged: (PowerPackagesCall
                                                                      .combos(
                                                                    powerProductsPowerPackagesResponse
                                                                        .jsonBody,
                                                                  ) !=
                                                                  null &&
                                                              (PowerPackagesCall
                                                                      .combos(
                                                                powerProductsPowerPackagesResponse
                                                                    .jsonBody,
                                                              ))!
                                                                  .isNotEmpty)
                                                          ? null
                                                          : (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.checkboxValueMap1[
                                                                          productsItem] =
                                                                      newValue!);
                                                            },
                                                      side: (FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText !=
                                                              null)
                                                          ? BorderSide(
                                                              width: 2,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText!,
                                                            )
                                                          : null,
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor: (PowerPackagesCall
                                                                      .combos(
                                                                    powerProductsPowerPackagesResponse
                                                                        .jsonBody,
                                                                  ) !=
                                                                  null &&
                                                              (PowerPackagesCall
                                                                      .combos(
                                                                powerProductsPowerPackagesResponse
                                                                    .jsonBody,
                                                              ))!
                                                                  .isNotEmpty)
                                                          ? null
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      getJsonField(
                                                        productsItem,
                                                        r'''$.title''',
                                                      ).toString(),
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
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'julbjud0' /* Note : Delivery Charges Will B... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFEE4C4C),
                                      fontSize: 12,
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
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'lk77kwap' /* Price Details */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.black,
                                      fontSize: 18,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'j8q7cm8o' /* Cart value */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        functions
                                            .powercartamount(
                                                FFAppState().powercart.toList())
                                            .toString(),
                                        '0.0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 16,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'n0uomveu' /* You saved */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        functions
                                            .calculatetotalamount(
                                                valueOrDefault<String>(
                                                  _model.discountfee
                                                      ?.toString(),
                                                  '0',
                                                ),
                                                FFAppState()
                                                    .powercartvalue
                                                    .toString())
                                            .toString(),
                                        '0.0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 16,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ouqjcuzy' /* Delivery Charges */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        functions
                                            .powerdeliveryfee(
                                                FFAppState().powercart.toList())
                                            .toString(),
                                        '0.0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 16,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'vqx2rxsw' /* Total Amount */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Text(
                                      functions
                                          .grandtotal(
                                              valueOrDefault<double>(
                                                functions.powercartamount(
                                                    FFAppState()
                                                        .powercart
                                                        .toList()),
                                                0.0,
                                              ).toString(),
                                              valueOrDefault<double>(
                                                functions.calculatetotalamount(
                                                    valueOrDefault<String>(
                                                      _model.discountfee
                                                          ?.toString(),
                                                      '0',
                                                    ),
                                                    FFAppState()
                                                        .powercartvalue
                                                        .toString()),
                                                0.0,
                                              ).toString(),
                                              valueOrDefault<double>(
                                                functions.powerdeliveryfee(
                                                    FFAppState()
                                                        .powercart
                                                        .toList()),
                                                0.0,
                                              ).toString())
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 16,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue2 ??= false,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.checkboxValue2 = newValue!);
                                    },
                                    side: (FlutterFlowTheme.of(context)
                                                .secondaryText !=
                                            null)
                                        ? BorderSide(
                                            width: 2,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText!,
                                          )
                                        : null,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 0, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '5530nr4h' /* I agree to Terms & Condition */,
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
                                            color: Colors.black,
                                            fontSize: 14,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'POWER_PRODUCTS_PAGE_Text_reznhuh1_ON_TAP');
                                      logFirebaseEvent('Text_launch_u_r_l');
                                      await launchURL(
                                          'https://www.indiantalent.org/terms');
                                    },
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'm14uir75' /* see more */,
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
                                            color: FlutterFlowTheme.of(context)
                                                .success,
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
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 30),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'POWER_PRODUCTS_PAGE_PAY_NOW_BTN_ON_TAP');
                                  if (_model.checkboxValue2 == true) {
                                    logFirebaseEvent('Button_backend_call');
                                    _model.apiResult3ma =
                                        await ProductsSubscriptionCall.call(
                                      userId: FFAppState().userInfo.userId,
                                      productsList: functions.convertint(
                                          FFAppState().powercomboid.toList()),
                                      payableAmount: FFAppState()
                                          .powerfinalamount
                                          .toString(),
                                      deliveryCharge:
                                          FFAppState().deliveryfee.toString(),
                                      powerpackid:
                                          widget!.productId?.toString(),
                                      comboIdList: FFAppState().powerId,
                                      token: FFAppState().userInfo.token,
                                      purchaseType: 'combo',
                                    );

                                    if ((_model.apiResult3ma?.succeeded ??
                                        true)) {
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().merchantTranId =
                                          ProductsSubscriptionCall.merchantId(
                                        (_model.apiResult3ma?.jsonBody ?? ''),
                                      )!;
                                      safeSetState(() {});
                                      logFirebaseEvent('Button_alert_dialog');

                                      logFirebaseEvent('Button_custom_action');
                                      _model.sha256 = await actions.generateSha(
                                        'ac7f1970-3484-422a-a285-49a6e63e029d',
                                        functions.jsontobase64(
                                            functions.createJson(
                                                'M222Z8QFUNMKT',
                                                FFAppState().merchantTranId,
                                                functions.rupeestopaisa(
                                                    functions.grandtotal(
                                                        valueOrDefault<double>(
                                                          functions
                                                              .powercartamount(
                                                                  FFAppState()
                                                                      .powercart
                                                                      .toList()),
                                                          0.0,
                                                        ).toString(),
                                                        valueOrDefault<double>(
                                                          functions
                                                              .calculatetotalamount(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    _model
                                                                        .discountfee
                                                                        ?.toString(),
                                                                    '0',
                                                                  ),
                                                                  FFAppState()
                                                                      .powercartvalue
                                                                      .toString()),
                                                          0.0,
                                                        ).toString(),
                                                        valueOrDefault<double>(
                                                          functions
                                                              .powerdeliveryfee(
                                                                  FFAppState()
                                                                      .powercart
                                                                      .toList()),
                                                          0.0,
                                                        ).toString())),
                                                FFAppState().userInfo.userId,
                                                'indiantalentolympiad://indiantalentolympiad.com${GoRouterState.of(context).uri.toString()}',
                                                'REDIRECT',
                                                'https://www.indiantalent.org/RESTapi/student-v1/payment/Phonepe_callback',
                                                FFAppState()
                                                    .userInfo
                                                    .mobileNo)),
                                      );
                                      logFirebaseEvent('Button_alert_dialog');

                                      logFirebaseEvent('Button_backend_call');
                                      _model.payApi = await PhonepeCall.call(
                                        verify: _model.sha256,
                                        base: functions.jsontobase64(
                                            functions.createJson(
                                                'M222Z8QFUNMKT',
                                                FFAppState().merchantTranId,
                                                functions.rupeestopaisa(
                                                    functions.grandtotal(
                                                        valueOrDefault<double>(
                                                          functions
                                                              .powercartamount(
                                                                  FFAppState()
                                                                      .powercart
                                                                      .toList()),
                                                          0.0,
                                                        ).toString(),
                                                        valueOrDefault<double>(
                                                          functions
                                                              .calculatetotalamount(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    _model
                                                                        .discountfee
                                                                        ?.toString(),
                                                                    '0',
                                                                  ),
                                                                  FFAppState()
                                                                      .powercartvalue
                                                                      .toString()),
                                                          0.0,
                                                        ).toString(),
                                                        valueOrDefault<double>(
                                                          functions
                                                              .powerdeliveryfee(
                                                                  FFAppState()
                                                                      .powercart
                                                                      .toList()),
                                                          0.0,
                                                        ).toString())),
                                                FFAppState().userInfo.userId,
                                                'indiantalentolympiad://indiantalentolympiad.com${GoRouterState.of(context).uri.toString()}',
                                                'REDIRECT',
                                                'https://www.indiantalent.org/RESTapi/student-v1/payment/Phonepe_callback',
                                                FFAppState()
                                                    .userInfo
                                                    .mobileNo)),
                                      );

                                      if ((_model.payApi?.succeeded ?? true)) {
                                        logFirebaseEvent(
                                            'Button_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Processing Your Order',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        logFirebaseEvent('Button_wait__delay');
                                        await Future.delayed(
                                          Duration(
                                            milliseconds: 2000,
                                          ),
                                        );
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamed(
                                          PowerwebviewWidget.routeName,
                                          queryParameters: {
                                            'payurl': serializeParam(
                                              PhonepeCall.url(
                                                (_model.payApi?.jsonBody ?? ''),
                                              ),
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: Text('Alert !!'),
                                                content: Text(
                                                    'Select Atleast One Product'),
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
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamed(
                                          PowerProductsWidget.routeName,
                                          queryParameters: {
                                            'productId': serializeParam(
                                              widget!.productId,
                                              ParamType.JSON,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    } else {
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text('Api failed'),
                                              content: Text(getJsonField(
                                                powerProductsPowerPackagesResponse
                                                    .jsonBody,
                                                r'''$.error''',
                                              ).toString()),
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
                                    }
                                  } else {
                                    logFirebaseEvent('Button_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text('Warning!'),
                                            content: Text(
                                                'Please Agree for Terms and Conditions'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'mpia3tej' /* Pay Now */,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: Color(0xFF004696),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
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
          ),
        );
      },
    );
  }
}
