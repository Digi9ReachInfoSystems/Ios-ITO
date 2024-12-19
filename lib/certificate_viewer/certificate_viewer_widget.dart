import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/special_offershimeer_copy/special_offershimeer_copy_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'certificate_viewer_model.dart';
export 'certificate_viewer_model.dart';

class CertificateViewerWidget extends StatefulWidget {
  const CertificateViewerWidget({
    super.key,
    required this.resultId,
  });

  final String? resultId;

  @override
  State<CertificateViewerWidget> createState() =>
      _CertificateViewerWidgetState();
}

class _CertificateViewerWidgetState extends State<CertificateViewerWidget> {
  late CertificateViewerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CertificateViewerModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'certificateViewer'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: ViewCertificatesCall.call(
        resultId: widget!.resultId,
        userId: FFAppState().userInfo.userId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SpecialOffershimeerCopyWidget(),
          );
        }
        final certificateViewerViewCertificatesResponse = snapshot.data!;

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
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Color(0xFF272727),
                  size: 30,
                ),
                onPressed: () async {
                  logFirebaseEvent('CERTIFICATE_VIEWER_arrow_back_rounded_IC');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  '4pyh4opt' /* Digital Certificate */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF272727),
                      fontSize: 18,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: Container(
                        width: 400,
                        height: 260,
                        decoration: BoxDecoration(),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    ViewCertificatesCall.certificatepath(
                                      certificateViewerViewCertificatesResponse
                                          .jsonBody,
                                    ),
                                    'https://www.indiantalent.org/assets/user_assets/custom/img/digital_certificate/English.png',
                                  ),
                                  width: MediaQuery.sizeOf(context).width,
                                  height: MediaQuery.sizeOf(context).height,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 12, 0, 0),
                                      child: Text(
                                        getJsonField(
                                          ViewCertificatesCall.certificatedara(
                                            certificateViewerViewCertificatesResponse
                                                .jsonBody,
                                          ),
                                          r'''$.student_name''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto Mono',
                                              fontSize: 8,
                                              letterSpacing: 0.0,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            30, 3, 0, 0),
                                        child: Text(
                                          getJsonField(
                                            ViewCertificatesCall
                                                .certificatedara(
                                              certificateViewerViewCertificatesResponse
                                                  .jsonBody,
                                            ),
                                            r'''$.parent_name''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto Mono',
                                                fontSize: 8,
                                                letterSpacing: 0.0,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 40, 0),
                                            child: Text(
                                              getJsonField(
                                                ViewCertificatesCall
                                                    .certificatedara(
                                                  certificateViewerViewCertificatesResponse
                                                      .jsonBody,
                                                ),
                                                r'''$.cert_std_id''',
                                              ).toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Roboto Mono',
                                                    fontSize: 8,
                                                    letterSpacing: 0.0,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Text(
                                            getJsonField(
                                              ViewCertificatesCall
                                                  .certificatedara(
                                                certificateViewerViewCertificatesResponse
                                                    .jsonBody,
                                              ),
                                              r'''$.parent_name''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto Mono',
                                                  fontSize: 8,
                                                  letterSpacing: 0.0,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 3),
                                        child: Text(
                                          getJsonField(
                                            ViewCertificatesCall
                                                .certificatedara(
                                              certificateViewerViewCertificatesResponse
                                                  .jsonBody,
                                            ),
                                            r'''$.school_name''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto Mono',
                                                fontSize: 8,
                                                letterSpacing: 0.0,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 53),
                                        child: Text(
                                          getJsonField(
                                            ViewCertificatesCall
                                                .certificatedara(
                                              certificateViewerViewCertificatesResponse
                                                  .jsonBody,
                                            ),
                                            r'''$.rank_print_msg''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto Mono',
                                                fontSize: 8,
                                                letterSpacing: 0.0,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFF9868FF),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'qthbiew9' /* Buy Certificates */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 10, 20, 10),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'vqfg20bg' /* ₹ 80 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFF9B51FF),
                                                  fontSize: 20,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          TextSpan(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'sb1pr095' /*  / per Subject */,
                                            ),
                                            style: TextStyle(),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final certificate = ViewCertificatesCall
                                                .cdertificateData(
                                              certificateViewerViewCertificatesResponse
                                                  .jsonBody,
                                            )?.toList() ??
                                            [];

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: certificate.length,
                                          itemBuilder:
                                              (context, certificateIndex) {
                                            final certificateItem =
                                                certificate[certificateIndex];
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                                .checkboxValueMap[
                                                            certificateItem] ??=
                                                        FFAppState()
                                                                .productids
                                                                .contains(
                                                                    getJsonField(
                                                                  certificateItem,
                                                                  r'''$.certificate_id''',
                                                                ).toString()) ==
                                                            true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                                  .checkboxValueMap[
                                                              certificateItem] =
                                                          newValue!);
                                                      if (newValue!) {
                                                        logFirebaseEvent(
                                                            'CERTIFICATE_VIEWER_Checkbox_5rnykjj8_ON_');
                                                        logFirebaseEvent(
                                                            'Checkbox_update_app_state');
                                                        FFAppState()
                                                            .addToTotalcart(
                                                                CartitemsStruct(
                                                          productId:
                                                              getJsonField(
                                                            certificateItem,
                                                            r'''$.certificate_id''',
                                                          ).toString(),
                                                          productname:
                                                              getJsonField(
                                                            certificateItem,
                                                            r'''$.productData.alias''',
                                                          ).toString(),
                                                          productamount:
                                                              getJsonField(
                                                            certificateItem,
                                                            r'''$.productData.amount''',
                                                          ).toString(),
                                                          producttypes:
                                                              'Certificate',
                                                        ));
                                                        FFAppState()
                                                            .addToProductids(
                                                                getJsonField(
                                                          certificateItem,
                                                          r'''$.certificate_id''',
                                                        ).toString());
                                                        FFAppState()
                                                                .deliveryfee =
                                                            functions.getdelivery(
                                                                FFAppState()
                                                                    .totalcart
                                                                    .toList());
                                                        FFAppState()
                                                            .update(() {});
                                                        logFirebaseEvent(
                                                            'Checkbox_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Product added to the cart',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            action:
                                                                SnackBarAction(
                                                              label:
                                                                  'Go to cart',
                                                              textColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              onPressed:
                                                                  () async {
                                                                context.pushNamed(
                                                                    'Cartvalue');
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        logFirebaseEvent(
                                                            'CERTIFICATE_VIEWER_Checkbox_5rnykjj8_ON_');
                                                        logFirebaseEvent(
                                                            'Checkbox_update_app_state');
                                                        FFAppState()
                                                            .removeFromTotalcart(
                                                                CartitemsStruct(
                                                          productamount:
                                                              getJsonField(
                                                            certificateItem,
                                                            r'''$.productData.amount''',
                                                          ).toString(),
                                                          productname:
                                                              getJsonField(
                                                            certificateItem,
                                                            r'''$.productData.alias''',
                                                          ).toString(),
                                                          productId:
                                                              getJsonField(
                                                            certificateItem,
                                                            r'''$.certificate_id''',
                                                          ).toString(),
                                                          producttypes:
                                                              'Certificate',
                                                        ));
                                                        FFAppState()
                                                            .removeFromProductids(
                                                                getJsonField(
                                                          certificateItem,
                                                          r'''$.certificate_id''',
                                                        ).toString());
                                                        FFAppState().cartvalue =
                                                            valueOrDefault<
                                                                double>(
                                                          functions
                                                              .finalcartamount(
                                                                  FFAppState()
                                                                      .totalcart
                                                                      .toList()),
                                                          0.0,
                                                        );
                                                        FFAppState()
                                                                .deliveryfee =
                                                            functions.getdelivery(
                                                                FFAppState()
                                                                    .totalcart
                                                                    .toList());
                                                        FFAppState()
                                                                .finalamount =
                                                            valueOrDefault<
                                                                double>(
                                                          functions.payableamount(
                                                              FFAppState()
                                                                  .cartvalue,
                                                              FFAppState()
                                                                  .deliveryfee),
                                                          0.0,
                                                        );
                                                        FFAppState()
                                                            .update(() {});
                                                      }
                                                    },
                                                    side: BorderSide(
                                                      width: 2,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                  ),
                                                ),
                                                Text(
                                                  getJsonField(
                                                    certificateItem,
                                                    r'''$.productData.alias''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 10),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '3u6lvx2m' /* Certificates  + Covering Lette... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Color(0xFF9868FF),
                                              fontSize: 10,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'CERTIFICATE_VIEWER_PROCEED_TO_CHECKOUT_B');
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('productsmenu');
                        },
                        text: FFLocalizations.of(context).getText(
                          '707ak4zc' /* Proceed to Checkout */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 60,
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
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
            ),
          ),
        );
      },
    );
  }
}
