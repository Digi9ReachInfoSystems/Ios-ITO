// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswersStruct extends FFFirebaseStruct {
  AnswersStruct({
    String? question,
    String? answer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _question = question,
        _answer = answer,
        super(firestoreUtilData);

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;
  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;
  bool hasAnswer() => _answer != null;

  static AnswersStruct fromMap(Map<String, dynamic> data) => AnswersStruct(
        question: data['question'] as String?,
        answer: data['answer'] as String?,
      );

  static AnswersStruct? maybeFromMap(dynamic data) =>
      data is Map ? AnswersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'answer': _answer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
      }.withoutNulls;

  static AnswersStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnswersStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AnswersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AnswersStruct &&
        question == other.question &&
        answer == other.answer;
  }

  @override
  int get hashCode => const ListEquality().hash([question, answer]);
}

AnswersStruct createAnswersStruct({
  String? question,
  String? answer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AnswersStruct(
      question: question,
      answer: answer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AnswersStruct? updateAnswersStruct(
  AnswersStruct? answers, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    answers
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAnswersStructData(
  Map<String, dynamic> firestoreData,
  AnswersStruct? answers,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (answers == null) {
    return;
  }
  if (answers.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && answers.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final answersData = getAnswersFirestoreData(answers, forFieldValue);
  final nestedData = answersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = answers.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAnswersFirestoreData(
  AnswersStruct? answers, [
  bool forFieldValue = false,
]) {
  if (answers == null) {
    return {};
  }
  final firestoreData = mapToFirestore(answers.toMap());

  // Add any Firestore field values
  answers.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAnswersListFirestoreData(
  List<AnswersStruct>? answerss,
) =>
    answerss?.map((e) => getAnswersFirestoreData(e, true)).toList() ?? [];
