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

import 'dart:convert' show utf8; // For utf8 encoding
import 'package:crypto/crypto.dart'; // For SHA256 hashing

Future<String> generateSha(
  String saltkey,
  String base,
) async {
  // generate sha256 for base64 + /pg/v1/pay + saltkey
  String data = base + "/pg/v1/pay" + saltkey;
  List<int> bytes = utf8.encode(data);
  Digest sha256Result = await sha256.convert(bytes);
  String hash = sha256Result.toString();
  return hash + "###1";
}
