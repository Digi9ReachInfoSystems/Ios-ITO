import 'package:flutter/material.dart';
import 'package:indian_talent_olympiad/app_state.dart';
import 'package:indian_talent_olympiad/backend/api_requests/api_calls.dart';
import 'package:indian_talent_olympiad/backend/api_requests/api_manager.dart';
import 'package:indian_talent_olympiad/flutter_flow/flutter_flow_util.dart';
import 'package:indian_talent_olympiad/notifications/notifications_widget.dart';
import 'package:marquee/marquee.dart';

class PriorityNotificationBanner extends StatelessWidget {
  const PriorityNotificationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: NotificationsCall.call(
        stdId: FFAppState().userInfo.stdId,
        displayFor: 'student',
        token: FFAppState().userInfo.token,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();

        final priorityNotifications =
            NotificationsCall.highpriority(snapshot.data!.jsonBody)?.toList() ??
                [];

        if (priorityNotifications.isEmpty ||
            FFAppState().hasShownNotificationPopup) {
          return const SizedBox.shrink();
        }

        final bannerText = priorityNotifications
            .map((e) => getJsonField(e, r'''$.content''').toString())
            .join("   •   ");

        return GestureDetector(
          onTap: () {
            context.pushNamed(NotificationsWidget.routeName);
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF1E3C72),
                  Color(0xFF2A5298),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
        
                /// ICON
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.campaign_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
        
                const SizedBox(width: 10),
        
                /// TEXT MARQUEE
                Expanded(
                  child: Marquee(
                    text: bannerText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    velocity: 35,
                    blankSpace: 20,
                    pauseAfterRound: const Duration(seconds: 1),
                    startPadding: 10,
                  ),
                ),
        
                /// CTA
                
        
                const SizedBox(width: 8),
        
                /// DISMISS
                GestureDetector(
                  onTap: () {
                    FFAppState().update(() {
                      FFAppState().hasShownNotificationPopup = true;
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.close,
                      color: Colors.white70,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}