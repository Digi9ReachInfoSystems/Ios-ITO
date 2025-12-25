import 'package:google_fonts/google_fonts.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'cartvalue_copy_model.dart';
export 'cartvalue_copy_model.dart';

class CartvalueCopyWidget extends StatefulWidget {
  const CartvalueCopyWidget({super.key});

  static String routeName = 'CartvalueCopy';
  static String routePath = '/cartvalueCopy';

  @override
  State<CartvalueCopyWidget> createState() => _CartvalueCopyWidgetState();
}

class _CartvalueCopyWidgetState extends State<CartvalueCopyWidget> {
  late CartvalueCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
void initState() {
  super.initState();
  _model = createModel(context, () => CartvalueCopyModel());

  SchedulerBinding.instance.addPostFrameCallback((_) async {
    FFAppState().combocart = valueOrDefault<double>(
      functions.finalcartamountCopy(FFAppState().totalcombocart.toList()),
      0.0,
    );
    FFAppState().combodedliveryfee = valueOrDefault<double>(
      functions.deliveryfee(FFAppState().totalcombocart.toList()),
      0.0,
    );
    FFAppState().deliverablecount =
        functions.deliverablecount(FFAppState().totalcombocart.toList());
    FFAppState().discountamount =
        functions.discountfee(FFAppState().totalcombocart.toList());
    FFAppState().combofinalamount = functions.payableamount(
      FFAppState().combocart,
      FFAppState().combodedliveryfee,
    );
    FFAppState().update(() {});
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
              logFirebaseEvent('CARTVALUE_COPY_arrow_back_rounded_ICN_ON');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('CARTVALUE_COPY_PAGE_Text_nxrdwhc3_ON_TAP');
              logFirebaseEvent('Text_update_app_state');
              FFAppState().totalcombocart = [];
              FFAppState().combocart = 0.0;
              FFAppState().combofinalamount = 0.0;
              FFAppState().noofselected = [];
              safeSetState(() {});
            },
            child: Text(
              'Cart',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                                        fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.5,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '3smopjnm' /* Cart Items */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Builder(
                      builder: (context) {
                        final allproducts =
                            FFAppState().totalcombocart.toList();

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
                              child: Container(
  padding: const EdgeInsets.all(10.0),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// LEFT CONTENT
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// PRODUCT NAME
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  functions.getindexplus1(allproductsIndex).toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontWeight: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .fontWeight,
                      ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    ':  ${allproductsItem.productname}',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            /// PRICE
            Row(
              children: [
                const Text('₹'),
                const SizedBox(width: 2),
                Text(
                  allproductsItem.productamount,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),

            const SizedBox(height: 4),

            /// ITEM COUNT
            Text(
              '${allproductsItem.noOfitems} items',
              style: FlutterFlowTheme.of(context)
                  .bodySmall
                  .copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),

      /// DELETE BUTTON (LOGIC UNCHANGED)
      FlutterFlowIconButton(
        borderColor: FlutterFlowTheme.of(context).primary,
        borderRadius: 20.0,
        borderWidth: 1.0,
        buttonSize: 40.0,
        fillColor: FlutterFlowTheme.of(context).primary,
        icon: Icon(
          Icons.delete_sharp,
          color: FlutterFlowTheme.of(context).primaryBackground,
          size: 24.0,
        ),
        onPressed: () async {
          FFAppState().update(() {
            FFAppState().removeAtIndexFromTotalcombocart(allproductsIndex);

            FFAppState().combocart = valueOrDefault<double>(
              functions.finalcartamountCopy(
                FFAppState().totalcombocart.toList(),
              ),
              0.0,
            );

            FFAppState().combodedliveryfee = valueOrDefault<double>(
              functions.deliveryfee(
                FFAppState().totalcombocart.toList(),
              ),
              0.0,
            );

            FFAppState().combofinalamount = functions.doubletoString(
              functions.discountedamount(
                functions
                    .stringToInt(
                        FFAppState().noofselected.length.toString())
                    .toString(),
                functions
                    .payableamount(
                      FFAppState().combocart,
                      FFAppState().combodedliveryfee,
                    )
                    .toString(),
              ),
            );

            FFAppState().discountamount =
                functions.discountfee(
                    FFAppState().totalcombocart.toList());

            FFAppState().deliverablecount =
                functions.deliverablecount(
                    FFAppState().totalcombocart.toList());

            FFAppState().removeFromComboid(
                allproductsItem.productId);
            FFAppState().removeFromCertificateId(
                allproductsItem.productId);
          });

          FFAppState().update(() {
            FFAppState().removeAtIndexFromNoofselected(allproductsIndex);
          });
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
                            'sodpbpk8' /* Note : Delivery Charges Will B... */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                                                        color: Color(0xFFEE4C4C),
                                    fontSize: 12.0,
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
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '7i2m2l6w' /* Price Details */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                                                        color: Colors.black,
                                    fontSize: 18.0,
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
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'q6hd7u2k' /* Cart value */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                                                            color: Colors.black,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFAppState().combocart.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                                                            color: Colors.black,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
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
                                  'tlevidea' /* Delivery Charges */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                                                            color: Colors.black,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFAppState().combodedliveryfee.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                                                            color: Colors.black,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
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
                                  'gupms4xu' /* You saved */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                                                            color: Colors.black,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            if (FFAppState().discountamount < 0)
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  '0',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                                                              color: Colors.black,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .fontStyle,
                                      ),
                                ),
                              ),
                            if (FFAppState().discountamount >= 0)
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFAppState().discountamount.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                                                            color: Colors.black,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
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
                                  '09du24ib' /* Total Amount */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                                                            color: Colors.black,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFAppState().combofinalamount.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                                                            color: Colors.black,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                            child: Checkbox(
                              value: _model.checkboxValue ??= false,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.checkboxValue = newValue!);
                              },
                              side:
                                  (FlutterFlowTheme.of(context).secondaryText !=
                                          null)
                                      ? BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        )
                                      : null,
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
                                  'o1khkvud' /* I agree to Terms & Condition */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                                                            color: Colors.black,
                                      fontSize: 14.0,
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
                                    'CARTVALUE_COPY_PAGE_Text_u6d9v26x_ON_TAP');
                                logFirebaseEvent('Text_launch_u_r_l');
                                await launchURL(
                                    'https://www.indiantalent.org/terms');
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'sr9wptaz' /* see more */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                                                            color:
                                          FlutterFlowTheme.of(context).success,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 30.0),
                        child: FFButtonWidget(
                          onPressed: (FFAppState().combofinalamount == 0.0)
                              ? null
                              : () async {
                                print('🟢 PAY NOW CLICKED');
print('✅ Checkbox value: ${_model.checkboxValue}');
print('💰 Combo Final Amount: ${FFAppState().combofinalamount}');
print('📦 Combo IDs: ${FFAppState().comboid}');
print('📜 Certificate IDs: ${FFAppState().certificateId}');

                                  logFirebaseEvent(
                                      'CARTVALUE_COPY_PAGE_PAY_NOW_BTN_ON_TAP');
                                  if (_model.checkboxValue == true) {
                                    logFirebaseEvent('Button_custom_action');
                                    _model.oldversion =
                                        await actions.upgrader();
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    _model.version = _model.oldversion ==
                                            FFAppState().appcheck
                                        ? 0
                                        : 1;
                                    safeSetState(() {});
                                    print('📤 Submitregistration REQUEST START');
print('userid: ${FFAppState().userInfo.userId}');
print('comboIdList: ${FFAppState().comboid}');
print('certificatesList: ${FFAppState().certificateId}');
print('payment: Phonepe');
print('slug: students/second_round_buy');
print('totaldiscount: ${FFAppState().discountamount}');
print('finalamount: ${FFAppState().combofinalamount}');
print('deliverycharges: ${FFAppState().combodedliveryfee}');
print('isUpdated: ${_model.version}');
print('📤 Submitregistration REQUEST END');

                                    logFirebaseEvent('Button_backend_call');
                                    _model.apiResult3ma =
                                        await SubmitregistrationCall.call(
                                      userid: FFAppState().userInfo.userId,
  comboIdList: FFAppState().comboid,
  certificatesList: FFAppState().certificateId.isEmpty
      ? []
      : FFAppState().certificateId,
  payment: 'Phonepe',
  slug: 'students/second_round_buy',
  totaldiscount: FFAppState().discountamount.abs().toString(),
  finalamount: FFAppState().combofinalamount.toString(),
  deliverycharges: FFAppState().combodedliveryfee.toString(),
  isUpdated: _model.version,
  token: FFAppState().userInfo.token,
                                    );

                                    if ((_model.apiResult3ma?.succeeded ??
                                        true)) {
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().transactionId =
                                          SubmitregistrationCall.transactionId(
                                        (_model.apiResult3ma?.jsonBody ?? ''),
                                      )!;
                                      print('⬅️ Submitregistration API RESPONSE:');
print('Succeeded: ${_model.apiResult3ma?.succeeded}');
print('Raw JSON: ${_model.apiResult3ma?.jsonBody}');

                                      safeSetState(() {});
                                      print('🧾 Transaction ID from backend: ${FFAppState().transactionId}');
print('🔐 Generating SHA with data:');
print('Merchant ID: M222Z8QFUNMKT');
print('Transaction ID: ${FFAppState().transactionId}');
print('Amount (paisa): ${functions.rupeestopaisa(FFAppState().combofinalamount)}');
print('User ID: ${FFAppState().userInfo.userId}');

                                      logFirebaseEvent('Button_custom_action');
                                      _model.sha256 = await actions.generateSha(
                                        'ac7f1970-3484-422a-a285-49a6e63e029d',
                                        functions.jsontobase64(functions.createJson(
                                            'M222Z8QFUNMKT',
                                            FFAppState().transactionId,
                                            functions.rupeestopaisa(
                                                FFAppState().combofinalamount),
                                            FFAppState().userInfo.userId,
                                            'indiantalentolympiad://indiantalentolympiad.com${GoRouterState.of(context).uri.toString()}',
                                            'REDIRECT',
                                            'https://www.indiantalent.org/RESTapi/student/payment/Phonepe_callback',
                                            FFAppState().userInfo.mobileNo)),
                                      );
                                      print('🔐 SHA GENERATED: ${_model.sha256}');
print('📡 Calling PhonePe API...');

                                      logFirebaseEvent('Button_backend_call');
                                      _model.payApi = await PhonepeCall.call(
                                        verify: _model.sha256,
                                        base: functions.jsontobase64(
                                            functions.createJson(
                                                'M222Z8QFUNMKT',
                                                FFAppState().transactionId,
                                                functions.rupeestopaisa(
                                                    FFAppState()
                                                        .combofinalamount),
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
                                          Duration(
                                            milliseconds: 3000,
                                          ),
                                        );
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamed(
                                          WebviewPaymentWidget.routeName,
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
                                            CartvalueCopyWidget.routeName);
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

                                  safeSetState(() {});
                                },
                          text: FFLocalizations.of(context).getText(
                            'tstbglv9' /* Pay Now */,
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
                                                                    color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
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
                            disabledColor:
                                FlutterFlowTheme.of(context).secondary,
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
