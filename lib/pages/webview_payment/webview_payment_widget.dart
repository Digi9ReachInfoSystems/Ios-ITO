import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'webview_payment_model.dart';
export 'webview_payment_model.dart';

class WebviewPaymentWidget extends StatefulWidget {
  const WebviewPaymentWidget({
    super.key,
    required this.payurl,
  });

  final String? payurl;

  @override
  State<WebviewPaymentWidget> createState() => _WebviewPaymentWidgetState();
}

class _WebviewPaymentWidgetState extends State<WebviewPaymentWidget> {
  late WebviewPaymentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebviewPaymentModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'webview_payment'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('WEBVIEW_PAYMENT_webview_payment_ON_INIT_');
      logFirebaseEvent('webview_payment_start_periodic_action');
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 5000),
        callback: (timer) async {
          logFirebaseEvent('webview_payment_backend_call');
          _model.status = await StatusCheckCall.call(
            trancastionid: FFAppState().transactionId,
          );
          if ((_model.status?.succeeded ?? true)) {
            if (StatusCheckCall.code(
                  (_model.status?.jsonBody ?? ''),
                ) ==
                'SUCCESS') {
              logFirebaseEvent('webview_payment_stop_periodic_action');
              _model.instantTimer?.cancel();
              logFirebaseEvent('webview_payment_navigate_to');

              context.pushNamed('paymentSuccess');

              logFirebaseEvent('webview_payment_update_app_state');
              setState(() {
                FFAppState().totalcombocart = [];
                FFAppState().combofinalamount = 0.0;
                FFAppState().combocart = 0.0;
                FFAppState().combodedliveryfee = 0.0;
                FFAppState().comboid = [];
                FFAppState().deliverablecount = 0;
                FFAppState().certificateId = [];
              });
            } else if (StatusCheckCall.code(
                  (_model.status?.jsonBody ?? ''),
                ) ==
                'Pending') {
            } else {
              logFirebaseEvent('webview_payment_stop_periodic_action');
              _model.instantTimer?.cancel();
              logFirebaseEvent('webview_payment_navigate_to');

              context.pushNamed('paymentfailure');
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
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF272727),
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('WEBVIEW_PAYMENT_arrow_back_rounded_ICN_O');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '7re2qlpj' /* Pay now */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF272727),
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
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
