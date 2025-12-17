import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'roundregistration_model.dart';
export 'roundregistration_model.dart';

class RoundregistrationWidget extends StatefulWidget {
  const RoundregistrationWidget({super.key});

  static String routeName = 'roundregistration';
  static String routePath = '/roundregistration';

  @override
  State<RoundregistrationWidget> createState() =>
      _RoundregistrationWidgetState();
}

class _RoundregistrationWidgetState extends State<RoundregistrationWidget> {
  late RoundregistrationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoundregistrationModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'roundregistration'});
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
      future: RoundregistrationCall.call(
        mobileNo: FFAppState().userInfo.mobileNo,
        userId: FFAppState().userInfo.userId,
        stdId: FFAppState().userInfo.stdId,
        token: FFAppState().userInfo.token,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final roundregistrationRoundregistrationResponse = snapshot.data!;

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
                  logFirebaseEvent('ROUNDREGISTRATION_arrow_back_rounded_ICN');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'dwowqgdq' /* Round 2 Registration */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.poppins(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Color(0xFF272727),
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'ROUNDREGISTRATION_Icon_ludfartp_ON_TAP');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed(CartvalueCopyWidget.routeName);
                    },
                    child: Icon(
                      Icons.shopping_cart_checkout,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) {
                        final pacakges = RoundregistrationCall.packages(
                              roundregistrationRoundregistrationResponse
                                  .jsonBody,
                            )?.toList() ??
                            [];

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: pacakges.length,
                          itemBuilder: (context, pacakgesIndex) {
                            final pacakgesItem = pacakges[pacakgesIndex];
                            return Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xC5F9CF58),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  child: Text(
                                                    getJsonField(
                                                      pacakgesItem,
                                                      r'''$.package_name''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          final science = getJsonField(
                                            pacakgesItem,
                                            r'''$.combos''',
                                          ).toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: science.length,
                                            itemBuilder:
                                                (context, scienceIndex) {
                                              final scienceItem =
                                                  science[scienceIndex];
                                              return Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                scienceItem,
                                                                r'''$.combo_name''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                          if (FFAppState()
                                                                  .comboid
                                                                  .contains(
                                                                      getJsonField(
                                                                    scienceItem,
                                                                    r'''$.combo_id''',
                                                                  ).toString()) ==
                                                              false)
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ROUNDREGISTRATION_Icon_7xb26hkj_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Icon_update_app_state');
                                                                FFAppState()
                                                                    .addToTotalcombocart(
                                                                        Round2cartStruct(
                                                                  productId:
                                                                      getJsonField(
                                                                    scienceItem,
                                                                    r'''$.combo_id''',
                                                                  ).toString(),
                                                                  productname:
                                                                      getJsonField(
                                                                    scienceItem,
                                                                    r'''$.combo_name''',
                                                                  ).toString(),
                                                                  productamount:
                                                                      getJsonField(
                                                                    scienceItem,
                                                                    r'''$.inr_discount_amt''',
                                                                  ).toString(),
                                                                  discountamout:
                                                                      getJsonField(
                                                                    scienceItem,
                                                                    r'''$.inr_amount''',
                                                                  ).toString(),
                                                                  deliverablecount:
                                                                      getJsonField(
                                                                    scienceItem,
                                                                    r'''$.deliverable_item_count''',
                                                                  ).toString(),
                                                                ));
                                                                FFAppState()
                                                                    .addToComboid(
                                                                        getJsonField(
                                                                  scienceItem,
                                                                  r'''$.combo_id''',
                                                                ).toString());
                                                                FFAppState()
                                                                        .discountamount =
                                                                    functions.discountfee(FFAppState()
                                                                        .totalcombocart
                                                                        .toList());
                                                                FFAppState()
                                                                        .combodedliveryfee =
                                                                    valueOrDefault<
                                                                        double>(
                                                                  functions.deliveryfee(
                                                                      FFAppState()
                                                                          .totalcombocart
                                                                          .toList()),
                                                                  0.0,
                                                                );
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                logFirebaseEvent(
                                                                    'Icon_show_snack_bar');
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Product added to the cart',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    action:
                                                                        SnackBarAction(
                                                                      label:
                                                                          'Go to cart',
                                                                      textColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      onPressed:
                                                                          () async {
                                                                        context.pushNamed(
                                                                            CartvalueCopyWidget.routeName);
                                                                      },
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .add_box_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 26.0,
                                                              ),
                                                            ),
                                                          if (FFAppState()
                                                                  .comboid
                                                                  .contains(
                                                                      getJsonField(
                                                                    scienceItem,
                                                                    r'''$.combo_id''',
                                                                  ).toString()) ==
                                                              true)
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ROUNDREGISTRATION_Icon_qy3btwwz_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Icon_update_app_state');
                                                                FFAppState()
                                                                    .removeFromTotalcombocart(
                                                                        Round2cartStruct(
                                                                  productId:
                                                                      getJsonField(
                                                                    scienceItem,
                                                                    r'''$.combo_id''',
                                                                  ).toString(),
                                                                  productname:
                                                                      getJsonField(
                                                                    scienceItem,
                                                                    r'''$.combo_name''',
                                                                  ).toString(),
                                                                  productamount:
                                                                      getJsonField(
                                                                    scienceItem,
                                                                    r'''$.inr_discount_amt''',
                                                                  ).toString(),
                                                                  discountamout:
                                                                      getJsonField(
                                                                    scienceItem,
                                                                    r'''$.inr_amount''',
                                                                  ).toString(),
                                                                  deliverablecount:
                                                                      getJsonField(
                                                                    scienceItem,
                                                                    r'''$.deliverable_item_count''',
                                                                  ).toString(),
                                                                ));
                                                                FFAppState()
                                                                    .removeFromComboid(
                                                                        getJsonField(
                                                                  scienceItem,
                                                                  r'''$.combo_id''',
                                                                ).toString());
                                                                FFAppState()
                                                                        .combocart =
                                                                    valueOrDefault<
                                                                        double>(
                                                                  functions.finalcartamountCopy(
                                                                      FFAppState()
                                                                          .totalcombocart
                                                                          .toList()),
                                                                  0.0,
                                                                );
                                                                FFAppState()
                                                                        .combodedliveryfee =
                                                                    valueOrDefault<
                                                                        double>(
                                                                  functions.deliveryfee(
                                                                      FFAppState()
                                                                          .totalcombocart
                                                                          .toList()),
                                                                  0.0,
                                                                );
                                                                FFAppState().combofinalamount = functions.payableamount(
                                                                    FFAppState()
                                                                        .combocart,
                                                                    FFAppState()
                                                                        .combodedliveryfee);
                                                                FFAppState()
                                                                        .deliverablecount =
                                                                    functions.deliverablecount(FFAppState()
                                                                        .totalcombocart
                                                                        .toList());
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                              },
                                                              child: Icon(
                                                                Icons.check,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 26.0,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '85xacx66' /* ₹  */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.readexPro(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        getJsonField(
                                                                      scienceItem,
                                                                      r'''$.inr_discount_amt''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(),
                                                                  ),
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'hkawktdp' /* / */,
                                                                    ),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0x95FF0000),
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        getJsonField(
                                                                      scienceItem,
                                                                      r'''$.inr_amount''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xDDB82929),
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough,
                                                                    ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .readexPro(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                          ),
                                                          if (getJsonField(
                                                                scienceItem,
                                                                r'''$.discount_in_percentage''',
                                                              ) !=
                                                              null)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text:
                                                                    getJsonField(
                                                                  scienceItem,
                                                                  r'''$.discount_in_percentage''',
                                                                ).toString(),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 35.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .readexPro(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            16.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            16.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                                showLoadingIndicator:
                                                                    false,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          final products =
                                                              getJsonField(
                                                            scienceItem,
                                                            r'''$.products''',
                                                          ).toList();

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                products.length,
                                                            itemBuilder: (context,
                                                                productsIndex) {
                                                              final productsItem =
                                                                  products[
                                                                      productsIndex];
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          productsItem
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
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
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xC5F9CF58),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Selected : ${FFAppState().totalcombocart.length.toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
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
                            );
                          },
                        );
                      },
                    ),
                    if (RoundregistrationCall.nonqualified(
                              roundregistrationRoundregistrationResponse
                                  .jsonBody,
                            ) !=
                            null &&
                        (RoundregistrationCall.nonqualified(
                          roundregistrationRoundregistrationResponse.jsonBody,
                        ))!
                            .isNotEmpty)
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            decoration: BoxDecoration(
                              color: Color(0xFF0DCAF0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.12,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '4kqt6pcb' /* Buy Round 1 One Certificate */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
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
                                                  color: Color(0x95FF0000),
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
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'rjobuwqa' /*  $ 80 / subject */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.readexPro(
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
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '3vbhy8d4' /* Certificate will be delivered ... */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
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
                                                    color: Color(0x95FF0000),
                                                    fontSize: 14.0,
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
                                Builder(
                                  builder: (context) {
                                    final non =
                                        RoundregistrationCall.nonqualified(
                                              roundregistrationRoundregistrationResponse
                                                  .jsonBody,
                                            )?.toList() ??
                                            [];

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: non.length,
                                      itemBuilder: (context, nonIndex) {
                                        final nonItem = non[nonIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    nonItem,
                                                    r'''$.subject_name''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .readexPro(
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
                                              if (FFAppState()
                                                      .comboid
                                                      .contains(getJsonField(
                                                        nonItem,
                                                        r'''$.product_id''',
                                                      ).toString()) ==
                                                  false)
                                                InkWell(
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
                                                        'ROUNDREGISTRATION_Icon_squ7yqb6_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_update_app_state');
                                                    FFAppState()
                                                        .addToTotalcombocart(
                                                            Round2cartStruct(
                                                      productId: getJsonField(
                                                        nonItem,
                                                        r'''$.product_id''',
                                                      ).toString(),
                                                      productname: getJsonField(
                                                        nonItem,
                                                        r'''$.subject_name''',
                                                      ).toString(),
                                                      productamount:
                                                          getJsonField(
                                                        nonItem,
                                                        r'''$.amount''',
                                                      ).toString(),
                                                      deliverablecount: '1',
                                                    ));
                                                    FFAppState()
                                                        .addToCertificateId(
                                                            getJsonField(
                                                      nonItem,
                                                      r'''$.product_id''',
                                                    ).toString());
                                                    safeSetState(() {});
                                                    logFirebaseEvent(
                                                        'Icon_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Product added to the cart',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        action: SnackBarAction(
                                                          label: 'Go to cart',
                                                          textColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                                CartvalueCopyWidget
                                                                    .routeName);
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.add_box_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 26.0,
                                                  ),
                                                ),
                                              if (FFAppState()
                                                      .comboid
                                                      .contains(getJsonField(
                                                        nonItem,
                                                        r'''$.product_id''',
                                                      ).toString()) ==
                                                  true)
                                                InkWell(
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
                                                        'ROUNDREGISTRATION_Icon_8rvod8zd_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_update_app_state');
                                                    FFAppState()
                                                        .removeFromTotalcombocart(
                                                            Round2cartStruct(
                                                      productId: getJsonField(
                                                        nonItem,
                                                        r'''$.product_id''',
                                                      ).toString(),
                                                      productname: getJsonField(
                                                        nonItem,
                                                        r'''$.subject_name''',
                                                      ).toString(),
                                                      productamount:
                                                          getJsonField(
                                                        nonItem,
                                                        r'''$.amount''',
                                                      ).toString(),
                                                      deliverablecount: '1',
                                                    ));
                                                    FFAppState().combocart =
                                                        valueOrDefault<double>(
                                                      functions
                                                          .finalcartamountCopy(
                                                              FFAppState()
                                                                  .totalcombocart
                                                                  .toList()),
                                                      0.0,
                                                    );
                                                    FFAppState()
                                                            .combodedliveryfee =
                                                        functions.discountfee(
                                                            FFAppState()
                                                                .totalcombocart
                                                                .toList());
                                                    FFAppState().combofinalamount =
                                                        functions.payableamount(
                                                            FFAppState()
                                                                .combocart,
                                                            FFAppState()
                                                                .combodedliveryfee);
                                                    FFAppState()
                                                        .removeFromCertificateId(
                                                            getJsonField(
                                                      nonItem,
                                                      r'''$.product_id''',
                                                    ).toString());
                                                    FFAppState().update(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.check,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 26.0,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
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
