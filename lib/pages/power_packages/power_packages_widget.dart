import '../special_offershimeer/special_offershimeer_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'power_packages_model.dart';
export 'power_packages_model.dart';

class PowerPackagesWidget extends StatefulWidget {
  const PowerPackagesWidget({super.key});

  @override
  State<PowerPackagesWidget> createState() => _PowerPackagesWidgetState();
}

class _PowerPackagesWidgetState extends State<PowerPackagesWidget> {
  late PowerPackagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PowerPackagesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'powerPackages'});
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
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          
          title: Text(
            FFLocalizations.of(context).getText(
              'h526nx3j' /* Power Packages */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: const [],
          centerTitle: true,
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: PowerPackagesCall.call(
              stdId: FFAppState().userInfo.stdId,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
             if (!snapshot.hasData) {
                return const SpecialOffershimeerWidget();
              }
              final listViewPowerPackagesResponse = snapshot.data!;
              return Builder(
                builder: (context) {
                  final pacakges = PowerPackagesCall.packages(
                        listViewPowerPackagesResponse.jsonBody,
                      )?.toList() ??
                      [];
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: pacakges.length,
                    itemBuilder: (context, pacakgesIndex) {
                      final pacakgesItem = pacakges[pacakgesIndex];
                      return Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: const Color(0xFF198543),
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.75,
                                  
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        child: Text(
                                          getJsonField(
                                            pacakgesItem,
                                            r'''$.packageName''',
                                          ).toString(),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: const Color(0xFF272727),
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    getJsonField(
                                      pacakgesItem,
                                      r'''$.packageData.description''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320.0,
                                child: Divider(
                                  thickness: 1.0,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'POWER_PACKAGES_PAGE_BUY_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'powerProducts',
                                      queryParameters: {
                                        'productId': serializeParam(
                                          getJsonField(
                                            pacakgesItem,
                                            r'''$.packageData.package_id''',
                                          ),
                                          ParamType.JSON,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '3p380dgi' /* Buy */,
                                  ),
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF004696),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
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
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
