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

Future<List<ServicesStruct>> jsontodata(List<dynamic> jsonresponses) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  ServicesStruct convertJsonToValueDataType(Map<String, dynamic> json) {
    return ServicesStruct(
      serviceId: json['service_id'] ?? "0",
      serviceName: json['service_name'] ?? "0",
      serviceSlug: json['service_slug'] ?? "0",
      serviceType: json['service_type'] ?? "0",
    );
  }

  List<ServicesStruct> listOfStruct = [];
  for (var item in jsonresponses) {
    listOfStruct.add(convertJsonToValueDataType(item));
  }
  return listOfStruct;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
