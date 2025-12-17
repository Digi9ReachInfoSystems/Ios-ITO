// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:crypto/crypto.dart';
import 'dart:convert' show utf8;

Future<String> checkstatus(
  String transactionID,
  String merchantId,
) async {
  // Add your function code here!
  String data = "/v3/transaction/$merchantId/$transactionID/status" +
      "ac7f1970-3484-422a-a285-49a6e63e029d";
  List<int> bytes = utf8.encode(data);
  Digest digest = await sha256.convert(bytes);
  String hash = digest.toString();
  return hash + "###1";
}
