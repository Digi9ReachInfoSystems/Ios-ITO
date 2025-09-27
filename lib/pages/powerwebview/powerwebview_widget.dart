import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'powerwebview_model.dart';
export 'powerwebview_model.dart';

class PowerwebviewWidget extends StatefulWidget {
  const PowerwebviewWidget({
    super.key,
    required this.payurl,
    this.productid,
  });

  final String? payurl;
  final dynamic productid;

  @override
  State<PowerwebviewWidget> createState() => _PowerwebviewWidgetState();
}

class _PowerwebviewWidgetState extends State<PowerwebviewWidget> {
  late PowerwebviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PowerwebviewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'powerwebview'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POWERWEBVIEW_powerwebview_ON_INIT_STATE');
      logFirebaseEvent('powerwebview_start_periodic_action');
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 5000),
        callback: (timer) async {
          logFirebaseEvent('powerwebview_backend_call');
          _model.status = await StatusCheckCall.call(
            trancastionid: FFAppState().merchantTranId,
          );
          if ((_model.status?.succeeded ?? true)) {
            if (StatusCheckCall.code(
                  (_model.status?.jsonBody ?? ''),
                ) ==
                'SUCCESS') {
              logFirebaseEvent('powerwebview_stop_periodic_action');
              _model.instantTimer?.cancel();
              logFirebaseEvent('powerwebview_navigate_to');

              context.pushNamed('paymentSuccess');

              logFirebaseEvent('powerwebview_update_app_state');
              setState(() {
                FFAppState().powercartvalue = 0.0;
                FFAppState().powerfinalamount = 0.0;
                FFAppState().powercomboid = [];
                FFAppState().powercart = [];
                FFAppState().deliveryfee = 0.0;
                FFAppState().powerdiscount = 0.0;
              });
            } else if (StatusCheckCall.code(
                  (_model.status?.jsonBody ?? ''),
                ) ==
                'Pending') {
            } else {
              logFirebaseEvent('powerwebview_stop_periodic_action');
              _model.instantTimer?.cancel();
              logFirebaseEvent('powerwebview_navigate_to');

              context.pushNamed(
                'powerfailure',
                queryParameters: {
                  'productid': serializeParam(
                    widget.productid,
                    ParamType.JSON,
                  ),
                  'payurl': serializeParam(
                    widget.payurl,
                    ParamType.String,
                  ),
                }.withoutNulls,
              );
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
              logFirebaseEvent('POWERWEBVIEW_arrow_back_rounded_ICN_ON_T');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'zzb4cpgy' /* Pay now */,
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
