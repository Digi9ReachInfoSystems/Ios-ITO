import '/backend/api_requests/api_calls.dart';
import '/components/empty_widget_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/ordersshimmer/ordersshimmer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  static String routeName = 'notifications';
  static String routePath = '/notifications';

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'notifications'});
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
      future: NotificationsCall.call(
        stdId: FFAppState().userInfo.stdId,
        displayFor: 'student',
        token: FFAppState().userInfo.token,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                child: OrdersshimmerWidget(),
              ),
            ),
          );
        }

        final notificationsResponse = snapshot.data!;

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
                icon: const Icon(
                  Icons.chevron_left_rounded,
                  color: Color(0xFF272727),
                  size: 30,
                ),
                onPressed: () => context.pop(),
              ),
              title: Text(
                'Notifications',
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      font: GoogleFonts.outfit(fontWeight: FontWeight.w500),
                      fontSize: 18,
                    ),
              ),
              centerTitle: true,
              elevation: 0.5,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// REGULAR ANNOUNCEMENTS ONLY
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                      child: Text(
                        'Announcement',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.readexPro(
                                  fontWeight: FontWeight.w500),
                              fontSize: 15,
                            ),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final notifications =
                            NotificationsCall.announcements(
                                  notificationsResponse.jsonBody,
                                )?.toList() ??
                                [];

                        if (notifications.isEmpty) {
                          return const Center(
                            child: EmptyWidgetWidget(
                              datatype: 'Announcement',
                            ),
                          );
                        }

                        return Column(
                          children: List.generate(notifications.length, (index) {
                            final item = notifications[index];
                            return Card(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                  color:
                                                      FlutterFlowTheme.of(context)
                                                          .primary,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                            Expanded(
  child: Text(
    getJsonField(item, r'''$.title''').toString(),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: FlutterFlowTheme.of(context).labelMedium.override(
          fontWeight: FontWeight.w600, // bold
          fontSize: 14,
        ),
  ),
),

                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            functions.notificationtime(
                                                    functions.jsontoTime(
                                                        getJsonField(
                                              item,
                                              r'''$.created_on''',
                                            ).toString())) ??
                                                '0',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  color:
                                                      const Color(0xFFB6B6B6),
                                                ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            getJsonField(
                                              item,
                                              r'''$.content''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (getJsonField(item, r'''$.link''') !=
                                        null)
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        child: Image.network(
                                          getJsonField(item, r'''$.link''')
                                              .toString(),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }).divide(const SizedBox(height: 5)),
                        );
                      },
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
