import 'package:indian_talent_olympiad/components/upgrader_widget.dart';

import '../../components/notification_popup_widget.dart';
import '../../flutter_flow/firebase_remote_config_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/homeshimmer/homeshimmer_widget.dart';
import '/custom_code/actions/index.dart' as actions;

import '/custom_code/actions/upgrader.dart' as upgrader;
import 'package:badges/badges.dart' as badges;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'homepagelogin_model.dart';
export 'homepagelogin_model.dart';

class HomepageloginWidget extends StatefulWidget {
  const HomepageloginWidget({super.key});

  @override
  State<HomepageloginWidget> createState() => _HomepageloginWidgetState();
}

class _HomepageloginWidgetState extends State<HomepageloginWidget> {
  late HomepageloginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Map<String, String> slugToImageUrl = {
    "monthly-test":
        "https://www.indiantalent.org/uploads/services/95d486f1f60d26684c6c19c7e3a3d61d.png",
    "annual-exam":
        "https://www.indiantalent.org/uploads/services/86d9089c43599e0b9ded62649f912124.png",
    "olympiad-books":
        "https://www.indiantalent.org/uploads/services/239593063d8e934d797cca6ca468f0b2.png",
    "previous-year-question-paper":
        "https://www.indiantalent.org/uploads/services/7efaa627cf8676c075f9249ede927696.png",
    "special-offer":
        "https://www.indiantalent.org/uploads/services/0ee4b103be59cb0421c64cb5253f622d.png",
    "online-study-material":
        "https://www.indiantalent.org/uploads/services/37741fb7b2dfa487aee28106bec4732c.png",
    "ebooks":
        "https://www.indiantalent.org/uploads/services/77f22806f5b5d5d3f6f9ac15b51c758c.png",
    "neet":
        "https://www.indiantalent.org/uploads/services/a4804be3dd77065df89f736b542a1335.png",
    "jee":
        "https://www.indiantalent.org/uploads/services/61d78426160c97e65f250320be0ea499.png",
    "neet-ebooks":
        "https://www.indiantalent.org/uploads/services/4a88e4b8bba8425e63f481cb9e0524ab.png",
    "jee-ebooks":
        "https://www.indiantalent.org/uploads/services/cde8c65eb33565ee69241c452f2954b5.png",
    "summer-quiz-competition":
        "https://www.indiantalent.org/uploads/services/173fd154717c217979620ae461a54aec.png",
  };


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
      _model.apiResulti35 = await GetServicesCall.call();
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
                  onTap: () => _model.unfocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: Container(
                    height: 200,
                    child: NotificationPopupWidget(),
                  ),
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));

        logFirebaseEvent('Homepagelogin_custom_action');
      _model.appversion = await actions.upgrader();
      if (isAndroid) {
        if (getRemoteConfigString('androidversion') != _model.appversion) {
          logFirebaseEvent('Homepagelogin_bottom_sheet');
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            isDismissible: false,
            enableDrag: false,
            context: context,
            builder: (context) {
              return WebViewAware(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      child: const UpgraderWidget(),
                    ),
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        }
      } else {
        if (getRemoteConfigString('iosversion') != _model.appversion) {
          logFirebaseEvent('Homepagelogin_bottom_sheet');
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            isDismissible: false,
            enableDrag: false,
            context: context,
            builder: (context) {
              return WebViewAware(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      child: const UpgraderWidget(),
                    ),
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        }
      }

        logFirebaseEvent('Homepagelogin_custom_action');
        _model.servicer = await actions.jsontodata(
          GetServicesCall.serviceName(
            (_model.apiResulti35?.jsonBody ?? ''),
          )!
              .toList(),
        );
        logFirebaseEvent('Homepagelogin_update_app_state');
        setState(() {
          FFAppState().allservices =
              _model.servicer!.toList().cast<ServicesStruct>();
        });
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
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/WhatsApp_Image_2023-09-05_at_4.51_3_(2).png',
                width: 361.0,
                height: 200.0,
                fit: BoxFit.cover,
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
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            final badgeNotificationsResponse = snapshot.data!;
            return badges.Badge(
              badgeContent: Text(
                NotificationsCall.announcements(
                  badgeNotificationsResponse.jsonBody,
                )!
                    .length
                    .toString(),
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                    ),
              ),
              showBadge: true,
              shape: badges.BadgeShape.circle,
              badgeColor: FlutterFlowTheme.of(context).primary,
              elevation: 4,
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              position: badges.BadgePosition.topEnd(),
              animationType: badges.BadgeAnimationType.scale,
              toAnimate: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 10,
                  borderWidth: 1,
                  buttonSize: 50,
                  fillColor: FlutterFlowTheme.of(context).accent1,
                  icon: Icon(
                    Icons.notifications_active,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'HOMEPAGELOGIN_notifications_active_ICN_O');
                    logFirebaseEvent('IconButton_navigate_to');
                    context.pushNamed('notifications');
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
    buttonSize: 50,
    fillColor: FlutterFlowTheme.of(context).accent1,
    icon: Icon(
      Icons.person,
      color: FlutterFlowTheme.of(context).primaryText,
      size: 30,
    ),
    onPressed: () async {
      logFirebaseEvent('HOMEPAGELOGIN_PAGE_person_ICN_ON_TAP');
      logFirebaseEvent('IconButton_navigate_to');
      context.pushNamed('profile');
    },
  ),
)
              ],
            ),
          ],
          centerTitle: true,
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FutureBuilder<ApiCallResponse>(
              future: GetServicesCall.call(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: HomeshimmerWidget(),
                  );
                }
                final columnGetServicesResponse = snapshot.data!;
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '1mqf9cgg' /* Welcome back! */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 5.0, 0.0, 0.0),
                              child: Text(
                                FFAppState().userInfo.studentName,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 5.0, 0.0, 0.0),
                              child: Text(
                                'Class : ${FFAppState().userInfo.stdId}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                       fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: BannersCall.call(
                            stdId: FFAppState().userInfo.stdId,
                            displayFor: 'student',
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
                                  return Container(
                                    width: double.infinity,
                                    height: 200.0,
                                    child: CarouselSlider.builder(
                                      itemCount: banners.length,
                                      itemBuilder: (context, bannersIndex, _) {
                                        final bannersItem =
                                            banners[bannersIndex];
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            getJsonField(
                                              bannersItem,
                                              r'''$.link''',
                                            ).toString(),
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                      carouselController:
                                          _model.carouselController ??=
                                              CarouselSliderController(),
                                      options: CarouselOptions(
                                        initialPage: min(1, banners.length - 1),
                                        viewportFraction: 1.0,
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
                                        onPageChanged: (index, _) =>
                                            _model.carouselCurrentIndex = index,
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
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '0q5965g5' /* Category */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF272727),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
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
    logFirebaseEvent('HOMEPAGELOGIN_PAGE_Text_64eyacr2_ON_TAP');
    logFirebaseEvent('Text_navigate_to');
    context.pushNamed('service');
  },
  child: Text(
    "View All",
    style: FlutterFlowTheme.of(context).bodyMedium.override(
          fontFamily: 'Readex Pro',
          color: FlutterFlowTheme.of(context).primary,
          fontWeight: FontWeight.w500,
        ),
  ),
)
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
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.2,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: userServices.length,
                            itemBuilder: (context, userServicesIndex) {
                              final userServicesItem =
                                  userServices[userServicesIndex];
                                  final imageUrl = slugToImageUrl[
                                      userServicesItem] ??
                                  "https://www.indiantalent.org/uploads/services/95d486f1f60d26684c6c19c7e3a3d61d.png";
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'HOMEPAGELOGIN_Container_azr8mu5t_ON_TAP');
                                  if ((userServicesItem == 'monthly-test') ||
                                      (userServicesItem ==
                                          'summer-quiz-competition') ||
                                      (userServicesItem == 'neet') ||
                                      (userServicesItem == 'jee')) {
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(
                                      'monthlyexam',
                                      queryParameters: {
                                        'serviceid': serializeParam(
                                          functions.getServiceId(
                                              userServicesItem,
                                              GetServicesCall.services(
                                                columnGetServicesResponse
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
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed('productsmenu');
                                  } else if ((userServicesItem ==
                                          'annual-exam') ||
                                      (userServicesItem ==
                                          'online-study-material')) {
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(
                                      'annualExam',
                                     queryParameters: {
                                        'serviceid': serializeParam(
                                          functions.getServiceId(
                                              userServicesItem,
                                              GetServicesCall.services(
                                                columnGetServicesResponse
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
                                    logFirebaseEvent('Container_alert_dialog');
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
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.5,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      functions.color(userServicesIndex),
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            functions
                                                .removehyphen(userServicesItem),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                imageUrl,
                                                width: 300.0,
                                                height: 200.0,
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
