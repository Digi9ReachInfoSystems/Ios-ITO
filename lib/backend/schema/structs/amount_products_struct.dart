// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AmountProductsStruct extends FFFirebaseStruct {
  AmountProductsStruct({
    int? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _value = value,
        super(firestoreUtilData);

  // "value" field.
  int? _value;
  int get value => _value ?? 0;
  set value(int? val) => _value = val;
  void incrementValue(int amount) => _value = value + amount;
  bool hasValue() => _value != null;

  static AmountProductsStruct fromMap(Map<String, dynamic> data) =>
      AmountProductsStruct(
        value: castToType<int>(data['value']),
      );

  static AmountProductsStruct? maybeFromMap(dynamic data) => data is Map
      ? AmountProductsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'value': serializeParam(
          _value,
          ParamType.int,
        ),
      }.withoutNulls;

  static AmountProductsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AmountProductsStruct(
        value: deserializeParam(
          data['value'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AmountProductsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AmountProductsStruct && value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([value]);
}

AmountProductsStruct createAmountProductsStruct({
  int? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AmountProductsStruct(
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AmountProductsStruct? updateAmountProductsStruct(
  AmountProductsStruct? amountProducts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    amountProducts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAmountProductsStructData(
  Map<String, dynamic> firestoreData,
  AmountProductsStruct? amountProducts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (amountProducts == null) {
    return;
  }
  if (amountProducts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && amountProducts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final amountProductsData =
      getAmountProductsFirestoreData(amountProducts, forFieldValue);
  final nestedData =
      amountProductsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = amountProducts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAmountProductsFirestoreData(
  AmountProductsStruct? amountProducts, [
  bool forFieldValue = false,
]) {
  if (amountProducts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(amountProducts.toMap());

  // Add any Firestore field values
  amountProducts.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAmountProductsListFirestoreData(
  List<AmountProductsStruct>? amountProductss,
) =>
    amountProductss
        ?.map((e) => getAmountProductsFirestoreData(e, true))
        .toList() ??
    [];
