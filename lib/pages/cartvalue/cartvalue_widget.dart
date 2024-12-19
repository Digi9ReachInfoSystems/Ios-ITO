import '../../backend/schema/structs/coupon_struct.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'cartvalue_model.dart';
export 'cartvalue_model.dart';

class CartvalueWidget extends StatefulWidget {
  const CartvalueWidget({super.key});

  @override
  State<CartvalueWidget> createState() => _CartvalueWidgetState();
}

class _CartvalueWidgetState extends State<CartvalueWidget> {
  late CartvalueModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartvalueModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Cartvalue'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CARTVALUE_PAGE_Cartvalue_ON_INIT_STATE');
      logFirebaseEvent('Cartvalue_update_app_state');
      setState(() {
        FFAppState().cartvalue = valueOrDefault<double>(
          functions.finalcartamount(FFAppState().totalcart.toList()),
          0.0,
        );
        FFAppState().deliveryfee = valueOrDefault<double>(
          functions.getdelivery(FFAppState().totalcart.toList()),
          0.0,
        );
        FFAppState().finalamount = functions.minusdiscountamount(
            valueOrDefault<double>(
              functions.payableamount(
                  FFAppState().cartvalue, FFAppState().deliveryfee),
              0.0,
            ),
            FFAppState().discountamount)!;
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
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF272727),
              size: 30.0,
            ),
             onPressed: () async {
    logFirebaseEvent('CARTVALUE_arrow_back_rounded_ICN_ON_TAP');
    logFirebaseEvent('IconButton_navigate_to');
    context.pushNamed('productsmenu');
  },
          ),
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
              child: Text(
                "Cart",
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
          actions: [],
          centerTitle: true,
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'zkc8pwsc' /* Cart Items */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Builder(
                      builder: (context) {
                        final allproducts = FFAppState().totalcart.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: allproducts.length,
                          itemBuilder: (context, allproductsIndex) {
                            final allproductsItem =
                                allproducts[allproductsIndex];
                            return Container(
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              functions
                                                  .getindexplus1(
                                                      allproductsIndex)
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Text(
                                                  ':  ${allproductsItem.productname}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          allproductsItem.productamount,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              functions
                                                  .getindexplus1(
                                                      allproductsIndex)
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Text(
                                                  ':  ${allproductsItem.productname}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          allproductsItem.productamount,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          allproductsItem.producttypes,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.delete_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'CARTVALUE_PAGE_delete_sharp_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_update_app_state');
                                          FFAppState().update(() {
                                            FFAppState()
                                                .removeAtIndexFromTotalcart(
                                                    allproductsIndex);
                                            FFAppState().removeFromProductids(
                                                allproductsItem.productId);
                                            FFAppState().cartvalue =
                                                valueOrDefault<double>(
                                              functions.finalcartamount(
                                                  FFAppState()
                                                      .totalcart
                                                      .toList()),
                                              0.0,
                                            );
                                            FFAppState().deliveryfee =
                                                valueOrDefault<double>(
                                              functions.getdelivery(FFAppState()
                                                  .totalcart
                                                  .toList()),
                                              0.0,
                                            );
                                            FFAppState().finalamount =
                                                valueOrDefault<double>(
                                              functions.payableamount(
                                                  FFAppState().cartvalue,
                                                  FFAppState().deliveryfee),
                                              0.0,
                                            );
                                          });
                                          logFirebaseEvent(
                                              'IconButton_update_app_state');
                                          setState(() {
                                            FFAppState().couponscode =
                                                CouponStruct();
                                            FFAppState().applied = [];
                                            FFAppState().discountamount = 0.0;
                                            FFAppState().finalamount =
                                                functions.minusdiscountamount(
                                                    valueOrDefault<double>(
                                                      functions.payableamount(
                                                          FFAppState()
                                                              .cartvalue,
                                                          FFAppState()
                                                              .deliveryfee),
                                                      0.0,
                                                    ),
                                                    FFAppState()
                                                        .discountamount)!;
                                          });
                                         
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'kbpx018a' /* Apply Coupons */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                  if (!(FFAppState().applied.isNotEmpty))
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'CARTVALUE_PAGE_Container_7mhmyc89_ON_TAP');
                        logFirebaseEvent('Container_navigate_to');

                        context.pushNamed('Coupons');
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '8hlb008n' /* Select Coupons */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF453F3F),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.navigate_next_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (FFAppState().applied.isNotEmpty)
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 70,
                      decoration: BoxDecoration(),
                      child: Lottie.asset(
                        'assets/lottie_animations/Animation_-_1708324297486.json',
                        width: 150,
                        height: 130,
                        fit: BoxFit.cover,
                        repeat: false,
                        animate: true,
                      ),
                    ),
                    if (FFAppState().applied.isNotEmpty)
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 70,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .secondaryBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                   "Whoo Hoo !!",
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .error,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'You got ${FFAppState().couponscode.couponName} % off on your order',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'CARTVALUE_PAGE_Text_mv11feey_ON_TAP');
                                    logFirebaseEvent('Text_update_app_state');
                                    setState(() {
                                      FFAppState().couponscode =
                                          CouponStruct();
                                      FFAppState().applied = [];
                                      FFAppState().discountamount = 0.0;
                                      FFAppState().finalamount =
                                          functions.minusdiscountamount(
                                              valueOrDefault<double>(
                                                functions.payableamount(
                                                    FFAppState().cartvalue,
                                                    FFAppState().deliveryfee),
                                                0.0,
                                              ),
                                              FFAppState().discountamount)!;
                                    });
                                    
                                  },
                                  child: Text(
                                   "Remove",
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                        ),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'wur683yv' /* Note : Delivery Charges Will B... */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFFEE4C4C),
                                    fontSize: 12.0,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'sp2eee6k' /* Price Details */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '0fnj3s10' /* Cart value */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  FFAppState().cartvalue.toString(),
                                  '0.0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '1cbpysg2' /* You saved  */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                '${FFAppState().discountamount.toString()}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '252uzosp' /* Delivery Charges */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  FFAppState().deliveryfee.toString(),
                                  '0.0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'p8uywyao' /* Total Amount */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  FFAppState().finalamount.toString(),
                                  '0.0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.black,
                                      fontSize: 16.0,
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
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                            child: Checkbox(
                              value: _model.checkboxValue ??= false,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.checkboxValue = newValue!);
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: FlutterFlowTheme.of(context).info,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'gnced78c' /* I agree to Terms & Condition */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.black,
                                      fontSize: 14.0,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'CARTVALUE_PAGE_Text_6eqjdnsf_ON_TAP');
                                logFirebaseEvent('Text_launch_u_r_l');
                                await launchURL(
                                    'https://www.indiantalent.org/terms');
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '6c8ri30k' /* see more */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 30.0),
                        child: FFButtonWidget(
                          onPressed: (FFAppState().finalamount == 0.0)
                              ? null
                              : () async {
                                  logFirebaseEvent(
                                      'CARTVALUE_PAGE_PAY_NOW_BTN_ON_TAP');
                                  if (_model.checkboxValue == true) {
                                    logFirebaseEvent('Button_backend_call');
                                    _model.apiResult3ma =
                                        await ProductsSubscriptionCall.call(
                                      userId: FFAppState().userInfo.userId,
                                      productsList: functions.convertint(
                                          FFAppState().productids.toList()),
                                      payableAmount: valueOrDefault<String>(
                                        FFAppState().finalamount.toString(),
                                        '0.0',
                                      ),
                                      deliveryCharge:
                                          FFAppState().deliveryfee.toString(),
                                          purchaseType: 'individual',
                                    );
                                    if ((_model.apiResult3ma?.succeeded ??
                                        true)) {
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      setState(() {
                                        FFAppState().merchantTranId =
                                            ProductsSubscriptionCall.merchantId(
                                          (_model.apiResult3ma?.jsonBody ?? ''),
                                        )!;
                                      });
                                      logFirebaseEvent('Button_custom_action');
                                      _model.sha256 = await actions.generateSha(
                                        'ac7f1970-3484-422a-a285-49a6e63e029d',
                                        functions.jsontobase64(functions.createJson(
                                            'M222Z8QFUNMKT',
                                            FFAppState().merchantTranId,
                                            functions.rupeestopaisa(
                                                FFAppState().finalamount),
                                            FFAppState().userInfo.userId,
                                            'indiantalentolympiad://indiantalentolympiad.com${GoRouterState.of(context).uri.toString()}',
                                            'REDIRECT',
                                            'https://www.indiantalent.org/RESTapi/student/payment/Phonepe_callback',
                                            FFAppState().userInfo.mobileNo)),
                                      );
                                      logFirebaseEvent('Button_backend_call');
                                      _model.payApi = await PhonepeCall.call(
                                        verify: _model.sha256,
                                        base: functions.jsontobase64(
                                            functions.createJson(
                                                'M222Z8QFUNMKT',
                                                FFAppState().merchantTranId,
                                                functions.rupeestopaisa(
                                                    FFAppState().finalamount),
                                                FFAppState().userInfo.userId,
                                                'indiantalentolympiad://indiantalentolympiad.com${GoRouterState.of(context).uri.toString()}',
                                                'REDIRECT',
                                                'https://www.indiantalent.org/RESTapi/student/payment/Phonepe_callback',
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
                                            const Duration(milliseconds: 2000));
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamed(
                                          'productWebview',
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

                                        context.pushNamed('Cartvalue');
                                      }
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

                                  setState(() {});
                                },
                          text: FFLocalizations.of(context).getText(
                            'b5kuyiyw' /* Pay Now */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF004696),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 10.0)).around(SizedBox(height: 10.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
