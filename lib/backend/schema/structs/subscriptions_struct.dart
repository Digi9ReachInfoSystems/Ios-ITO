// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionsStruct extends FFFirebaseStruct {
  SubscriptionsStruct({
    String? userid,
    String? category,
    String? subjectname,
    String? purchase,
    String? expiry,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userid = userid,
        _category = category,
        _subjectname = subjectname,
        _purchase = purchase,
        _expiry = expiry,
        super(firestoreUtilData);

  // "userid" field.
  String? _userid;
  String get userid => _userid ?? '';
  set userid(String? val) => _userid = val;

  bool hasUserid() => _userid != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "subjectname" field.
  String? _subjectname;
  String get subjectname => _subjectname ?? '';
  set subjectname(String? val) => _subjectname = val;

  bool hasSubjectname() => _subjectname != null;

  // "purchase" field.
  String? _purchase;
  String get purchase => _purchase ?? '';
  set purchase(String? val) => _purchase = val;

  bool hasPurchase() => _purchase != null;

  // "expiry" field.
  String? _expiry;
  String get expiry => _expiry ?? '';
  set expiry(String? val) => _expiry = val;

  bool hasExpiry() => _expiry != null;

  static SubscriptionsStruct fromMap(Map<String, dynamic> data) =>
      SubscriptionsStruct(
        userid: data['userid'] as String?,
        category: data['category'] as String?,
        subjectname: data['subjectname'] as String?,
        purchase: data['purchase'] as String?,
        expiry: data['expiry'] as String?,
      );

  static SubscriptionsStruct? maybeFromMap(dynamic data) => data is Map
      ? SubscriptionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userid': _userid,
        'category': _category,
        'subjectname': _subjectname,
        'purchase': _purchase,
        'expiry': _expiry,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userid': serializeParam(
          _userid,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'subjectname': serializeParam(
          _subjectname,
          ParamType.String,
        ),
        'purchase': serializeParam(
          _purchase,
          ParamType.String,
        ),
        'expiry': serializeParam(
          _expiry,
          ParamType.String,
        ),
      }.withoutNulls;

  static SubscriptionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubscriptionsStruct(
        userid: deserializeParam(
          data['userid'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        subjectname: deserializeParam(
          data['subjectname'],
          ParamType.String,
          false,
        ),
        purchase: deserializeParam(
          data['purchase'],
          ParamType.String,
          false,
        ),
        expiry: deserializeParam(
          data['expiry'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SubscriptionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubscriptionsStruct &&
        userid == other.userid &&
        category == other.category &&
        subjectname == other.subjectname &&
        purchase == other.purchase &&
        expiry == other.expiry;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([userid, category, subjectname, purchase, expiry]);
}

SubscriptionsStruct createSubscriptionsStruct({
  String? userid,
  String? category,
  String? subjectname,
  String? purchase,
  String? expiry,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubscriptionsStruct(
      userid: userid,
      category: category,
      subjectname: subjectname,
      purchase: purchase,
      expiry: expiry,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubscriptionsStruct? updateSubscriptionsStruct(
  SubscriptionsStruct? subscriptions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subscriptions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubscriptionsStructData(
  Map<String, dynamic> firestoreData,
  SubscriptionsStruct? subscriptions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subscriptions == null) {
    return;
  }
  if (subscriptions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subscriptions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subscriptionsData =
      getSubscriptionsFirestoreData(subscriptions, forFieldValue);
  final nestedData =
      subscriptionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = subscriptions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubscriptionsFirestoreData(
  SubscriptionsStruct? subscriptions, [
  bool forFieldValue = false,
]) {
  if (subscriptions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subscriptions.toMap());

  // Add any Firestore field values
  subscriptions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubscriptionsListFirestoreData(
  List<SubscriptionsStruct>? subscriptionss,
) =>
    subscriptionss
        ?.map((e) => getSubscriptionsFirestoreData(e, true))
        .toList() ??
    [];
