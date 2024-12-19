// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionsStruct extends FFFirebaseStruct {
  QuestionsStruct({
    List<String>? questionName,
    List<String>? answer1,
    List<String>? answer2,
    List<String>? answer3,
    List<String>? answer4,
    List<String>? questionId,
    List<String>? trueAnswer,
    List<String>? answerimage1,
    List<String>? answerimage3,
    List<String>? answerimage2,
    List<String>? answerimage4,
    List<String>? questionimage,
    List<String>? questionName2,
    List<String>? questionImage2,
    List<String>? sectionBanswer1,
    List<String>? sectionBanswer2,
    List<String>? sectionBanswer3,
    List<String>? sectionBanswer4,
    List<String>? sectionBanswerimage1,
    List<String>? sectionBanswerimage2,
    List<String>? sectionBanswerimage3,
    List<String>? sectionBanswerimage4,
    List<String>? question2Id,
    // Section 3 fields
    List<String>? question3Id,
    List<String>? questions3,
    List<String>? question3image,
    List<String>? section3Answer1,
    List<String>? section3answer2,
    List<String>? section3answer3,
    List<String>? section3answer4,
    List<String>? section3answerimage1,
    List<String>? section3answerimage2,
    List<String>? section3answerimage3,
    List<String>? section3answerimage4,
    String? format1,
    String? format2,
    String? format3,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _questionName = questionName,
        _answer1 = answer1,
        _answer2 = answer2,
        _answer3 = answer3,
        _answer4 = answer4,
        _questionId = questionId,
        _trueAnswer = trueAnswer,
        _answerimage1 = answerimage1,
        _answerimage3 = answerimage3,
        _answerimage2 = answerimage2,
        _answerimage4 = answerimage4,
        _questionimage = questionimage,
        _questionName2 = questionName2,
        _questionImage2 = questionImage2,
        _sectionBanswer1 = sectionBanswer1,
        _sectionBanswer2 = sectionBanswer2,
        _sectionBanswer3 = sectionBanswer3,
        _sectionBanswer4 = sectionBanswer4,
        _sectionBanswerimage1 = sectionBanswerimage1,
        _sectionBanswerimage2 = sectionBanswerimage2,
        _sectionBanswerimage3 = sectionBanswerimage3,
        _sectionBanswerimage4 = sectionBanswerimage4,
        _question2Id = question2Id,
        // Initialize section 3 fields
        _question3Id = question3Id,
        _questions3 = questions3,
        _question3image = question3image,
        _section3Answer1 = section3Answer1,
        _section3answer2 = section3answer2,
        _section3answer3 = section3answer3,
        _section3answer4 = section3answer4,
        _section3answerimage1 = section3answerimage1,
        _section3answerimage2 = section3answerimage2,
        _section3answerimage3 = section3answerimage3,
        _section3answerimage4 = section3answerimage4,
        _format1 = format1,
        _format2 = format2,
        _format3 = format3,
        super(firestoreUtilData);

  // "questionName" field.
  List<String>? _questionName;
  List<String> get questionName => _questionName ?? const [];
  set questionName(List<String>? val) => _questionName = val;
  void updateQuestionName(Function(List<String>) updateFn) =>
      updateFn(_questionName ??= []);
  bool hasQuestionName() => _questionName != null;

  // "answer1" field.
  List<String>? _answer1;
  List<String> get answer1 => _answer1 ?? const [];
  set answer1(List<String>? val) => _answer1 = val;
  void updateAnswer1(Function(List<String>) updateFn) =>
      updateFn(_answer1 ??= []);
  bool hasAnswer1() => _answer1 != null;

  // "answer2" field.
  List<String>? _answer2;
  List<String> get answer2 => _answer2 ?? const [];
  set answer2(List<String>? val) => _answer2 = val;
  void updateAnswer2(Function(List<String>) updateFn) =>
      updateFn(_answer2 ??= []);
  bool hasAnswer2() => _answer2 != null;

  // "answer3" field.
  List<String>? _answer3;
  List<String> get answer3 => _answer3 ?? const [];
  set answer3(List<String>? val) => _answer3 = val;
  void updateAnswer3(Function(List<String>) updateFn) =>
      updateFn(_answer3 ??= []);
  bool hasAnswer3() => _answer3 != null;

  // "answer4" field.
  List<String>? _answer4;
  List<String> get answer4 => _answer4 ?? const [];
  set answer4(List<String>? val) => _answer4 = val;
  void updateAnswer4(Function(List<String>) updateFn) =>
      updateFn(_answer4 ??= []);
  bool hasAnswer4() => _answer4 != null;

  // "question_id" field.
  List<String>? _questionId;
  List<String> get questionId => _questionId ?? const [];
  set questionId(List<String>? val) => _questionId = val;
  void updateQuestionId(Function(List<String>) updateFn) =>
      updateFn(_questionId ??= []);
  bool hasQuestionId() => _questionId != null;

  // "trueAnswer" field.
  List<String>? _trueAnswer;
  List<String> get trueAnswer => _trueAnswer ?? const [];
  set trueAnswer(List<String>? val) => _trueAnswer = val;
  void updateTrueAnswer(Function(List<String>) updateFn) =>
      updateFn(_trueAnswer ??= []);
  bool hasTrueAnswer() => _trueAnswer != null;

  // "answerimage1" field.
  List<String>? _answerimage1;
  List<String> get answerimage1 => _answerimage1 ?? const [];
  set answerimage1(List<String>? val) => _answerimage1 = val;
  void updateAnswerimage1(Function(List<String>) updateFn) =>
      updateFn(_answerimage1 ??= []);
  bool hasAnswerimage1() => _answerimage1 != null;

  // "answerimage3" field.
  List<String>? _answerimage3;
  List<String> get answerimage3 => _answerimage3 ?? const [];
  set answerimage3(List<String>? val) => _answerimage3 = val;
  void updateAnswerimage3(Function(List<String>) updateFn) =>
      updateFn(_answerimage3 ??= []);
  bool hasAnswerimage3() => _answerimage3 != null;

  // "answerimage2" field.
  List<String>? _answerimage2;
  List<String> get answerimage2 => _answerimage2 ?? const [];
  set answerimage2(List<String>? val) => _answerimage2 = val;
  void updateAnswerimage2(Function(List<String>) updateFn) =>
      updateFn(_answerimage2 ??= []);
  bool hasAnswerimage2() => _answerimage2 != null;

  // "answerimage4" field.
  List<String>? _answerimage4;
  List<String> get answerimage4 => _answerimage4 ?? const [];
  set answerimage4(List<String>? val) => _answerimage4 = val;
  void updateAnswerimage4(Function(List<String>) updateFn) =>
      updateFn(_answerimage4 ??= []);
  bool hasAnswerimage4() => _answerimage4 != null;

  // "questionimage" field.
  List<String>? _questionimage;
  List<String> get questionimage => _questionimage ?? const [];
  set questionimage(List<String>? val) => _questionimage = val;
  void updateQuestionimage(Function(List<String>) updateFn) =>
      updateFn(_questionimage ??= []);
  bool hasQuestionimage() => _questionimage != null;

  // "questionName2" field.
  List<String>? _questionName2;
  List<String> get questionName2 => _questionName2 ?? const [];
  set questionName2(List<String>? val) => _questionName2 = val;
  void updateQuestionName2(Function(List<String>) updateFn) =>
      updateFn(_questionName2 ??= []);
  bool hasQuestionName2() => _questionName2 != null;

  // "questionImage2" field.
  List<String>? _questionImage2;
  List<String> get questionImage2 => _questionImage2 ?? const [];
  set questionImage2(List<String>? val) => _questionImage2 = val;
  void updateQuestionImage2(Function(List<String>) updateFn) =>
      updateFn(_questionImage2 ??= []);
  bool hasQuestionImage2() => _questionImage2 != null;

  // "sectionBanswer1" field.
  List<String>? _sectionBanswer1;
  List<String> get sectionBanswer1 => _sectionBanswer1 ?? const [];
  set sectionBanswer1(List<String>? val) => _sectionBanswer1 = val;
  void updateSectionBanswer1(Function(List<String>) updateFn) =>
      updateFn(_sectionBanswer1 ??= []);
  bool hasSectionBanswer1() => _sectionBanswer1 != null;

  // "sectionBanswer2" field.
  List<String>? _sectionBanswer2;
  List<String> get sectionBanswer2 => _sectionBanswer2 ?? const [];
  set sectionBanswer2(List<String>? val) => _sectionBanswer2 = val;
  void updateSectionBanswer2(Function(List<String>) updateFn) =>
      updateFn(_sectionBanswer2 ??= []);
  bool hasSectionBanswer2() => _sectionBanswer2 != null;

  // "sectionBanswer3" field.
  List<String>? _sectionBanswer3;
  List<String> get sectionBanswer3 => _sectionBanswer3 ?? const [];
  set sectionBanswer3(List<String>? val) => _sectionBanswer3 = val;
  void updateSectionBanswer3(Function(List<String>) updateFn) =>
      updateFn(_sectionBanswer3 ??= []);
  bool hasSectionBanswer3() => _sectionBanswer3 != null;

  // "sectionBanswer4" field.
  List<String>? _sectionBanswer4;
  List<String> get sectionBanswer4 => _sectionBanswer4 ?? const [];
  set sectionBanswer4(List<String>? val) => _sectionBanswer4 = val;
  void updateSectionBanswer4(Function(List<String>) updateFn) =>
      updateFn(_sectionBanswer4 ??= []);
  bool hasSectionBanswer4() => _sectionBanswer4 != null;

  // "sectionBanswerimage1" field.
  List<String>? _sectionBanswerimage1;
  List<String> get sectionBanswerimage1 => _sectionBanswerimage1 ?? const [];
  set sectionBanswerimage1(List<String>? val) => _sectionBanswerimage1 = val;
  void updateSectionBanswerimage1(Function(List<String>) updateFn) =>
      updateFn(_sectionBanswerimage1 ??= []);
  bool hasSectionBanswerimage1() => _sectionBanswerimage1 != null;

  // "sectionBanswerimage2" field.
  List<String>? _sectionBanswerimage2;
  List<String> get sectionBanswerimage2 => _sectionBanswerimage2 ?? const [];
  set sectionBanswerimage2(List<String>? val) => _sectionBanswerimage2 = val;
  void updateSectionBanswerimage2(Function(List<String>) updateFn) =>
      updateFn(_sectionBanswerimage2 ??= []);
  bool hasSectionBanswerimage2() => _sectionBanswerimage2 != null;

  // "sectionBanswerimage3" field.
  List<String>? _sectionBanswerimage3;
  List<String> get sectionBanswerimage3 => _sectionBanswerimage3 ?? const [];
  set sectionBanswerimage3(List<String>? val) => _sectionBanswerimage3 = val;
  void updateSectionBanswerimage3(Function(List<String>) updateFn) =>
      updateFn(_sectionBanswerimage3 ??= []);
  bool hasSectionBanswerimage3() => _sectionBanswerimage3 != null;

  // "sectionBanswerimage4" field.
  List<String>? _sectionBanswerimage4;
  List<String> get sectionBanswerimage4 => _sectionBanswerimage4 ?? const [];
  set sectionBanswerimage4(List<String>? val) => _sectionBanswerimage4 = val;
  void updateSectionBanswerimage4(Function(List<String>) updateFn) =>
      updateFn(_sectionBanswerimage4 ??= []);
  bool hasSectionBanswerimage4() => _sectionBanswerimage4 != null;

  // "question2Id" field.
  List<String>? _question2Id;
  List<String> get question2Id => _question2Id ?? const [];
  set question2Id(List<String>? val) => _question2Id = val;
  void updateQuestion2Id(Function(List<String>) updateFn) =>
      updateFn(_question2Id ??= []);
  bool hasQuestion2Id() => _question2Id != null;

  // Section 3 fields

  // "question3Id" field.
  List<String>? _question3Id;
  List<String> get question3Id => _question3Id ?? const [];
  set question3Id(List<String>? val) => _question3Id = val;
  void updateQuestion3Id(Function(List<String>) updateFn) =>
      updateFn(_question3Id ??= []);
  bool hasQuestion3Id() => _question3Id != null;

  // "questions3" field.
  List<String>? _questions3;
  List<String> get questions3 => _questions3 ?? const [];
  set questions3(List<String>? val) => _questions3 = val;
  void updateQuestions3(Function(List<String>) updateFn) =>
      updateFn(_questions3 ??= []);
  bool hasQuestions3() => _questions3 != null;

  // "question3image" field.
  List<String>? _question3image;
  List<String> get question3image => _question3image ?? const [];
  set question3image(List<String>? val) => _question3image = val;
  void updateQuestion3image(Function(List<String>) updateFn) =>
      updateFn(_question3image ??= []);
  bool hasQuestion3image() => _question3image != null;

  // "section3Answer1" field.
  List<String>? _section3Answer1;
  List<String> get section3Answer1 => _section3Answer1 ?? const [];
  set section3Answer1(List<String>? val) => _section3Answer1 = val;
  void updateSection3Answer1(Function(List<String>) updateFn) =>
      updateFn(_section3Answer1 ??= []);
  bool hasSection3Answer1() => _section3Answer1 != null;

  // "section3answer2" field.
  List<String>? _section3answer2;
  List<String> get section3answer2 => _section3answer2 ?? const [];
  set section3answer2(List<String>? val) => _section3answer2 = val;
  void updateSection3answer2(Function(List<String>) updateFn) =>
      updateFn(_section3answer2 ??= []);
  bool hasSection3answer2() => _section3answer2 != null;

  // "section3answer3" field.
  List<String>? _section3answer3;
  List<String> get section3answer3 => _section3answer3 ?? const [];
  set section3answer3(List<String>? val) => _section3answer3 = val;
  void updateSection3answer3(Function(List<String>) updateFn) =>
      updateFn(_section3answer3 ??= []);
  bool hasSection3answer3() => _section3answer3 != null;

  // "section3answer4" field.
  List<String>? _section3answer4;
  List<String> get section3answer4 => _section3answer4 ?? const [];
  set section3answer4(List<String>? val) => _section3answer4 = val;
  void updateSection3answer4(Function(List<String>) updateFn) =>
      updateFn(_section3answer4 ??= []);
  bool hasSection3answer4() => _section3answer4 != null;

  // "section3answerimage1" field.
  List<String>? _section3answerimage1;
  List<String> get section3answerimage1 => _section3answerimage1 ?? const [];
  set section3answerimage1(List<String>? val) => _section3answerimage1 = val;
  void updateSection3answerimage1(Function(List<String>) updateFn) =>
      updateFn(_section3answerimage1 ??= []);
  bool hasSection3answerimage1() => _section3answerimage1 != null;

  // "section3answerimage2" field.
  List<String>? _section3answerimage2;
  List<String> get section3answerimage2 => _section3answerimage2 ?? const [];
  set section3answerimage2(List<String>? val) => _section3answerimage2 = val;
  void updateSection3answerimage2(Function(List<String>) updateFn) =>
      updateFn(_section3answerimage2 ??= []);
  bool hasSection3answerimage2() => _section3answerimage2 != null;

  // "section3answerimage3" field.
  List<String>? _section3answerimage3;
  List<String> get section3answerimage3 => _section3answerimage3 ?? const [];
  set section3answerimage3(List<String>? val) => _section3answerimage3 = val;
  void updateSection3answerimage3(Function(List<String>) updateFn) =>
      updateFn(_section3answerimage3 ??= []);
  bool hasSection3answerimage3() => _section3answerimage3 != null;

  // "section3answerimage4" field.
  List<String>? _section3answerimage4;
  List<String> get section3answerimage4 => _section3answerimage4 ?? const [];
  set section3answerimage4(List<String>? val) => _section3answerimage4 = val;
  void updateSection3answerimage4(Function(List<String>) updateFn) =>
      updateFn(_section3answerimage4 ??= []);
  bool hasSection3answerimage4() => _section3answerimage4 != null;
String? _format1;
  String get format1 => _format1 ?? '';
  set format1(String? val) => _format1 = val;

  bool hasFormat1() => _format1 != null;

  // "format2" field.
  String? _format2;
  String get format2 => _format2 ?? '';
  set format2(String? val) => _format2 = val;

  bool hasFormat2() => _format2 != null;

  // "format3" field.
  String? _format3;
  String get format3 => _format3 ?? '';
  set format3(String? val) => _format3 = val;

  bool hasFormat3() => _format3 != null;

  static QuestionsStruct fromMap(Map<String, dynamic> data) => QuestionsStruct(
        questionName: getDataList(data['questionName']),
        answer1: getDataList(data['answer1']),
        answer2: getDataList(data['answer2']),
        answer3: getDataList(data['answer3']),
        answer4: getDataList(data['answer4']),
        questionId: getDataList(data['question_id']),
        trueAnswer: getDataList(data['trueAnswer']),
        answerimage1: getDataList(data['answerimage1']),
        answerimage3: getDataList(data['answerimage3']),
        answerimage2: getDataList(data['answerimage2']),
        answerimage4: getDataList(data['answerimage4']),
        questionimage: getDataList(data['questionimage']),
        questionName2: getDataList(data['questionName2']),
        questionImage2: getDataList(data['questionImage2']),
        sectionBanswer1: getDataList(data['sectionBanswer1']),
        sectionBanswer2: getDataList(data['sectionBanswer2']),
        sectionBanswer3: getDataList(data['sectionBanswer3']),
        sectionBanswer4: getDataList(data['sectionBanswer4']),
        sectionBanswerimage1: getDataList(data['sectionBanswerimage1']),
        sectionBanswerimage2: getDataList(data['sectionBanswerimage2']),
        sectionBanswerimage3: getDataList(data['sectionBanswerimage3']),
        sectionBanswerimage4: getDataList(data['sectionBanswerimage4']),
        question2Id: getDataList(data['question2Id']),
        // Section 3 fields
        question3Id: getDataList(data['question3Id']),
        questions3: getDataList(data['questions3']),
        question3image: getDataList(data['question3image']),
        section3Answer1: getDataList(data['section3Answer1']),
        section3answer2: getDataList(data['section3answer2']),
        section3answer3: getDataList(data['section3answer3']),
        section3answer4: getDataList(data['section3answer4']),
        section3answerimage1: getDataList(data['section3answerimage1']),
        section3answerimage2: getDataList(data['section3answerimage2']),
        section3answerimage3: getDataList(data['section3answerimage3']),
        section3answerimage4: getDataList(data['section3answerimage4']),
        format1: data['format1'] as String?,
        format2: data['format2'] as String?,
        format3: data['format3'] as String?,
      );

  static QuestionsStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'questionName': _questionName,
        'answer1': _answer1,
        'answer2': _answer2,
        'answer3': _answer3,
        'answer4': _answer4,
        'question_id': _questionId,
        'trueAnswer': _trueAnswer,
        'answerimage1': _answerimage1,
        'answerimage3': _answerimage3,
        'answerimage2': _answerimage2,
        'answerimage4': _answerimage4,
        'questionimage': _questionimage,
        'questionName2': _questionName2,
        'questionImage2': _questionImage2,
        'sectionBanswer1': _sectionBanswer1,
        'sectionBanswer2': _sectionBanswer2,
        'sectionBanswer3': _sectionBanswer3,
        'sectionBanswer4': _sectionBanswer4,
        'sectionBanswerimage1': _sectionBanswerimage1,
        'sectionBanswerimage2': _sectionBanswerimage2,
        'sectionBanswerimage3': _sectionBanswerimage3,
        'sectionBanswerimage4': _sectionBanswerimage4,
        'question2Id': _question2Id,
        // Section 3 fields
        'question3Id': _question3Id,
        'questions3': _questions3,
        'question3image': _question3image,
        'section3Answer1': _section3Answer1,
        'section3answer2': _section3answer2,
        'section3answer3': _section3answer3,
        'section3answer4': _section3answer4,
        'section3answerimage1': _section3answerimage1,
        'section3answerimage2': _section3answerimage2,
        'section3answerimage3': _section3answerimage3,
        'section3answerimage4': _section3answerimage4,
        'format1': _format1,
        'format2': _format2,
        'format3': _format3,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'questionName': serializeParam(
          _questionName,
          ParamType.String,
          true,
        ),
        'answer1': serializeParam(
          _answer1,
          ParamType.String,
          true,
        ),
        'answer2': serializeParam(
          _answer2,
          ParamType.String,
          true,
        ),
        'answer3': serializeParam(
          _answer3,
          ParamType.String,
          true,
        ),
        'answer4': serializeParam(
          _answer4,
          ParamType.String,
          true,
        ),
        'question_id': serializeParam(
          _questionId,
          ParamType.String,
          true,
        ),
        'trueAnswer': serializeParam(
          _trueAnswer,
          ParamType.String,
          true,
        ),
        'answerimage1': serializeParam(
          _answerimage1,
          ParamType.String,
          true,
        ),
        'answerimage3': serializeParam(
          _answerimage3,
          ParamType.String,
          true,
        ),
        'answerimage2': serializeParam(
          _answerimage2,
          ParamType.String,
          true,
        ),
        'answerimage4': serializeParam(
          _answerimage4,
          ParamType.String,
          true,
        ),
        'questionimage': serializeParam(
          _questionimage,
          ParamType.String,
          true,
        ),
        'questionName2': serializeParam(
          _questionName2,
          ParamType.String,
          true,
        ),
        'questionImage2': serializeParam(
          _questionImage2,
          ParamType.String,
          true,
        ),
        'sectionBanswer1': serializeParam(
          _sectionBanswer1,
          ParamType.String,
          true,
        ),
        'sectionBanswer2': serializeParam(
          _sectionBanswer2,
          ParamType.String,
          true,
        ),
        'sectionBanswer3': serializeParam(
          _sectionBanswer3,
          ParamType.String,
          true,
        ),
        'sectionBanswer4': serializeParam(
          _sectionBanswer4,
          ParamType.String,
          true,
        ),
        'sectionBanswerimage1': serializeParam(
          _sectionBanswerimage1,
          ParamType.String,
          true,
        ),
        'sectionBanswerimage2': serializeParam(
          _sectionBanswerimage2,
          ParamType.String,
          true,
        ),
        'sectionBanswerimage3': serializeParam(
          _sectionBanswerimage3,
          ParamType.String,
          true,
        ),
        'sectionBanswerimage4': serializeParam(
          _sectionBanswerimage4,
          ParamType.String,
          true,
        ),
        'question2Id': serializeParam(
          _question2Id,
          ParamType.String,
          true,
        ),
        // Section 3 fields
        'question3Id': serializeParam(
          _question3Id,
          ParamType.String,
          true,
        ),
        'questions3': serializeParam(
          _questions3,
          ParamType.String,
          true,
        ),
        'question3image': serializeParam(
          _question3image,
          ParamType.String,
          true,
        ),
        'section3Answer1': serializeParam(
          _section3Answer1,
          ParamType.String,
          true,
        ),
        'section3answer2': serializeParam(
          _section3answer2,
          ParamType.String,
          true,
        ),
        'section3answer3': serializeParam(
          _section3answer3,
          ParamType.String,
          true,
        ),
        'section3answer4': serializeParam(
          _section3answer4,
          ParamType.String,
          true,
        ),
        'section3answerimage1': serializeParam(
          _section3answerimage1,
          ParamType.String,
          true,
        ),
        'section3answerimage2': serializeParam(
          _section3answerimage2,
          ParamType.String,
          true,
        ),
        'section3answerimage3': serializeParam(
          _section3answerimage3,
          ParamType.String,
          true,
        ),
        'section3answerimage4': serializeParam(
          _section3answerimage4,
          ParamType.String,
          true,
        ),
        'format1': serializeParam(
          _format1,
          ParamType.String,
        ),
        'format2': serializeParam(
          _format2,
          ParamType.String,
        ),
        'format3': serializeParam(
          _format3,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionsStruct(
        questionName: deserializeParam<String>(
          data['questionName'],
          ParamType.String,
          true,
        ),
        answer1: deserializeParam<String>(
          data['answer1'],
          ParamType.String,
          true,
        ),
        answer2: deserializeParam<String>(
          data['answer2'],
          ParamType.String,
          true,
        ),
        answer3: deserializeParam<String>(
          data['answer3'],
          ParamType.String,
          true,
        ),
        answer4: deserializeParam<String>(
          data['answer4'],
          ParamType.String,
          true,
        ),
        questionId: deserializeParam<String>(
          data['question_id'],
          ParamType.String,
          true,
        ),
        trueAnswer: deserializeParam<String>(
          data['trueAnswer'],
          ParamType.String,
          true,
        ),
        answerimage1: deserializeParam<String>(
          data['answerimage1'],
          ParamType.String,
          true,
        ),
        answerimage3: deserializeParam<String>(
          data['answerimage3'],
          ParamType.String,
          true,
        ),
        answerimage2: deserializeParam<String>(
          data['answerimage2'],
          ParamType.String,
          true,
        ),
        answerimage4: deserializeParam<String>(
          data['answerimage4'],
          ParamType.String,
          true,
        ),
        questionimage: deserializeParam<String>(
          data['questionimage'],
          ParamType.String,
          true,
        ),
        questionName2: deserializeParam<String>(
          data['questionName2'],
          ParamType.String,
          true,
        ),
        questionImage2: deserializeParam<String>(
          data['questionImage2'],
          ParamType.String,
          true,
        ),
        sectionBanswer1: deserializeParam<String>(
          data['sectionBanswer1'],
          ParamType.String,
          true,
        ),
        sectionBanswer2: deserializeParam<String>(
          data['sectionBanswer2'],
          ParamType.String,
          true,
        ),
        sectionBanswer3: deserializeParam<String>(
          data['sectionBanswer3'],
          ParamType.String,
          true,
        ),
        sectionBanswer4: deserializeParam<String>(
          data['sectionBanswer4'],
          ParamType.String,
          true,
        ),
        sectionBanswerimage1: deserializeParam<String>(
          data['sectionBanswerimage1'],
          ParamType.String,
          true,
        ),
        sectionBanswerimage2: deserializeParam<String>(
          data['sectionBanswerimage2'],
          ParamType.String,
          true,
        ),
        sectionBanswerimage3: deserializeParam<String>(
          data['sectionBanswerimage3'],
          ParamType.String,
          true,
        ),
        sectionBanswerimage4: deserializeParam<String>(
          data['sectionBanswerimage4'],
          ParamType.String,
          true,
        ),
        question2Id: deserializeParam<String>(
          data['question2Id'],
          ParamType.String,
          true,
        ),
        // Section 3 fields
        question3Id: deserializeParam<String>(
          data['question3Id'],
          ParamType.String,
          true,
        ),
        questions3: deserializeParam<String>(
          data['questions3'],
          ParamType.String,
          true,
        ),
        question3image: deserializeParam<String>(
          data['question3image'],
          ParamType.String,
          true,
        ),
        section3Answer1: deserializeParam<String>(
          data['section3Answer1'],
          ParamType.String,
          true,
        ),
        section3answer2: deserializeParam<String>(
          data['section3answer2'],
          ParamType.String,
          true,
        ),
        section3answer3: deserializeParam<String>(
          data['section3answer3'],
          ParamType.String,
          true,
        ),
        section3answer4: deserializeParam<String>(
          data['section3answer4'],
          ParamType.String,
          true,
        ),
        section3answerimage1: deserializeParam<String>(
          data['section3answerimage1'],
          ParamType.String,
          true,
        ),
        section3answerimage2: deserializeParam<String>(
          data['section3answerimage2'],
          ParamType.String,
          true,
        ),
        section3answerimage3: deserializeParam<String>(
          data['section3answerimage3'],
          ParamType.String,
          true,
        ),
        section3answerimage4: deserializeParam<String>(
          data['section3answerimage4'],
          ParamType.String,
          true,
        ),
        format1: deserializeParam(
          data['format1'],
          ParamType.String,
          false,
        ),
        format2: deserializeParam(
          data['format2'],
          ParamType.String,
          false,
        ),
        format3: deserializeParam(
          data['format3'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuestionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionsStruct &&
        listEquality.equals(questionName, other.questionName) &&
        listEquality.equals(answer1, other.answer1) &&
        listEquality.equals(answer2, other.answer2) &&
        listEquality.equals(answer3, other.answer3) &&
        listEquality.equals(answer4, other.answer4) &&
        listEquality.equals(questionId, other.questionId) &&
        listEquality.equals(trueAnswer, other.trueAnswer) &&
        listEquality.equals(answerimage1, other.answerimage1) &&
        listEquality.equals(answerimage3, other.answerimage3) &&
        listEquality.equals(answerimage2, other.answerimage2) &&
        listEquality.equals(answerimage4, other.answerimage4) &&
        listEquality.equals(questionimage, other.questionimage) &&
        listEquality.equals(questionName2, other.questionName2) &&
        listEquality.equals(questionImage2, other.questionImage2) &&
        listEquality.equals(sectionBanswer1, other.sectionBanswer1) &&
        listEquality.equals(sectionBanswer2, other.sectionBanswer2) &&
        listEquality.equals(sectionBanswer3, other.sectionBanswer3) &&
        listEquality.equals(sectionBanswer4, other.sectionBanswer4) &&
        listEquality.equals(
            sectionBanswerimage1, other.sectionBanswerimage1) &&
        listEquality.equals(
            sectionBanswerimage2, other.sectionBanswerimage2) &&
        listEquality.equals(
            sectionBanswerimage3, other.sectionBanswerimage3) &&
        listEquality.equals(
            sectionBanswerimage4, other.sectionBanswerimage4) &&
        listEquality.equals(question2Id, other.question2Id) &&
        // Section 3 fields
        listEquality.equals(question3Id, other.question3Id) &&
        listEquality.equals(questions3, other.questions3) &&
        listEquality.equals(question3image, other.question3image) &&
        listEquality.equals(section3Answer1, other.section3Answer1) &&
        listEquality.equals(section3answer2, other.section3answer2) &&
        listEquality.equals(section3answer3, other.section3answer3) &&
        listEquality.equals(section3answer4, other.section3answer4) &&
        listEquality.equals(
            section3answerimage1, other.section3answerimage1) &&
        listEquality.equals(
            section3answerimage2, other.section3answerimage2) &&
        listEquality.equals(
            section3answerimage3, other.section3answerimage3) &&
        listEquality.equals(
            section3answerimage4, other.section3answerimage4)&&
            format1 == other.format1 &&
        format2 == other.format2 &&
        format3 == other.format3;
  }

  @override
  int get hashCode => const ListEquality().hash([
        questionName,
        answer1,
        answer2,
        answer3,
        answer4,
        questionId,
        trueAnswer,
        answerimage1,
        answerimage3,
        answerimage2,
        answerimage4,
        questionimage,
        questionName2,
        questionImage2,
        sectionBanswer1,
        sectionBanswer2,
        sectionBanswer3,
        sectionBanswer4,
        sectionBanswerimage1,
        sectionBanswerimage2,
        sectionBanswerimage3,
        sectionBanswerimage4,
        question2Id,
        // Section 3 fields
        question3Id,
        questions3,
        question3image,
        section3Answer1,
        section3answer2,
        section3answer3,
        section3answer4,
        section3answerimage1,
        section3answerimage2,
        section3answerimage3,
        section3answerimage4,
        format1,
        format2,
        format3
      ]);
}

QuestionsStruct createQuestionsStruct({
  String? format1,
  String? format2,
  String? format3,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuestionsStruct(
       format1: format1,
      format2: format2,
      format3: format3,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuestionsStruct? updateQuestionsStruct(
  QuestionsStruct? questions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    questions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestionsStructData(
  Map<String, dynamic> firestoreData,
  QuestionsStruct? questions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (questions == null) {
    return;
  }
  if (questions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && questions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final questionsData = getQuestionsFirestoreData(questions, forFieldValue);
  final nestedData = questionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = questions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestionsFirestoreData(
  QuestionsStruct? questions, [
  bool forFieldValue = false,
]) {
  if (questions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(questions.toMap());

  // Add any Firestore field values
  questions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestionsListFirestoreData(
  List<QuestionsStruct>? questionss,
) =>
    questionss?.map((e) => getQuestionsFirestoreData(e, true)).toList() ?? [];
