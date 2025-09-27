// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ResultsStruct extends FFFirebaseStruct {
  ResultsStruct({
    String? attended,
    String? incorrect,
    String? correct,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _attended = attended,
        _incorrect = incorrect,
        _correct = correct,
        super(firestoreUtilData);

  // "attended" field.
  String? _attended;
  String get attended => _attended ?? '';
  set attended(String? val) => _attended = val;
  bool hasAttended() => _attended != null;

  // "incorrect" field.
  String? _incorrect;
  String get incorrect => _incorrect ?? '';
  set incorrect(String? val) => _incorrect = val;
  bool hasIncorrect() => _incorrect != null;

  // "correct" field.
  String? _correct;
  String get correct => _correct ?? '';
  set correct(String? val) => _correct = val;
  bool hasCorrect() => _correct != null;

  static ResultsStruct fromMap(Map<String, dynamic> data) => ResultsStruct(
        attended: data['attended'] as String?,
        incorrect: data['incorrect'] as String?,
        correct: data['correct'] as String?,
      );

  static ResultsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ResultsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'attended': _attended,
        'incorrect': _incorrect,
        'correct': _correct,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'attended': serializeParam(
          _attended,
          ParamType.String,
        ),
        'incorrect': serializeParam(
          _incorrect,
          ParamType.String,
        ),
        'correct': serializeParam(
          _correct,
          ParamType.String,
        ),
      }.withoutNulls;

  static ResultsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResultsStruct(
        attended: deserializeParam(
          data['attended'],
          ParamType.String,
          false,
        ),
        incorrect: deserializeParam(
          data['incorrect'],
          ParamType.String,
          false,
        ),
        correct: deserializeParam(
          data['correct'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ResultsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResultsStruct &&
        attended == other.attended &&
        incorrect == other.incorrect &&
        correct == other.correct;
  }

  @override
  int get hashCode => const ListEquality().hash([attended, incorrect, correct]);
}

ResultsStruct createResultsStruct({
  String? attended,
  String? incorrect,
  String? correct,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResultsStruct(
      attended: attended,
      incorrect: incorrect,
      correct: correct,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResultsStruct? updateResultsStruct(
  ResultsStruct? results, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    results
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResultsStructData(
  Map<String, dynamic> firestoreData,
  ResultsStruct? results,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (results == null) {
    return;
  }
  if (results.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && results.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final resultsData = getResultsFirestoreData(results, forFieldValue);
  final nestedData = resultsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = results.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResultsFirestoreData(
  ResultsStruct? results, [
  bool forFieldValue = false,
]) {
  if (results == null) {
    return {};
  }
  final firestoreData = mapToFirestore(results.toMap());

  // Add any Firestore field values
  results.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResultsListFirestoreData(
  List<ResultsStruct>? resultss,
) =>
    resultss?.map((e) => getResultsFirestoreData(e, true)).toList() ?? [];
