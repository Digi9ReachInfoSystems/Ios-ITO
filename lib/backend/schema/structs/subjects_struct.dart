// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubjectsStruct extends FFFirebaseStruct {
  SubjectsStruct({
    String? id,
    String? subjectId,
    String? duration,
    String? serviceType,
    List<String>? std,
    String? round,
    String? amount,
    String? alias,
    List<String>? subjectTitle,
    List<String>? subjectname,
    List<String>? subjectIcon,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _subjectId = subjectId,
        _duration = duration,
        _serviceType = serviceType,
        _std = std,
        _round = round,
        _amount = amount,
        _alias = alias,
        _subjectTitle = subjectTitle,
        _subjectname = subjectname,
        _subjectIcon = subjectIcon,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "subject_id" field.
  String? _subjectId;
  String get subjectId => _subjectId ?? '';
  set subjectId(String? val) => _subjectId = val;

  bool hasSubjectId() => _subjectId != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  set duration(String? val) => _duration = val;

  bool hasDuration() => _duration != null;

  // "service_type" field.
  String? _serviceType;
  String get serviceType => _serviceType ?? '';
  set serviceType(String? val) => _serviceType = val;

  bool hasServiceType() => _serviceType != null;

  // "std" field.
  List<String>? _std;
  List<String> get std => _std ?? const [];
  set std(List<String>? val) => _std = val;

  void updateStd(Function(List<String>) updateFn) {
    updateFn(_std ??= []);
  }

  bool hasStd() => _std != null;

  // "round" field.
  String? _round;
  String get round => _round ?? '';
  set round(String? val) => _round = val;

  bool hasRound() => _round != null;

  // "amount" field.
  String? _amount;
  String get amount => _amount ?? '';
  set amount(String? val) => _amount = val;

  bool hasAmount() => _amount != null;

  // "alias" field.
  String? _alias;
  String get alias => _alias ?? '';
  set alias(String? val) => _alias = val;

  bool hasAlias() => _alias != null;

  // "subjectTitle" field.
  List<String>? _subjectTitle;
  List<String> get subjectTitle => _subjectTitle ?? const [];
  set subjectTitle(List<String>? val) => _subjectTitle = val;

  void updateSubjectTitle(Function(List<String>) updateFn) {
    updateFn(_subjectTitle ??= []);
  }

  bool hasSubjectTitle() => _subjectTitle != null;

  // "subjectname" field.
  List<String>? _subjectname;
  List<String> get subjectname => _subjectname ?? const [];
  set subjectname(List<String>? val) => _subjectname = val;

  void updateSubjectname(Function(List<String>) updateFn) {
    updateFn(_subjectname ??= []);
  }

  bool hasSubjectname() => _subjectname != null;

  // "subjectIcon" field.
  List<String>? _subjectIcon;
  List<String> get subjectIcon => _subjectIcon ?? const [];
  set subjectIcon(List<String>? val) => _subjectIcon = val;

  void updateSubjectIcon(Function(List<String>) updateFn) {
    updateFn(_subjectIcon ??= []);
  }

  bool hasSubjectIcon() => _subjectIcon != null;

  static SubjectsStruct fromMap(Map<String, dynamic> data) => SubjectsStruct(
        id: data['id'] as String?,
        subjectId: data['subject_id'] as String?,
        duration: data['duration'] as String?,
        serviceType: data['service_type'] as String?,
        std: getDataList(data['std']),
        round: data['round'] as String?,
        amount: data['amount'] as String?,
        alias: data['alias'] as String?,
        subjectTitle: getDataList(data['subjectTitle']),
        subjectname: getDataList(data['subjectname']),
        subjectIcon: getDataList(data['subjectIcon']),
      );

  static SubjectsStruct? maybeFromMap(dynamic data) =>
      data is Map ? SubjectsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'subject_id': _subjectId,
        'duration': _duration,
        'service_type': _serviceType,
        'std': _std,
        'round': _round,
        'amount': _amount,
        'alias': _alias,
        'subjectTitle': _subjectTitle,
        'subjectname': _subjectname,
        'subjectIcon': _subjectIcon,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'subject_id': serializeParam(
          _subjectId,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.String,
        ),
        'service_type': serializeParam(
          _serviceType,
          ParamType.String,
        ),
        'std': serializeParam(
          _std,
          ParamType.String,
          isList: true,
        ),
        'round': serializeParam(
          _round,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.String,
        ),
        'alias': serializeParam(
          _alias,
          ParamType.String,
        ),
        'subjectTitle': serializeParam(
          _subjectTitle,
          ParamType.String,
          isList: true,
        ),
        'subjectname': serializeParam(
          _subjectname,
          ParamType.String,
          isList: true,
        ),
        'subjectIcon': serializeParam(
          _subjectIcon,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static SubjectsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubjectsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        subjectId: deserializeParam(
          data['subject_id'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.String,
          false,
        ),
        serviceType: deserializeParam(
          data['service_type'],
          ParamType.String,
          false,
        ),
        std: deserializeParam<String>(
          data['std'],
          ParamType.String,
          true,
        ),
        round: deserializeParam(
          data['round'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.String,
          false,
        ),
        alias: deserializeParam(
          data['alias'],
          ParamType.String,
          false,
        ),
        subjectTitle: deserializeParam<String>(
          data['subjectTitle'],
          ParamType.String,
          true,
        ),
        subjectname: deserializeParam<String>(
          data['subjectname'],
          ParamType.String,
          true,
        ),
        subjectIcon: deserializeParam<String>(
          data['subjectIcon'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'SubjectsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SubjectsStruct &&
        id == other.id &&
        subjectId == other.subjectId &&
        duration == other.duration &&
        serviceType == other.serviceType &&
        listEquality.equals(std, other.std) &&
        round == other.round &&
        amount == other.amount &&
        alias == other.alias &&
        listEquality.equals(subjectTitle, other.subjectTitle) &&
        listEquality.equals(subjectname, other.subjectname) &&
        listEquality.equals(subjectIcon, other.subjectIcon);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        subjectId,
        duration,
        serviceType,
        std,
        round,
        amount,
        alias,
        subjectTitle,
        subjectname,
        subjectIcon
      ]);
}

SubjectsStruct createSubjectsStruct({
  String? id,
  String? subjectId,
  String? duration,
  String? serviceType,
  String? round,
  String? amount,
  String? alias,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubjectsStruct(
      id: id,
      subjectId: subjectId,
      duration: duration,
      serviceType: serviceType,
      round: round,
      amount: amount,
      alias: alias,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubjectsStruct? updateSubjectsStruct(
  SubjectsStruct? subjects, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subjects
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubjectsStructData(
  Map<String, dynamic> firestoreData,
  SubjectsStruct? subjects,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subjects == null) {
    return;
  }
  if (subjects.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subjects.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subjectsData = getSubjectsFirestoreData(subjects, forFieldValue);
  final nestedData = subjectsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = subjects.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubjectsFirestoreData(
  SubjectsStruct? subjects, [
  bool forFieldValue = false,
]) {
  if (subjects == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subjects.toMap());

  // Add any Firestore field values
  subjects.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubjectsListFirestoreData(
  List<SubjectsStruct>? subjectss,
) =>
    subjectss?.map((e) => getSubjectsFirestoreData(e, true)).toList() ?? [];
