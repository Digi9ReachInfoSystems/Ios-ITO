// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GetQuestionsStruct extends FFFirebaseStruct {
  GetQuestionsStruct({
    String? id,
    String? questionFormat,
    String? question,
    String? questionImage,
    String? answer1,
    String? answer2,
    String? answer3,
    String? answer4,
    String? trueAnswer,
    String? questionType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _questionFormat = questionFormat,
        _question = question,
        _questionImage = questionImage,
        _answer1 = answer1,
        _answer2 = answer2,
        _answer3 = answer3,
        _answer4 = answer4,
        _trueAnswer = trueAnswer,
        _questionType = questionType,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "questionFormat" field.
  String? _questionFormat;
  String get questionFormat => _questionFormat ?? '';
  set questionFormat(String? val) => _questionFormat = val;

  bool hasQuestionFormat() => _questionFormat != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "questionImage" field.
  String? _questionImage;
  String get questionImage => _questionImage ?? '';
  set questionImage(String? val) => _questionImage = val;

  bool hasQuestionImage() => _questionImage != null;

  // "answer1" field.
  String? _answer1;
  String get answer1 => _answer1 ?? '';
  set answer1(String? val) => _answer1 = val;

  bool hasAnswer1() => _answer1 != null;

  // "answer2" field.
  String? _answer2;
  String get answer2 => _answer2 ?? '';
  set answer2(String? val) => _answer2 = val;

  bool hasAnswer2() => _answer2 != null;

  // "answer3" field.
  String? _answer3;
  String get answer3 => _answer3 ?? '';
  set answer3(String? val) => _answer3 = val;

  bool hasAnswer3() => _answer3 != null;

  // "answer4" field.
  String? _answer4;
  String get answer4 => _answer4 ?? '';
  set answer4(String? val) => _answer4 = val;

  bool hasAnswer4() => _answer4 != null;

  // "trueAnswer" field.
  String? _trueAnswer;
  String get trueAnswer => _trueAnswer ?? '';
  set trueAnswer(String? val) => _trueAnswer = val;

  bool hasTrueAnswer() => _trueAnswer != null;

  // "questionType" field.
  String? _questionType;
  String get questionType => _questionType ?? '';
  set questionType(String? val) => _questionType = val;

  bool hasQuestionType() => _questionType != null;

  static GetQuestionsStruct fromMap(Map<String, dynamic> data) =>
      GetQuestionsStruct(
        id: data['id'] as String?,
        questionFormat: data['questionFormat'] as String?,
        question: data['question'] as String?,
        questionImage: data['questionImage'] as String?,
        answer1: data['answer1'] as String?,
        answer2: data['answer2'] as String?,
        answer3: data['answer3'] as String?,
        answer4: data['answer4'] as String?,
        trueAnswer: data['trueAnswer'] as String?,
        questionType: data['questionType'] as String?,
      );

  static GetQuestionsStruct? maybeFromMap(dynamic data) => data is Map
      ? GetQuestionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'questionFormat': _questionFormat,
        'question': _question,
        'questionImage': _questionImage,
        'answer1': _answer1,
        'answer2': _answer2,
        'answer3': _answer3,
        'answer4': _answer4,
        'trueAnswer': _trueAnswer,
        'questionType': _questionType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'questionFormat': serializeParam(
          _questionFormat,
          ParamType.String,
        ),
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'questionImage': serializeParam(
          _questionImage,
          ParamType.String,
        ),
        'answer1': serializeParam(
          _answer1,
          ParamType.String,
        ),
        'answer2': serializeParam(
          _answer2,
          ParamType.String,
        ),
        'answer3': serializeParam(
          _answer3,
          ParamType.String,
        ),
        'answer4': serializeParam(
          _answer4,
          ParamType.String,
        ),
        'trueAnswer': serializeParam(
          _trueAnswer,
          ParamType.String,
        ),
        'questionType': serializeParam(
          _questionType,
          ParamType.String,
        ),
      }.withoutNulls;

  static GetQuestionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      GetQuestionsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        questionFormat: deserializeParam(
          data['questionFormat'],
          ParamType.String,
          false,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        questionImage: deserializeParam(
          data['questionImage'],
          ParamType.String,
          false,
        ),
        answer1: deserializeParam(
          data['answer1'],
          ParamType.String,
          false,
        ),
        answer2: deserializeParam(
          data['answer2'],
          ParamType.String,
          false,
        ),
        answer3: deserializeParam(
          data['answer3'],
          ParamType.String,
          false,
        ),
        answer4: deserializeParam(
          data['answer4'],
          ParamType.String,
          false,
        ),
        trueAnswer: deserializeParam(
          data['trueAnswer'],
          ParamType.String,
          false,
        ),
        questionType: deserializeParam(
          data['questionType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GetQuestionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GetQuestionsStruct &&
        id == other.id &&
        questionFormat == other.questionFormat &&
        question == other.question &&
        questionImage == other.questionImage &&
        answer1 == other.answer1 &&
        answer2 == other.answer2 &&
        answer3 == other.answer3 &&
        answer4 == other.answer4 &&
        trueAnswer == other.trueAnswer &&
        questionType == other.questionType;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        questionFormat,
        question,
        questionImage,
        answer1,
        answer2,
        answer3,
        answer4,
        trueAnswer,
        questionType
      ]);
}

GetQuestionsStruct createGetQuestionsStruct({
  String? id,
  String? questionFormat,
  String? question,
  String? questionImage,
  String? answer1,
  String? answer2,
  String? answer3,
  String? answer4,
  String? trueAnswer,
  String? questionType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GetQuestionsStruct(
      id: id,
      questionFormat: questionFormat,
      question: question,
      questionImage: questionImage,
      answer1: answer1,
      answer2: answer2,
      answer3: answer3,
      answer4: answer4,
      trueAnswer: trueAnswer,
      questionType: questionType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GetQuestionsStruct? updateGetQuestionsStruct(
  GetQuestionsStruct? getQuestions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    getQuestions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGetQuestionsStructData(
  Map<String, dynamic> firestoreData,
  GetQuestionsStruct? getQuestions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (getQuestions == null) {
    return;
  }
  if (getQuestions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && getQuestions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final getQuestionsData =
      getGetQuestionsFirestoreData(getQuestions, forFieldValue);
  final nestedData =
      getQuestionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = getQuestions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGetQuestionsFirestoreData(
  GetQuestionsStruct? getQuestions, [
  bool forFieldValue = false,
]) {
  if (getQuestions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(getQuestions.toMap());

  // Add any Firestore field values
  getQuestions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGetQuestionsListFirestoreData(
  List<GetQuestionsStruct>? getQuestionss,
) =>
    getQuestionss?.map((e) => getGetQuestionsFirestoreData(e, true)).toList() ??
    [];
