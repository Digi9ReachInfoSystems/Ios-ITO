import 'dart:async';

import 'serialization_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/indian-talent-olympiad-new-logo.png',
              width: MediaQuery.sizeOf(context).width * 0.6,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'schedule': ParameterData.none(),
  'service': ParameterData.none(),
  'profile': ParameterData.none(),
  'onBoarding': ParameterData.none(),
  'walkThrough': ParameterData.none(),
  'forgetPassword': ParameterData.none(),
  'otpVerify': ParameterData.none(),
  'resetPassword': (data) async => ParameterData(
        allParams: {
          'phonenumber': getParameter<String>(data, 'phonenumber'),
        },
      ),
  'paymentSuccess': ParameterData.none(),
  'monthlyexam': (data) async => ParameterData(
        allParams: {
          'serviceid': getParameter<String>(data, 'serviceid'),
          'choosenservice': getParameter<String>(data, 'choosenservice'),
        },
      ),
  'annualExamStart': (data) async => ParameterData(
        allParams: {
          'subjectid': getParameter<String>(data, 'subjectid'),
          'serviceid': getParameter<String>(data, 'serviceid'),
          'choosensubject': getParameter<String>(data, 'choosensubject'),
          'alias': getParameter<String>(data, 'alias'),
          'round': getParameter<String>(data, 'round'),
        },
      ),
  'editProfile': ParameterData.none(),
  'powerPackages': ParameterData.none(),
  'subscription': (data) async => ParameterData(
        allParams: {
          'serviceName': getParameter<String>(data, 'serviceName'),
        },
      ),
  'myOrders': ParameterData.none(),
  'testpage': (data) async => ParameterData(
        allParams: {
          'testId': getParameter<String>(data, 'testId'),
          'timer': getParameter<String>(data, 'timer'),
        },
      ),
  'Auth1Login': ParameterData.none(),
  'Auth1register': ParameterData.none(),
  'Homepagelogin': ParameterData.none(),
  'aftersubmit': (data) async => ParameterData(
        allParams: {
          'testid': getParameter<String>(data, 'testid'),
          'totaltime': getParameter<String>(data, 'totaltime'),
        },
      ),
  'helpPage': ParameterData.none(),
  'termsAndconditions': ParameterData.none(),
  'privacyPolicy': ParameterData.none(),
  'Deletionofrequest': ParameterData.none(),
  'notices': ParameterData.none(),
  'demo': ParameterData.none(),
  'webview_payment': (data) async => ParameterData(
        allParams: {
          'payurl': getParameter<String>(data, 'payurl'),
        },
      ),
  'Cartvalue': ParameterData.none(),
  'finalpaybutton': (data) async => ParameterData(
        allParams: {
          'orderid': getParameter<String>(data, 'orderid'),
          'finalamount': getParameter<double>(data, 'finalamount'),
        },
      ),
  'paymentfailure': ParameterData.none(),
  'productsmenu': ParameterData.none(),
  'refundpolicy': ParameterData.none(),
  'roundregistration': ParameterData.none(),
  'results': ParameterData.none(),
  'CartvalueCopy': ParameterData.none(),
  'productWebview': (data) async => ParameterData(
        allParams: {
          'payurl': getParameter<String>(data, 'payurl'),
        },
      ),
  'productFailure': ParameterData.none(),
  'summerquiz': ParameterData.none(),
  'annualExam': (data) async => ParameterData(
        allParams: {
          'serviceid': getParameter<String>(data, 'serviceid'),
          'choosenservice': getParameter<String>(data, 'choosenservice'),
        },
      ),
  'quizdetails': ParameterData.none(),
  'round2result': ParameterData.none(),
  'Coupons': ParameterData.none(),
  'certificateViewer': (data) async => ParameterData(
        allParams: {
          'resultId': getParameter<String>(data, 'resultId'),
        },
      ),
  'powerProducts': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'notifications': ParameterData.none(),
  'testpagetestingdummy': (data) async => ParameterData(
        allParams: {
          'testId': getParameter<String>(data, 'testId'),
          'timer': getParameter<String>(data, 'timer'),
        },
      ),
  'powercart': ParameterData.none(),
  'powerwebview': (data) async => ParameterData(
        allParams: {
          'payurl': getParameter<String>(data, 'payurl'),
        },
      ),
  'powerfailure': (data) async => ParameterData(
        allParams: {
          'payurl': getParameter<String>(data, 'payurl'),
        },
      ),
  'testDetails': (data) async => ParameterData(
        allParams: {
          'testId': getParameter<String>(data, 'testId'),
          'time': getParameter<String>(data, 'time'),
          'alias': getParameter<String>(data, 'alias'),
          'testName': getParameter<String>(data, 'testName'),
          'totalTime': getParameter<String>(data, 'totalTime'),
          'category': getParameter<String>(data, 'category'),
          'subjectName': getParameter<String>(data, 'subjectName'),
          'stdid': getParameter<String>(data, 'stdid'),
          'totalquestion': getParameter<String>(data, 'totalquestion'),
          'totalmarks': getParameter<String>(data, 'totalmarks'),
        },
      ),
  'outOfversion': ParameterData.none(),
  'monthlyexamCopy': (data) async => ParameterData(
        allParams: {
          'serviceid': getParameter<String>(data, 'serviceid'),
          'choosenservice': getParameter<String>(data, 'choosenservice'),
        },
      ),
  'CartvalueCopyCopy': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
