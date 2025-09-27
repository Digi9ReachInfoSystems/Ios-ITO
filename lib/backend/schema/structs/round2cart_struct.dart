// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class Round2cartStruct extends FFFirebaseStruct {
  Round2cartStruct({
    String? productId,
    String? productname,
    String? productamount,
    String? discountamout,
    String? deliverablecount,
    int? noOfitems,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productId = productId,
        _productname = productname,
        _productamount = productamount,
        _discountamout = discountamout,
        _deliverablecount = deliverablecount,
        super(firestoreUtilData);

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;
  bool hasProductId() => _productId != null;

  // "productname" field.
  String? _productname;
  String get productname => _productname ?? '';
  set productname(String? val) => _productname = val;
  bool hasProductname() => _productname != null;

  // "productamount" field.
  String? _productamount;
  String get productamount => _productamount ?? '';
  set productamount(String? val) => _productamount = val;
  bool hasProductamount() => _productamount != null;

  // "discountamout" field.
  String? _discountamout;
  String get discountamout => _discountamout ?? '';
  set discountamout(String? val) => _discountamout = val;
  bool hasDiscountamout() => _discountamout != null;

  // "deliverablecount" field.
  String? _deliverablecount;
  String get deliverablecount => _deliverablecount ?? '';
  set deliverablecount(String? val) => _deliverablecount = val;
  bool hasDeliverablecount() => _deliverablecount != null;

  static Round2cartStruct fromMap(Map<String, dynamic> data) =>
      Round2cartStruct(
        productId: data['product_id'] as String?,
        productname: data['productname'] as String?,
        productamount: data['productamount'] as String?,
        discountamout: data['discountamout'] as String?,
        deliverablecount: data['deliverablecount'] as String?,
      );

  static Round2cartStruct? maybeFromMap(dynamic data) => data is Map
      ? Round2cartStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_id': _productId,
        'productname': _productname,
        'productamount': _productamount,
        'discountamout': _discountamout,
        'deliverablecount': _deliverablecount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_id': serializeParam(
          _productId,
          ParamType.String,
        ),
        'productname': serializeParam(
          _productname,
          ParamType.String,
        ),
        'productamount': serializeParam(
          _productamount,
          ParamType.String,
        ),
        'discountamout': serializeParam(
          _discountamout,
          ParamType.String,
        ),
        'deliverablecount': serializeParam(
          _deliverablecount,
          ParamType.String,
        ),
      }.withoutNulls;

  static Round2cartStruct fromSerializableMap(Map<String, dynamic> data) =>
      Round2cartStruct(
        productId: deserializeParam(
          data['product_id'],
          ParamType.String,
          false,
        ),
        productname: deserializeParam(
          data['productname'],
          ParamType.String,
          false,
        ),
        productamount: deserializeParam(
          data['productamount'],
          ParamType.String,
          false,
        ),
        discountamout: deserializeParam(
          data['discountamout'],
          ParamType.String,
          false,
        ),
        deliverablecount: deserializeParam(
          data['deliverablecount'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'Round2cartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is Round2cartStruct &&
        productId == other.productId &&
        productname == other.productname &&
        productamount == other.productamount &&
        discountamout == other.discountamout &&
        deliverablecount == other.deliverablecount;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [productId, productname, productamount, discountamout, deliverablecount]);
}

Round2cartStruct createRound2cartStruct({
  String? productId,
  String? productname,
  String? productamount,
  String? discountamout,
  String? deliverablecount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    Round2cartStruct(
      productId: productId,
      productname: productname,
      productamount: productamount,
      discountamout: discountamout,
      deliverablecount: deliverablecount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

Round2cartStruct? updateRound2cartStruct(
  Round2cartStruct? round2cart, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    round2cart
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRound2cartStructData(
  Map<String, dynamic> firestoreData,
  Round2cartStruct? round2cart,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (round2cart == null) {
    return;
  }
  if (round2cart.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && round2cart.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final round2cartData = getRound2cartFirestoreData(round2cart, forFieldValue);
  final nestedData = round2cartData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = round2cart.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRound2cartFirestoreData(
  Round2cartStruct? round2cart, [
  bool forFieldValue = false,
]) {
  if (round2cart == null) {
    return {};
  }
  final firestoreData = mapToFirestore(round2cart.toMap());

  // Add any Firestore field values
  round2cart.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRound2cartListFirestoreData(
  List<Round2cartStruct>? round2carts,
) =>
    round2carts?.map((e) => getRound2cartFirestoreData(e, true)).toList() ?? [];
