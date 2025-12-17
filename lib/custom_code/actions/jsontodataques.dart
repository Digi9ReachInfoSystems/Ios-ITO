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

Future<List<GetQuestionsStruct>> jsontodataques(
    List<dynamic> jsonresponses) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  GetQuestionsStruct convertJsonToValueDataType(Map<String, dynamic> json) {
    return GetQuestionsStruct(
      id: json['id'] ?? "0",
      questionFormat: json['question_format'] ?? "0",
      question: json['question'] ?? "0",
      questionImage: json['question_image'] ?? "0",
      answer1: json['answer1'] ?? "0",
      answer2: json['answer2'] ?? "0",
      answer3: json['answer3'] ?? "0",
      answer4: json['answer4'] ?? "0",
      trueAnswer: json['true_answer'] ?? "0",
      questionType: json['question_type'] ?? "0",
    );
  }

  List<GetQuestionsStruct> listOfStruct = [];
  for (var item in jsonresponses) {
    listOfStruct.add(convertJsonToValueDataType(item));
  }
  return listOfStruct;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
