// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CouponStruct extends FFFirebaseStruct {
  CouponStruct({
    String? couponName,
    String? savedAmount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _couponName = couponName,
        _savedAmount = savedAmount,
        super(firestoreUtilData);

  // "couponName" field.
  String? _couponName;
  String get couponName => _couponName ?? '';
  set couponName(String? val) => _couponName = val;
  bool hasCouponName() => _couponName != null;

  // "savedAmount" field.
  String? _savedAmount;
  String get savedAmount => _savedAmount ?? '';
  set savedAmount(String? val) => _savedAmount = val;
  bool hasSavedAmount() => _savedAmount != null;

  static CouponStruct fromMap(Map<String, dynamic> data) => CouponStruct(
        couponName: data['couponName'] as String?,
        savedAmount: data['savedAmount'] as String?,
      );

  static CouponStruct? maybeFromMap(dynamic data) =>
      data is Map ? CouponStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'couponName': _couponName,
        'savedAmount': _savedAmount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'couponName': serializeParam(
          _couponName,
          ParamType.String,
        ),
        'savedAmount': serializeParam(
          _savedAmount,
          ParamType.String,
        ),
      }.withoutNulls;

  static CouponStruct fromSerializableMap(Map<String, dynamic> data) =>
      CouponStruct(
        couponName: deserializeParam(
          data['couponName'],
          ParamType.String,
          false,
        ),
        savedAmount: deserializeParam(
          data['savedAmount'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CouponStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CouponStruct &&
        couponName == other.couponName &&
        savedAmount == other.savedAmount;
  }

  @override
  int get hashCode => const ListEquality().hash([couponName, savedAmount]);
}

CouponStruct createCouponStruct({
  String? couponName,
  String? savedAmount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CouponStruct(
      couponName: couponName,
      savedAmount: savedAmount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CouponStruct? updateCouponStruct(
  CouponStruct? coupon, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    coupon
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCouponStructData(
  Map<String, dynamic> firestoreData,
  CouponStruct? coupon,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (coupon == null) {
    return;
  }
  if (coupon.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && coupon.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final couponData = getCouponFirestoreData(coupon, forFieldValue);
  final nestedData = couponData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = coupon.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCouponFirestoreData(
  CouponStruct? coupon, [
  bool forFieldValue = false,
]) {
  if (coupon == null) {
    return {};
  }
  final firestoreData = mapToFirestore(coupon.toMap());

  // Add any Firestore field values
  coupon.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCouponListFirestoreData(
  List<CouponStruct>? coupons,
) =>
    coupons?.map((e) => getCouponFirestoreData(e, true)).toList() ?? [];
