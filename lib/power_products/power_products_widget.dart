import 'package:indian_talent_olympiad/backend/schema/structs/powercart_struct.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/ordersshimmer/ordersshimmer_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
      setState(() {
        FFAppState().powercartvalue = 0.0;
        FFAppState().powerfinalamount = 0.0;
        FFAppState().powercomboid = [];
        FFAppState().powercart = [];
        FFAppState().deliveryfee = 0.0;
        FFAppState().powerdiscount = 0.0;
        FFAppState().powerId = [];
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
      future: PowerPackagesCall.call(
        stdId: FFAppState().userInfo.stdId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: OrdersshimmerWidget(),
          );
        }
        final powerProductsPowerPackagesResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
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
                  size: 24.0,
                ),
              ),
              title: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('POWER_PRODUCTS_PAGE_Text_igfxhz2e_ON_TAP');
                  logFirebaseEvent('Text_update_app_state');
                  setState(() {
                    FFAppState().powercart = [];
                    FFAppState().powerfinalamount = 0.0;
                  });
                  logFirebaseEvent('Text_update_page_state');
                  setState(() {
                    _model.selectdNo = [];
                  });
                },
                child: Text(
                  FFLocalizations.of(context).getText(
                    'xefeb1mt' /* Power Packages */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFF272727),
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 100.0,
                        child: CarouselSlider(
                          items: [
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
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
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
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
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).warning,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
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
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).error,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
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
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
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
                                const Duration(milliseconds: 800),
                            autoPlayInterval:
                                const Duration(milliseconds: (800 + 4000)),
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
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 10.0, 10.0),
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
                                        widget.productId)
                                    .toList()
                                    .toList() ??
                                [];
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: combos.length,
                              itemBuilder: (context, combosIndex) {
                                final combosItem = combos[combosIndex];
                                return Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      const CheckboxThemeData(
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
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                            .checkboxListTileValueMap[
                                                        combosItem] = newValue!);
                                                    if (newValue!) {
                                                      logFirebaseEvent(
                                                          'POWER_PRODUCTS_CheckboxListTile_cgc9m3o2');
                                                      logFirebaseEvent(
                                                          'CheckboxListTile_update_page_state');
                                                      setState(() {
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
                                                      });
                                                      logFirebaseEvent(
                                                          'CheckboxListTile_update_app_state');
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                            .addToPowercart(
                                                                PowercartStruct(
                                                          productId:
                                                              getJsonField(
                                                            combosItem,
                                                            r'''$.comboProducts.product_id''',
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
                                                                .deliveryfee =
                                                            functions.powerdeliveryfee(
                                                                FFAppState()
                                                                    .powercart
                                                                    .toList());
                                                        FFAppState()
                                                            .addToPowerId(
                                                                getJsonField(
                                                          combosItem,
                                                          r'''$.product_ids''',
                                                        ).toString());
                                                      });
                                                      logFirebaseEvent(
                                                          'CheckboxListTile_update_app_state');
                                                      setState(() {
                                                        FFAppState()
                                                                .powerfinalamount =
                                                            functions.grandtotal(
                                                                FFAppState()
                                                                    .powercartvalue,
                                                                functions
                                                                    .calculatetotalamount(
                                                                        _model
                                                                            .discountfee!,
                                                                        FFAppState()
                                                                            .powercartvalue)
                                                                    .toDouble(),
                                                                FFAppState()
                                                                    .deliveryfee);
                                                      });
                                                    } else {
                                                      logFirebaseEvent(
                                                          'POWER_PRODUCTS_CheckboxListTile_cgc9m3o2');
                                                      logFirebaseEvent(
                                                          'CheckboxListTile_update_page_state');
                                                      setState(() {
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
                                                      });
                                                      // Action 1
                                                      logFirebaseEvent(
                                                          'CheckboxListTile_Action1');
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                            .removeFromPowercart(
                                                                PowercartStruct(
                                                          productId:
                                                              getJsonField(
                                                            combosItem,
                                                            r'''$.comboProducts.product_id''',
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
                                                            .removeFromPowerId(
                                                                getJsonField(
                                                          combosItem,
                                                          r'''$.product_ids''',
                                                        ).toString());
                                                        FFAppState()
                                                                .deliveryfee =
                                                            functions.powerdeliveryfee(
                                                                FFAppState()
                                                                    .powercart
                                                                    .toList());
                                                      });
                                                      logFirebaseEvent(
                                                          'CheckboxListTile_update_app_state');
                                                      setState(() {
                                                        FFAppState()
                                                                .powerfinalamount =
                                                            functions.grandtotal(
                                                                FFAppState()
                                                                    .powercartvalue,
                                                                functions
                                                                    .calculatetotalamount(
                                                                        _model
                                                                            .discountfee!,
                                                                        FFAppState()
                                                                            .powercartvalue)
                                                                    .toDouble(),
                                                                FFAppState()
                                                                    .deliveryfee);
                                                      });
                                                    }
                                                  },
                                                  title: Text(
                                                    getJsonField(
                                                      combosItem,
                                                      r'''$.comboName''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  subtitle: Text(
                                                    '₹ ${getJsonField(
                                                      combosItem,
                                                      r'''$.comboDetails.INR''',
                                                    ).toString()}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
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
                                                          const CheckboxThemeData(
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
                                                              setState(() =>
                                                                  _model.checkboxValueMap1[
                                                                          productsItem] =
                                                                      newValue!);
                                                            },
                                                      side: BorderSide(
                                                        width: 2,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
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
                                                  Text(
                                                    getJsonField(
                                                      productsItem,
                                                      r'''$.title''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
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
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'sodpbpk8' /* Note : Delivery Charges Will B... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: const Color(0xFFEE4C4C),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'lk77kwap' /* Price Details */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'q6hd7u2k' /* Cart value */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        functions
                                            .powercartamount(
                                                FFAppState().powercart.toList())
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'gupms4xu' /* You saved */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      functions
                                          .calculatetotalamount(
                                              valueOrDefault<double>(
                                                _model.discountfee,
                                                0.0,
                                              ),
                                              FFAppState().powercartvalue)
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'tlevidea' /* Delivery Charges */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      functions
                                          .powerdeliveryfee(
                                              FFAppState().powercart.toList())
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '09du24ib' /* Total Amount */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        FFAppState()
                                            .powerfinalamount
                                            .toString(),
                                        '0.00',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
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
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue2 ??= false,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.checkboxValue2 = newValue!);
                                    },
                                    side: BorderSide(
                                      width: 2,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'o1khkvud' /* I agree to Terms & Condition */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
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
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 30.0),
                              child: FFButtonWidget(
                                onPressed: (FFAppState().powerfinalamount ==
                                        0.0)
                                    ? null
                                    : () async {
                                        logFirebaseEvent(
                                            'POWER_PRODUCTS_PAGE_PAY_NOW_BTN_ON_TAP');
                                        if (_model.checkboxValue2 == true) {
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          _model.apiResult3ma =
                                              await ProductsSubscriptionCall
                                                  .call(
                                            userId:
                                                FFAppState().userInfo.userId,
                                            productsList: functions.convertint(
                                                FFAppState()
                                                    .powercomboid
                                                    .toList()),
                                            payableAmount: FFAppState()
                                                .powerfinalamount
                                                .toString(),
                                            deliveryCharge: FFAppState()
                                                .deliveryfee
                                                .toString(),
                                            powerpackid:
                                                widget.productId?.toString(),
                                            purchaseType: 'combo',
                                            comboIdList: FFAppState().powerId,
                                          );
                                          if ((_model.apiResult3ma?.succeeded ??
                                              true)) {
                                            logFirebaseEvent(
                                                'Button_update_app_state');
                                            setState(() {
                                              FFAppState().merchantTranId =
                                                  ProductsSubscriptionCall
                                                      .merchantId(
                                                (_model.apiResult3ma
                                                        ?.jsonBody ??
                                                    ''),
                                              )!;
                                            });
                                            logFirebaseEvent(
                                                'Button_custom_action');
                                            _model.sha256 =
                                                await actions.generateSha(
                                              'ac7f1970-3484-422a-a285-49a6e63e029d',
                                              functions.jsontobase64(
                                                  functions.createJson(
                                                      'M222Z8QFUNMKT',
                                                      FFAppState()
                                                          .merchantTranId,
                                                      functions.rupeestopaisa(
                                                          FFAppState()
                                                              .powerfinalamount),
                                                      FFAppState()
                                                          .userInfo
                                                          .userId,
                                                      'indiantalentolympiad://indiantalentolympiad.com${GoRouterState.of(context).uri.toString()}',
                                                      'REDIRECT',
                                                      'https://www.indiantalent.org/RESTapi/student/payment/Phonepe_callback',
                                                      FFAppState()
                                                          .userInfo
                                                          .mobileNo)),
                                            );
                                            logFirebaseEvent(
                                                'Button_backend_call');
                                            _model.payApi =
                                                await PhonepeCall.call(
                                              verify: _model.sha256,
                                              base: functions.jsontobase64(
                                                  functions.createJson(
                                                      'M222Z8QFUNMKT',
                                                      FFAppState()
                                                          .merchantTranId,
                                                      functions.rupeestopaisa(
                                                          FFAppState()
                                                              .powerfinalamount),
                                                      FFAppState()
                                                          .userInfo
                                                          .userId,
                                                      'indiantalentolympiad://indiantalentolympiad.com${GoRouterState.of(context).uri.toString()}',
                                                      'REDIRECT',
                                                      'https://www.indiantalent.org/RESTapi/student/payment/Phonepe_callback',
                                                      FFAppState()
                                                          .userInfo
                                                          .mobileNo)),
                                            );
                                            if ((_model.payApi?.succeeded ??
                                                true)) {
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Processing Your Order',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              logFirebaseEvent(
                                                  'Button_wait__delay');
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 2000));
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed(
                                                'powerwebview',
                                                queryParameters: {
                                                  'payurl': serializeParam(
                                                    PhonepeCall.url(
                                                      (_model.payApi
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: const Text('Alert !!'),
                                                      content: const Text(
                                                          'Select Atleast One Product'),
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
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed(
                                                'powerProducts',
                                                queryParameters: {
                                                  'productId': serializeParam(
                                                    widget.productId,
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }
                                          }
                                        } else {
                                          logFirebaseEvent(
                                              'Button_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: const Text('Warning!'),
                                                  content: const Text(
                                                      'Please Agree for Terms and Conditions'),
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
                                        }

                                        setState(() {});
                                      },
                                text: FFLocalizations.of(context).getText(
                                  'tstbglv9' /* Pay Now */,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0xFF004696),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
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
