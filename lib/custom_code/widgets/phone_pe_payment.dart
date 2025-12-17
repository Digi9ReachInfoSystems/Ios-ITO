// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

import 'package:crypto/crypto.dart';

import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

class PhonePePayment extends StatefulWidget {
  const PhonePePayment({
    super.key,
    this.width,
    this.height,
    this.transactionid,
    this.userid,
    this.amount,
    this.mobilenumber,
  });

  final double? width;
  final double? height;
  final String? transactionid;
  final String? userid;
  final double? amount;
  final String? mobilenumber;

  @override
  State<PhonePePayment> createState() => _PhonePePaymentState();
}

class _PhonePePaymentState extends State<PhonePePayment> {
  String callback =
      "https://www.indiantalent.org/RESTapi/student/payment/Phonepe_callback";
  String checksum = "";
  bool enableLogs = true;
  Object? result;
  String environmentValue = 'SANDBOX';
  String appId = "";
  String merchantId = "PGTESTPAYUAT";
  String packageName = "com.phonepe.simulator";

  String saltKey = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
  String saltIndex = "1";
  String apiEndPoint = "/pg/v1/pay";

  @override
  void initState() {
    initPhonePeSdk();
    getChecksum().toString();
    super.initState();
  }

  void initPhonePeSdk() {
    PhonePePaymentSdk.init(environmentValue, appId, merchantId, enableLogs)
        .then((isInitialized) => {
              setState(() {
                result = 'PhonePe SDK Initialized - $isInitialized';
              })
            })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }

  getChecksum() {
    final reqdata = {
      "merchantId": merchantId,
      "merchantTransactionId": widget.transactionid,
      "merchantUserId": widget.userid,
      "amount": widget.amount,
      "callbackUrl": callback,
      "mobileNumber": widget.mobilenumber,
      "paymentInstrument": {"type": "PAY_PAGE"}
    };
    String base64body = base64.encode(utf8.encode(json.encode(reqdata)));
    checksum =
        '${sha256.convert(utf8.encode(base64body + apiEndPoint + saltKey))}###$saltIndex';
    return base64body;
  }

  void startTransaction() async {
    String body = await getChecksum();
    try {
      PhonePePaymentSdk.startTransaction(body, callback, checksum, packageName)
          .then((response) => {
                setState(() {
                  if (response != null) {
                    String status = response['status'].toString();
                    String error = response['error'].toString();
                    if (status == 'SUCCESS') {
                      result = "Flow Completed - Status: Success!";
                      context.pushReplacementNamed('paymentSuccess');
                    } else {
                      result =
                          "Flow Completed - Status: $status and Error: $error";
                      context.pushReplacementNamed('paymentfailure');
                    }
                  } else {
                    result = "Flow Incomplete";
                    context.pushReplacementNamed('paymentfailure');
                  }
                })
              })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    } catch (error) {
      handleError(error);
    }
  }

  void handleError(dynamic error) {
    result = error;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: startTransaction,
          child: const Text('Pay Now'),
        ),
        Text('$result'),
      ],
    );
  }
}
