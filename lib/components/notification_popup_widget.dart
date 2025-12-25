import 'dart:async';

import 'package:flutter/material.dart';
import 'package:indian_talent_olympiad/app_state.dart';
import 'package:indian_talent_olympiad/backend/api_requests/api_calls.dart';
import 'package:indian_talent_olympiad/backend/api_requests/api_manager.dart';
import 'package:indian_talent_olympiad/flutter_flow/flutter_flow_theme.dart';
import 'package:indian_talent_olympiad/flutter_flow/flutter_flow_util.dart';
import 'package:indian_talent_olympiad/notifications/notifications_widget.dart';

class NotificationPopupWidget extends StatefulWidget {
  const NotificationPopupWidget({super.key});

  @override
  State<NotificationPopupWidget> createState() =>
      _NotificationPopupWidgetState();
}

class _NotificationPopupWidgetState extends State<NotificationPopupWidget> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll(int itemCount) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!_pageController.hasClients) return;

      _currentIndex = (_currentIndex + 1) % itemCount;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: NotificationsCall.call(
        stdId: FFAppState().userInfo.stdId,
        displayFor: 'student',
        token: FFAppState().userInfo.token,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        final priorityNotifications =
            NotificationsCall.highpriority(
              snapshot.data!.jsonBody,
            )?.toList() ??
            [];

        if (priorityNotifications.isEmpty) {
          return const SizedBox.shrink();
        }

        _startAutoScroll(priorityNotifications.length);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () {
              context.pushNamed(NotificationsWidget.routeName);
            },
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).secondary,
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: PageView.builder(
                controller: _pageController,
                itemCount: priorityNotifications.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = priorityNotifications[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.local_fire_department,
                          color: Colors.white,
                          size: 26,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            getJsonField(
                              item,
                              r'''$.content''',
                            ).toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 14,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
