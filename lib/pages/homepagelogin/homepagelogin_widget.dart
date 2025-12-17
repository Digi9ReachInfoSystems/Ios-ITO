import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_widget_widget.dart';
import '/components/notification_popup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/homeshimmer/homeshimmer_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

import 'homepagelogin_model.dart';
export 'homepagelogin_model.dart';

class HomepageloginWidget extends StatefulWidget {
  const HomepageloginWidget({super.key});

  static String routeName = 'Homepagelogin';
  static String routePath = '/homepagelogin';

  @override
  State<HomepageloginWidget> createState() => _HomepageloginWidgetState();
}

class _HomepageloginWidgetState extends State<HomepageloginWidget> {
  late HomepageloginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageloginModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Homepagelogin'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOMEPAGELOGIN_Homepagelogin_ON_INIT_STAT');
      logFirebaseEvent('Homepagelogin_backend_call');
      _model.validatetoken = await ValidateTokenCall.call(
        token: FFAppState().userInfo.token,
      );

      if ((_model.validatetoken?.succeeded ?? true)) {
        logFirebaseEvent('Homepagelogin_backend_call');
        _model.apiResulti35 = await GetServicesCall.call(
          token: FFAppState().userInfo.token,
        );

        logFirebaseEvent('Homepagelogin_backend_call');
        _model.newversion = await AppcheckCall.call(
          appId: 'com.ito.onlineexam.app',
          platform: () {
            if (isAndroid) {
              return 'android';
            } else if (isiOS) {
              return 'ios';
            } else {
              return '';
            }
          }(),
          token: FFAppState().userInfo.token,
        );

        logFirebaseEvent('Homepagelogin_custom_action');
        _model.appversion = await actions.upgrader();
        logFirebaseEvent('Homepagelogin_update_app_state');
        FFAppState().appcheck = _model.appversion!;
        safeSetState(() {});
        if (!functions.checkvertion(
            AppcheckCall.androidversion(
              (_model.newversion?.jsonBody ?? ''),
            )!,
            FFAppState().appcheck)) {
          logFirebaseEvent('Homepagelogin_navigate_to');

          context.goNamedAuth(OutOfversionWidget.routeName, context.mounted);
        }
        if ((_model.apiResulti35?.succeeded ?? true)) {
          logFirebaseEvent('Homepagelogin_alert_dialog');
          await showAlignedDialog(
            context: context,
            isGlobal: false,
            avoidOverflow: true,
            targetAnchor:
                AlignmentDirectional(0, -1).resolve(Directionality.of(context)),
            followerAnchor:
                AlignmentDirectional(0, -1).resolve(Directionality.of(context)),
            builder: (dialogContext) {
              return Material(
                color: Colors.transparent,
                child: WebViewAware(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(dialogContext).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Container(
                      height: 200,
                      child: NotificationPopupWidget(),
                    ),
                  ),
                ),
              );
            },
          );

          logFirebaseEvent('Homepagelogin_custom_action');
          _model.servicer = await actions.jsontodata(
            GetServicesCall.serviceName(
              (_model.apiResulti35?.jsonBody ?? ''),
            )!
                .toList(),
          );
          logFirebaseEvent('Homepagelogin_update_app_state');
          FFAppState().allservices =
              _model.servicer!.toList().cast<ServicesStruct>();
          FFAppState().appcheck = AppcheckCall.androidversion(
            (_model.newversion?.jsonBody ?? ''),
          )!;
          safeSetState(() {});
        } else {
          logFirebaseEvent('Homepagelogin_alert_dialog');
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  title: Text('message'),
                  content: Text('Check Your Internet Connection'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
        }
      } else {
        logFirebaseEvent('Homepagelogin_backend_call');
        _model.getnewtoken = await GetNewTokenCall.call(
          userID: FFAppState().userInfo.userId,
        );

        if ((_model.getnewtoken?.succeeded ?? true)) {
          logFirebaseEvent('Homepagelogin_update_app_state');
          FFAppState().updateUserInfoStruct(
            (e) => e
              ..token = getJsonField(
                (_model.getnewtoken?.jsonBody ?? ''),
                r'''$.jwt_token''',
              ).toString(),
          );
          safeSetState(() {});
          return;
        } else {
          logFirebaseEvent('Homepagelogin_show_snack_bar');
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
          logFirebaseEvent('Homepagelogin_auth');
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          return;
        }
      }
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

    return Builder(
      builder: (context) => FutureBuilder<ApiCallResponse>(
        future: GetServicesCall.call(
          token: FFAppState().userInfo.token,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                child: HomeshimmerWidget(),
              ),
            );
          }
          final homepageloginGetServicesResponse = snapshot.data!;

          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: PopScope(
              canPop: false,
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  title: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/indian-talent-olympiad-new-logo.png',
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<ApiCallResponse>(
                          future: NotificationsCall.call(
                            stdId: FFAppState().userInfo.stdId,
                            displayFor: 'student',
                            token: FFAppState().userInfo.token,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: SizedBox(
                                    width: 15,
                                    height: 15,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            final badgeNotificationsResponse = snapshot.data!;

                            return badges.Badge(
                              badgeContent: Text(
                                badgeNotificationsResponse.succeeded &&
                                        (badgeNotificationsResponse.jsonBody !=
                                            null)
                                    ? functions.totalnotification(
                                        valueOrDefault<int>(
                                          NotificationsCall.highpriority(
                                            badgeNotificationsResponse.jsonBody,
                                          )?.length,
                                          0,
                                        ),
                                        valueOrDefault<int>(
                                          NotificationsCall.announcements(
                                            badgeNotificationsResponse.jsonBody,
                                          )?.length,
                                          0,
                                        ))
                                    : '0',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                              showBadge: true,
                              shape: badges.BadgeShape.circle,
                              badgeColor: FlutterFlowTheme.of(context).primary,
                              elevation: 4,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              position: badges.BadgePosition.topStart(),
                              animationType: badges.BadgeAnimationType.scale,
                              toAnimate: true,
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primary,
                                  borderRadius: 10,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  fillColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  icon: Icon(
                                    Icons.notifications_active,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 25,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'HOMEPAGELOGIN_notifications_active_ICN_O');
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.pushNamed(
                                        NotificationsWidget.routeName);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 10,
                            borderWidth: 1,
                            buttonSize: 40,
                            fillColor: FlutterFlowTheme.of(context).accent1,
                            icon: Icon(
                              Icons.person,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 25,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'HOMEPAGELOGIN_PAGE_person_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_navigate_to');

                              context.pushNamed(ProfileWidget.routeName);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                  centerTitle: false,
                  elevation: 0.5,
                ),
                body: SafeArea(
                  top: true,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'HOMEPAGELOGIN_PAGE_Text_wqjcu7if_ON_TAP');
                                  logFirebaseEvent('Text_navigate_to');

                                  context.pushNamed(SummerquizWidget.routeName);
                                },
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '1mqf9cgg' /* Welcome back! */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 5, 0, 0),
                                  child: Text(
                                    FFAppState().userInfo.studentName,
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
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 5, 0, 0),
                                  child: Text(
                                    'Class : ${FFAppState().userInfo.stdId}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
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
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: BannersCall.call(
                                stdId: FFAppState().userInfo.stdId,
                                displayFor: 'student',
                                token: FFAppState().userInfo.token,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return HomeshimmerWidget();
                                }
                                final containerBannersResponse = snapshot.data!;

                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final banners = BannersCall.banners(
                                            containerBannersResponse.jsonBody,
                                          )?.toList() ??
                                          [];
                                      if (banners.isEmpty) {
                                        return Center(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            height: 200,
                                            child: EmptyWidgetWidget(
                                              datatype: 'Banners',
                                            ),
                                          ),
                                        );
                                      }

                                      return Container(
                                        width: double.infinity,
                                        height: 200,
                                        child: CarouselSlider.builder(
                                          itemCount: banners.length,
                                          itemBuilder:
                                              (context, bannersIndex, _) {
                                            final bannersItem =
                                                banners[bannersIndex];
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                getJsonField(
                                                  bannersItem,
                                                  r'''$.link''',
                                                ).toString(),
                                                width: 300,
                                                height: 200,
                                                fit: BoxFit.fill,
                                              ),
                                            );
                                          },
                                          carouselController:
                                              _model.carouselController ??=
                                                  CarouselSliderController(),
                                          options: CarouselOptions(
                                            initialPage: max(
                                                0, min(1, banners.length - 1)),
                                            viewportFraction: 1,
                                            disableCenter: true,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.25,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: true,
                                            autoPlayAnimationDuration:
                                                Duration(milliseconds: 800),
                                            autoPlayInterval: Duration(
                                                milliseconds: (800 + 4000)),
                                            autoPlayCurve: Curves.linear,
                                            pauseAutoPlayInFiniteScroll: true,
                                            onPageChanged: (index, _) => _model
                                                .carouselCurrentIndex = index,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, -1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '0q5965g5' /* Category */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF272727),
                                            fontSize: 16,
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
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'HOMEPAGELOGIN_PAGE_Text_64eyacr2_ON_TAP');
                                    logFirebaseEvent('Text_navigate_to');

                                    context.pushNamed(ServiceWidget.routeName);
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'cd2w6etw' /* View All */,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
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
                          Builder(
                            builder: (context) {
                              final userServices = FFAppState()
                                  .userInfo
                                  .allowedServices
                                  .where((e) => e != 'certificate')
                                  .toList();

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      MediaQuery.sizeOf(context).width < 500.0
                                          ? 2
                                          : 4,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1.2,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: userServices.length,
                                itemBuilder: (context, userServicesIndex) {
                                  final userServicesItem =
                                      userServices[userServicesIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'HOMEPAGELOGIN_Container_azr8mu5t_ON_TAP');
                                      if ((userServicesItem ==
                                              'monthly-test') ||
                                          (userServicesItem ==
                                              'summer-quiz-competition') ||
                                          (userServicesItem == 'neet') ||
                                          (userServicesItem == 'jee')) {
                                        logFirebaseEvent(
                                            'Container_navigate_to');

                                        context.pushNamed(
                                          MonthlyexamWidget.routeName,
                                          queryParameters: {
                                            'serviceid': serializeParam(
                                              functions.getServiceId(
                                                  userServicesItem,
                                                  GetServicesCall.services(
                                                    homepageloginGetServicesResponse
                                                        .jsonBody,
                                                  )!
                                                      .toList()),
                                              ParamType.String,
                                            ),
                                            'choosenservice': serializeParam(
                                              userServicesItem,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else if (userServicesItem ==
                                          'special-offer') {
                                        logFirebaseEvent(
                                            'Container_navigate_to');

                                        context.pushNamed(
                                            ProductsmenuWidget.routeName);
                                      } else if ((userServicesItem ==
                                              'annual-exam') ||
                                          (userServicesItem ==
                                              'online-study-material')) {
                                        logFirebaseEvent(
                                            'Container_navigate_to');

                                        context.pushNamed(
                                          AnnualExamWidget.routeName,
                                          queryParameters: {
                                            'serviceid': serializeParam(
                                              functions.getServiceId(
                                                  userServicesItem,
                                                  GetServicesCall.services(
                                                    homepageloginGetServicesResponse
                                                        .jsonBody,
                                                  )!
                                                      .toList()),
                                              ParamType.String,
                                            ),
                                            'choosenservice': serializeParam(
                                              userServicesItem,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        logFirebaseEvent(
                                            'Container_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: Text('Alert !'),
                                                content: Text(
                                                    'This service is under process. Please visit our website'),
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
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.5,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          functions.color(userServicesIndex),
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1, -1),
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Text(
                                                functions.removehyphen(
                                                    userServicesItem),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      fontSize: 16,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1, 1),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 10, 0),
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.network(
                                                    functions.filterserviceimageurl(
                                                        homepageloginGetServicesResponse
                                                            .jsonBody,
                                                        userServicesItem),
                                                    width: 300,
                                                    height: 200,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
