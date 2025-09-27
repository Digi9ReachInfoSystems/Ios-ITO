import 'dart:async';

import 'serialization_util.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

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

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.white,
          child: Center(
            child: Image.asset(
              'assets/images/ITO_Pencil_Logo_with_name.png',
              width: MediaQuery.sizeOf(context).width * 0.8,
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
      (data) async => const ParameterData();
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
        },
      ),
  'editProfile': ParameterData.none(),
  'powerPackages': ParameterData.none(),
  'subscription': ParameterData.none(),
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
  'powerProducts': (data) async => const ParameterData(
        allParams: {},
      ),
  'notifications': ParameterData.none(),
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
