import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_popup_model.dart';
export 'notification_popup_model.dart';

class NotificationPopupWidget extends StatefulWidget {
  const NotificationPopupWidget({super.key});

  @override
  State<NotificationPopupWidget> createState() =>
      _NotificationPopupWidgetState();
}

class _NotificationPopupWidgetState extends State<NotificationPopupWidget>
    with TickerProviderStateMixin {
  late NotificationPopupModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationPopupModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: NotificationsCall.call(
        stdId: FFAppState().userInfo.stdId,
        displayFor: 'student',
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40.0,
              height: 40.0,
              child: SpinKitChasingDots(
                color: FlutterFlowTheme.of(context).primary,
                size: 40.0,
              ),
            ),
          );
        }
        final columnNotificationsResponse = snapshot.data!;
        return Builder(
          builder: (context) {
            final noti = NotificationsCall.highpriority(
                  columnNotificationsResponse.jsonBody,
                )?.toList() ??
                [];
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(noti.length, (notiIndex) {
                final notiItem = noti[notiIndex];
                return Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 32.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2.0,
                          color: Color(0x520E151B),
                          offset: Offset(0.0, 1.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'j6rmyozi' /* New Notications */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyLarge,
                                ),
                              ),
                              InkWell(
  splashColor: Colors.transparent,
  focusColor: Colors.transparent,
  hoverColor: Colors.transparent,
  highlightColor: Colors.transparent,
  onTap: () async {
    logFirebaseEvent('NOTIFICATION_POPUP_Icon_25hwnyi0_ON_TAP');
    logFirebaseEvent('Icon_close_dialog,_drawer,_etc');
    Navigator.pop(context);
  },
  child: Icon(
    Icons.cancel_rounded,
    color: FlutterFlowTheme.of(context).secondaryText,
    size: 24,
  ),
)

                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 0.0, 12.0),
                          child: Text(
                            getJsonField(
                              notiItem,
                              r'''$.content''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ),
                        if (getJsonField(
                              notiItem,
                              r'''$.link''',
                            ) !=
                            null)
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                            child: Image.network(
                              getJsonField(
                                notiItem,
                                r'''$.link''',
                              ).toString(),
                              width: double.infinity,
                              height: 260.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                );
              }),
            );
          },
        );
      },
    );
  }
}
