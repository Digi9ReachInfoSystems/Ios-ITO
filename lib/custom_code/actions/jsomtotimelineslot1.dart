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

Future<List<TimelinedocumentStruct>> jsomtotimelineslot1(
    List<dynamic> jsonresponses) async {
  List<TimelinedocumentStruct> listOfStruct = [];

  for (var item in jsonresponses) {
    item.forEach((key, value) {
      listOfStruct.add(TimelinedocumentStruct(
        date: DateTime.parse(value), // Assigning DateTime object directly
        subject: key, // Assigning subject directly
      ));
    });
  }

  return listOfStruct;
  // Add your function code here!
}
