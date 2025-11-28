import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/special_offershimeer/special_offershimeer_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'power_packages_model.dart';
export 'power_packages_model.dart';

class PowerPackagesWidget extends StatefulWidget {
  const PowerPackagesWidget({super.key});

  static String routeName = 'powerPackages';
  static String routePath = '/powerPackages';

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
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POWER_PACKAGES_powerPackages_ON_INIT_STA');
      Function() _navigate = () {};
      logFirebaseEvent('powerPackages_backend_call');
      _model.validatetoken = await ValidateTokenCall.call(
        token: FFAppState().userInfo.token,
      );

      if (!(_model.validatetoken?.succeeded ?? true)) {
        logFirebaseEvent('powerPackages_backend_call');
        _model.getnewtoken = await GetNewTokenCall.call(
          userID: FFAppState().userInfo.token,
        );

        if ((_model.getnewtoken?.succeeded ?? true)) {
          logFirebaseEvent('powerPackages_update_app_state');
          FFAppState().updateUserInfoStruct(
            (e) => e
              ..token = getJsonField(
                (_model.getnewtoken?.jsonBody ?? ''),
                r'''$.jwt_token''',
              ).toString(),
          );
          FFAppState().update(() {});
        } else {
          logFirebaseEvent('powerPackages_show_snack_bar');
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
          logFirebaseEvent('powerPackages_auth');
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          _navigate = () =>
              context.goNamedAuth(OnBoardingWidget.routeName, context.mounted);
        }
      }

      _navigate();
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
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'h526nx3j' /* Power Packages */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.black,
                  fontSize: 18,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.5,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: PowerPackagesCall.call(
              stdId: FFAppState().userInfo.stdId,
              token: FFAppState().userInfo.token,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return SpecialOffershimeerWidget();
              }
              final listViewPowerPackagesResponse = snapshot.data!;

              return Builder(
                builder: (context) {
                  final pacakges = PowerPackagesCall.packages(
                        listViewPowerPackagesResponse.jsonBody,
                      )?.toList() ??
                      [];
                  if (pacakges.isEmpty) {
                    return Center(
                      child: EmptyWidgetWidget(
                        datatype: 'Power Packages',
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: pacakges.length,
                    itemBuilder: (context, pacakgesIndex) {
                      final pacakgesItem = pacakges[pacakgesIndex];
                      return Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFF198543),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.75,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.06,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 5),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          getJsonField(
                                            pacakgesItem,
                                            r'''$.packageName''',
                                          ).toString(),
                                          textAlign: TextAlign.center,
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
                                                color: Color(0xFF272727),
                                                fontSize: 17,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 8, 0, 0),
                                  child: Text(
                                    getJsonField(
                                      pacakgesItem,
                                      r'''$.packageData.description''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 320,
                                child: Divider(
                                  thickness: 1,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'POWER_PACKAGES_PAGE_BUY_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      PowerProductsWidget.routeName,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 24, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: Color(0xFF004696),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
