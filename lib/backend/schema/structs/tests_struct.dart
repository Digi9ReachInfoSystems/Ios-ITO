// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TestsStruct extends FFFirebaseStruct {
  TestsStruct({
    String? testId,
    String? testName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _testId = testId,
        _testName = testName,
        super(firestoreUtilData);

  // "test_id" field.
  String? _testId;
  String get testId => _testId ?? '';
  set testId(String? val) => _testId = val;
  bool hasTestId() => _testId != null;

  // "testName" field.
  String? _testName;
  String get testName => _testName ?? '';
  set testName(String? val) => _testName = val;
  bool hasTestName() => _testName != null;

  static TestsStruct fromMap(Map<String, dynamic> data) => TestsStruct(
        testId: data['test_id'] as String?,
        testName: data['testName'] as String?,
      );

  static TestsStruct? maybeFromMap(dynamic data) =>
      data is Map ? TestsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'test_id': _testId,
        'testName': _testName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'test_id': serializeParam(
          _testId,
          ParamType.String,
        ),
        'testName': serializeParam(
          _testName,
          ParamType.String,
        ),
      }.withoutNulls;

  static TestsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestsStruct(
        testId: deserializeParam(
          data['test_id'],
          ParamType.String,
          false,
        ),
        testName: deserializeParam(
          data['testName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TestsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestsStruct &&
        testId == other.testId &&
        testName == other.testName;
  }

  @override
  int get hashCode => const ListEquality().hash([testId, testName]);
}

TestsStruct createTestsStruct({
  String? testId,
  String? testName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TestsStruct(
      testId: testId,
      testName: testName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TestsStruct? updateTestsStruct(
  TestsStruct? tests, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tests
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTestsStructData(
  Map<String, dynamic> firestoreData,
  TestsStruct? tests,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tests == null) {
    return;
  }
  if (tests.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tests.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final testsData = getTestsFirestoreData(tests, forFieldValue);
  final nestedData = testsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tests.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTestsFirestoreData(
  TestsStruct? tests, [
  bool forFieldValue = false,
]) {
  if (tests == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tests.toMap());

  // Add any Firestore field values
  tests.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTestsListFirestoreData(
  List<TestsStruct>? testss,
) =>
    testss?.map((e) => getTestsFirestoreData(e, true)).toList() ?? [];
