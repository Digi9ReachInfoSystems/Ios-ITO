// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PiechartvaluesStruct extends FFFirebaseStruct {
  PiechartvaluesStruct({
    String? totalquestions,
    String? attemptedquestions,
    String? unatempted,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _totalquestions = totalquestions,
        _attemptedquestions = attemptedquestions,
        _unatempted = unatempted,
        super(firestoreUtilData);

  // "totalquestions" field.
  String? _totalquestions;
  String get totalquestions => _totalquestions ?? '';
  set totalquestions(String? val) => _totalquestions = val;
  bool hasTotalquestions() => _totalquestions != null;

  // "attemptedquestions" field.
  String? _attemptedquestions;
  String get attemptedquestions => _attemptedquestions ?? '';
  set attemptedquestions(String? val) => _attemptedquestions = val;
  bool hasAttemptedquestions() => _attemptedquestions != null;

  // "unatempted" field.
  String? _unatempted;
  String get unatempted => _unatempted ?? '';
  set unatempted(String? val) => _unatempted = val;
  bool hasUnatempted() => _unatempted != null;

  static PiechartvaluesStruct fromMap(Map<String, dynamic> data) =>
      PiechartvaluesStruct(
        totalquestions: data['totalquestions'] as String?,
        attemptedquestions: data['attemptedquestions'] as String?,
        unatempted: data['unatempted'] as String?,
      );

  static PiechartvaluesStruct? maybeFromMap(dynamic data) => data is Map
      ? PiechartvaluesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'totalquestions': _totalquestions,
        'attemptedquestions': _attemptedquestions,
        'unatempted': _unatempted,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'totalquestions': serializeParam(
          _totalquestions,
          ParamType.String,
        ),
        'attemptedquestions': serializeParam(
          _attemptedquestions,
          ParamType.String,
        ),
        'unatempted': serializeParam(
          _unatempted,
          ParamType.String,
        ),
      }.withoutNulls;

  static PiechartvaluesStruct fromSerializableMap(Map<String, dynamic> data) =>
      PiechartvaluesStruct(
        totalquestions: deserializeParam(
          data['totalquestions'],
          ParamType.String,
          false,
        ),
        attemptedquestions: deserializeParam(
          data['attemptedquestions'],
          ParamType.String,
          false,
        ),
        unatempted: deserializeParam(
          data['unatempted'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PiechartvaluesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PiechartvaluesStruct &&
        totalquestions == other.totalquestions &&
        attemptedquestions == other.attemptedquestions &&
        unatempted == other.unatempted;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([totalquestions, attemptedquestions, unatempted]);
}

PiechartvaluesStruct createPiechartvaluesStruct({
  String? totalquestions,
  String? attemptedquestions,
  String? unatempted,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PiechartvaluesStruct(
      totalquestions: totalquestions,
      attemptedquestions: attemptedquestions,
      unatempted: unatempted,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PiechartvaluesStruct? updatePiechartvaluesStruct(
  PiechartvaluesStruct? piechartvalues, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    piechartvalues
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPiechartvaluesStructData(
  Map<String, dynamic> firestoreData,
  PiechartvaluesStruct? piechartvalues,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (piechartvalues == null) {
    return;
  }
  if (piechartvalues.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && piechartvalues.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final piechartvaluesData =
      getPiechartvaluesFirestoreData(piechartvalues, forFieldValue);
  final nestedData =
      piechartvaluesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = piechartvalues.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPiechartvaluesFirestoreData(
  PiechartvaluesStruct? piechartvalues, [
  bool forFieldValue = false,
]) {
  if (piechartvalues == null) {
    return {};
  }
  final firestoreData = mapToFirestore(piechartvalues.toMap());

  // Add any Firestore field values
  piechartvalues.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPiechartvaluesListFirestoreData(
  List<PiechartvaluesStruct>? piechartvaluess,
) =>
    piechartvaluess
        ?.map((e) => getPiechartvaluesFirestoreData(e, true))
        .toList() ??
    [];
