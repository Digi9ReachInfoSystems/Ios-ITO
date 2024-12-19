import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_webview_model.dart';
export 'product_webview_model.dart';

class ProductWebviewWidget extends StatefulWidget {
  const ProductWebviewWidget({
    super.key,
    required this.payurl,
  });

  final String? payurl;

  @override
  State<ProductWebviewWidget> createState() => _ProductWebviewWidgetState();
}

class _ProductWebviewWidgetState extends State<ProductWebviewWidget> {
  late ProductWebviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductWebviewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'productWebview'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PRODUCT_WEBVIEW_productWebview_ON_INIT_S');
      logFirebaseEvent('productWebview_start_periodic_action');
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 5000),
        callback: (timer) async {
          logFirebaseEvent('productWebview_backend_call');
          _model.status = await StatusCheckCall.call(
            trancastionid: FFAppState().merchantTranId,
          );
          if ((_model.status?.succeeded ?? true)) {
            if (StatusCheckCall.code(
                  (_model.status?.jsonBody ?? ''),
                ) ==
                'SUCCESS') {
              logFirebaseEvent('productWebview_stop_periodic_action');
              _model.instantTimer?.cancel();
              logFirebaseEvent('productWebview_navigate_to');

              context.pushNamed('paymentSuccess');

              logFirebaseEvent('productWebview_update_app_state');
              setState(() {
                FFAppState().totalcart = [];
                FFAppState().finalamount = 0.0;
                FFAppState().cartvalue = 0.0;
                FFAppState().deliveryfee = 0.0;
                FFAppState().productids = [];
              });
            } else if (StatusCheckCall.code(
                  (_model.status?.jsonBody ?? ''),
                ) ==
                'Pending') {
            } else {
              logFirebaseEvent('productWebview_stop_periodic_action');
              _model.instantTimer?.cancel();
              logFirebaseEvent('productWebview_navigate_to');

              context.pushNamed('productFailure');
            }
          }
        },
        startImmediately: true,
      );
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
              logFirebaseEvent('PRODUCT_WEBVIEW_arrow_back_rounded_ICN_O');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '8m08hc0c' /* Pay now */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF272727),
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowWebView(
                  content: widget.payurl!,
                  bypass: true,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  verticalScroll: false,
                  horizontalScroll: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
