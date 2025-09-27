import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/shimmer/shimmer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'service_model.dart';
export 'service_model.dart';

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({super.key});

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  late ServiceModel _model;

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
    _model = createModel(context, () => ServiceModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'service'});
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
  leading: InkWell(
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () async {
      logFirebaseEvent('SERVICE_PAGE_Icon_nnmfg7ns_ON_TAP');
      logFirebaseEvent('Icon_navigate_back');
      context.safePop();
    },
    child: Icon(
      Icons.arrow_back_ios,
      color: FlutterFlowTheme.of(context).primaryText,
      size: 24,
    ),
  ),
  title: Text(
    FFLocalizations.of(context).getText(
      '13qtp0iv' /* Services */,
    ),
    style: FlutterFlowTheme.of(context).headlineMedium.override(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
  ),
  actions: const [],
  centerTitle: true,
  toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
  elevation: 2,
),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder<ApiCallResponse>(
              future: GetServicesCall.call(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return const ShimmerWidget();
                }
                final columnGetServicesResponse = snapshot.data!;
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
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
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                                            title: const Text('Alert !'),
                                            content: const Text(
                                                'This service is under process. Please visit our website'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Ok'),
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
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
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
                                            const AlignmentDirectional(1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: const BoxDecoration(),
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
