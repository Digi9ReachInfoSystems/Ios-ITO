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

Future<String> returnservieid(
  String serviceslugs,
  List<ServicesStruct> listofservice,
) async {
  // Loop through each service in the list
  for (var service in listofservice) {
    // Check if the service's identifier matches the provided string
    // Replace 'serviceSlug' with the field you're interested in
    if (service.serviceSlug == serviceslugs) {
      // Return a specific field from the ServicesStruct if a match is found
      // Replace 'serviceId' with the field you want to return
      return service.serviceId;
    }
  }

  // Return a default value or an indication of no match
  // You can change the return value based on your requirements
  return "No matching service found";
  // Add your function code here!
}
