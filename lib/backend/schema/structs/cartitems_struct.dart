// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartitemsStruct extends FFFirebaseStruct {
  CartitemsStruct({
    String? productId,
    String? productname,
    String? productamount,
    String? producttypes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productId = productId,
        _productname = productname,
        _productamount = productamount,
        _producttypes = producttypes,
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

  static CartitemsStruct fromMap(Map<String, dynamic> data) => CartitemsStruct(
        productId: data['product_id'] as String?,
        productname: data['productname'] as String?,
        productamount: data['productamount'] as String?,
        producttypes: data['producttypes'] as String?,
      );

  static CartitemsStruct? maybeFromMap(dynamic data) => data is Map
      ? CartitemsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_id': _productId,
        'productname': _productname,
        'productamount': _productamount,
        'producttypes': _producttypes,
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
      }.withoutNulls;

  static CartitemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartitemsStruct(
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
      );

  @override
  String toString() => 'CartitemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartitemsStruct &&
        productId == other.productId &&
        productname == other.productname &&
        productamount == other.productamount &&
        producttypes == other.producttypes;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([productId, productname, productamount, producttypes]);
}

CartitemsStruct createCartitemsStruct({
  String? productId,
  String? productname,
  String? productamount,
  String? producttypes,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartitemsStruct(
      productId: productId,
      productname: productname,
      productamount: productamount,
      producttypes: producttypes,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartitemsStruct? updateCartitemsStruct(
  CartitemsStruct? cartitems, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartitems
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartitemsStructData(
  Map<String, dynamic> firestoreData,
  CartitemsStruct? cartitems,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartitems == null) {
    return;
  }
  if (cartitems.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartitems.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartitemsData = getCartitemsFirestoreData(cartitems, forFieldValue);
  final nestedData = cartitemsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartitems.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartitemsFirestoreData(
  CartitemsStruct? cartitems, [
  bool forFieldValue = false,
]) {
  if (cartitems == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartitems.toMap());

  // Add any Firestore field values
  cartitems.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartitemsListFirestoreData(
  List<CartitemsStruct>? cartitemss,
) =>
    cartitemss?.map((e) => getCartitemsFirestoreData(e, true)).toList() ?? [];
