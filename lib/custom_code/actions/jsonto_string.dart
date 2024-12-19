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

import 'dart:convert';

Future<List<String>> jsontoString(List<dynamic> values) async {
  // Add your function code here!
  List<String> stringList = [];

  for (var jsonItem in values) {
    if (jsonItem is Map<String, dynamic>) {
      String jsonString = json.encode(jsonItem);
      stringList.add(jsonString);
    } else {
      // Handling non-Map items: You can decide how to handle items that are not Maps.
      // For now, we'll just ignore them.
      print('Item is not a JSON object: $jsonItem');
    }
  }

  return stringList;
}
