// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PowercartStruct extends FFFirebaseStruct {
  PowercartStruct({
    String? productId,
    String? productname,
    String? productamount,
    String? producttypes,
    String? packageId,
    String? deliverablecount,
    int? noofitems,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productId = productId,
        _productname = productname,
        _productamount = productamount,
        _producttypes = producttypes,
        _packageId = packageId,
        _deliverablecount = deliverablecount,
        _noofitems = noofitems,
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

  // "producttypes" field.
  String? _producttypes;
  String get producttypes => _producttypes ?? '';
  set producttypes(String? val) => _producttypes = val;
  bool hasProducttypes() => _producttypes != null;

  // "packageId" field.
  String? _packageId;
  String get packageId => _packageId ?? '';
  set packageId(String? val) => _packageId = val;
  bool hasPackageId() => _packageId != null;

  // "deliverablecount" field.
  String? _deliverablecount;
  String get deliverablecount => _deliverablecount ?? '';
  set deliverablecount(String? val) => _deliverablecount = val;
  bool hasDeliverablecount() => _deliverablecount != null;

  // "noofitems" field.
  int? _noofitems;
  int get noofitems => _noofitems ?? 0;
  set noofitems(int? val) => _noofitems = val;
  void incrementNoofitems(int amount) => _noofitems = noofitems + amount;
  bool hasNoofitems() => _noofitems != null;

  static PowercartStruct fromMap(Map<String, dynamic> data) => PowercartStruct(
        productId: data['product_id'] as String?,
        productname: data['productname'] as String?,
        productamount: data['productamount'] as String?,
        producttypes: data['producttypes'] as String?,
        packageId: data['packageId'] as String?,
        deliverablecount: data['deliverablecount'] as String?,
        noofitems: castToType<int>(data['noofitems']),
      );

  static PowercartStruct? maybeFromMap(dynamic data) => data is Map
      ? PowercartStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_id': _productId,
        'productname': _productname,
        'productamount': _productamount,
        'producttypes': _producttypes,
        'packageId': _packageId,
        'deliverablecount': _deliverablecount,
        'noofitems': _noofitems,
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
        'producttypes': serializeParam(
          _producttypes,
          ParamType.String,
        ),
        'packageId': serializeParam(
          _packageId,
          ParamType.String,
        ),
        'deliverablecount': serializeParam(
          _deliverablecount,
          ParamType.String,
        ),
        'noofitems': serializeParam(
          _noofitems,
          ParamType.int,
        ),
      }.withoutNulls;

  static PowercartStruct fromSerializableMap(Map<String, dynamic> data) =>
      PowercartStruct(
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
        producttypes: deserializeParam(
          data['producttypes'],
          ParamType.String,
          false,
        ),
        packageId: deserializeParam(
          data['packageId'],
          ParamType.String,
          false,
        ),
        deliverablecount: deserializeParam(
          data['deliverablecount'],
          ParamType.String,
          false,
        ),
        noofitems: deserializeParam(
          data['noofitems'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PowercartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PowercartStruct &&
        productId == other.productId &&
        productname == other.productname &&
        productamount == other.productamount &&
        producttypes == other.producttypes &&
        packageId == other.packageId &&
        deliverablecount == other.deliverablecount &&
        noofitems == other.noofitems;
  }

  @override
  int get hashCode => const ListEquality().hash([
        productId,
        productname,
        productamount,
        producttypes,
        packageId,
        deliverablecount,
        noofitems
      ]);
}

PowercartStruct createPowercartStruct({
  String? productId,
  String? productname,
  String? productamount,
  String? producttypes,
  String? packageId,
  String? deliverablecount,
  int? noofitems,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PowercartStruct(
      productId: productId,
      productname: productname,
      productamount: productamount,
      producttypes: producttypes,
      packageId: packageId,
      deliverablecount: deliverablecount,
      noofitems: noofitems,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PowercartStruct? updatePowercartStruct(
  PowercartStruct? powercart, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    powercart
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPowercartStructData(
  Map<String, dynamic> firestoreData,
  PowercartStruct? powercart,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (powercart == null) {
    return;
  }
  if (powercart.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && powercart.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final powercartData = getPowercartFirestoreData(powercart, forFieldValue);
  final nestedData = powercartData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = powercart.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPowercartFirestoreData(
  PowercartStruct? powercart, [
  bool forFieldValue = false,
]) {
  if (powercart == null) {
    return {};
  }
  final firestoreData = mapToFirestore(powercart.toMap());

  // Add any Firestore field values
  powercart.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPowercartListFirestoreData(
  List<PowercartStruct>? powercarts,
) =>
    powercarts?.map((e) => getPowercartFirestoreData(e, true)).toList() ?? [];
