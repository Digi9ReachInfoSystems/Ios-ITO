// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimelinedocumentStruct extends FFFirebaseStruct {
  TimelinedocumentStruct({
    String? subject,
    DateTime? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subject = subject,
        _date = date,
        super(firestoreUtilData);

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;
  bool hasSubject() => _subject != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  static TimelinedocumentStruct fromMap(Map<String, dynamic> data) =>
      TimelinedocumentStruct(
        subject: data['subject'] as String?,
        date: data['date'] as DateTime?,
      );

  static TimelinedocumentStruct? maybeFromMap(dynamic data) => data is Map
      ? TimelinedocumentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subject': _subject,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static TimelinedocumentStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TimelinedocumentStruct(
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'TimelinedocumentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TimelinedocumentStruct &&
        subject == other.subject &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([subject, date]);
}

TimelinedocumentStruct createTimelinedocumentStruct({
  String? subject,
  DateTime? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TimelinedocumentStruct(
      subject: subject,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TimelinedocumentStruct? updateTimelinedocumentStruct(
  TimelinedocumentStruct? timelinedocument, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    timelinedocument
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTimelinedocumentStructData(
  Map<String, dynamic> firestoreData,
  TimelinedocumentStruct? timelinedocument,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (timelinedocument == null) {
    return;
  }
  if (timelinedocument.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && timelinedocument.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final timelinedocumentData =
      getTimelinedocumentFirestoreData(timelinedocument, forFieldValue);
  final nestedData =
      timelinedocumentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = timelinedocument.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTimelinedocumentFirestoreData(
  TimelinedocumentStruct? timelinedocument, [
  bool forFieldValue = false,
]) {
  if (timelinedocument == null) {
    return {};
  }
  final firestoreData = mapToFirestore(timelinedocument.toMap());

  // Add any Firestore field values
  timelinedocument.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTimelinedocumentListFirestoreData(
  List<TimelinedocumentStruct>? timelinedocuments,
) =>
    timelinedocuments
        ?.map((e) => getTimelinedocumentFirestoreData(e, true))
        .toList() ??
    [];
