// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DataStruct extends FFFirebaseStruct {
  DataStruct({
    String? merchantId,
    String? merchantTransactionId,
    String? transactionId,
    double? amount,
    String? state,
    String? responseCode,
    String? responseCodeDescription,
    String? paymentInstrument,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _merchantId = merchantId,
        _merchantTransactionId = merchantTransactionId,
        _transactionId = transactionId,
        _amount = amount,
        _state = state,
        _responseCode = responseCode,
        _responseCodeDescription = responseCodeDescription,
        _paymentInstrument = paymentInstrument,
        super(firestoreUtilData);

  // "merchantId" field.
  String? _merchantId;
  String get merchantId => _merchantId ?? '';
  set merchantId(String? val) => _merchantId = val;

  bool hasMerchantId() => _merchantId != null;

  // "merchantTransactionId" field.
  String? _merchantTransactionId;
  String get merchantTransactionId => _merchantTransactionId ?? '';
  set merchantTransactionId(String? val) => _merchantTransactionId = val;

  bool hasMerchantTransactionId() => _merchantTransactionId != null;

  // "transactionId" field.
  String? _transactionId;
  String get transactionId => _transactionId ?? '';
  set transactionId(String? val) => _transactionId = val;

  bool hasTransactionId() => _transactionId != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "responseCode" field.
  String? _responseCode;
  String get responseCode => _responseCode ?? '';
  set responseCode(String? val) => _responseCode = val;

  bool hasResponseCode() => _responseCode != null;

  // "responseCodeDescription" field.
  String? _responseCodeDescription;
  String get responseCodeDescription => _responseCodeDescription ?? '';
  set responseCodeDescription(String? val) => _responseCodeDescription = val;

  bool hasResponseCodeDescription() => _responseCodeDescription != null;

  // "paymentInstrument" field.
  String? _paymentInstrument;
  String get paymentInstrument => _paymentInstrument ?? '';
  set paymentInstrument(String? val) => _paymentInstrument = val;

  bool hasPaymentInstrument() => _paymentInstrument != null;

  static DataStruct fromMap(Map<String, dynamic> data) => DataStruct(
        merchantId: data['merchantId'] as String?,
        merchantTransactionId: data['merchantTransactionId'] as String?,
        transactionId: data['transactionId'] as String?,
        amount: castToType<double>(data['amount']),
        state: data['state'] as String?,
        responseCode: data['responseCode'] as String?,
        responseCodeDescription: data['responseCodeDescription'] as String?,
        paymentInstrument: data['paymentInstrument'] as String?,
      );

  static DataStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'merchantId': _merchantId,
        'merchantTransactionId': _merchantTransactionId,
        'transactionId': _transactionId,
        'amount': _amount,
        'state': _state,
        'responseCode': _responseCode,
        'responseCodeDescription': _responseCodeDescription,
        'paymentInstrument': _paymentInstrument,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'merchantId': serializeParam(
          _merchantId,
          ParamType.String,
        ),
        'merchantTransactionId': serializeParam(
          _merchantTransactionId,
          ParamType.String,
        ),
        'transactionId': serializeParam(
          _transactionId,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'responseCode': serializeParam(
          _responseCode,
          ParamType.String,
        ),
        'responseCodeDescription': serializeParam(
          _responseCodeDescription,
          ParamType.String,
        ),
        'paymentInstrument': serializeParam(
          _paymentInstrument,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataStruct(
        merchantId: deserializeParam(
          data['merchantId'],
          ParamType.String,
          false,
        ),
        merchantTransactionId: deserializeParam(
          data['merchantTransactionId'],
          ParamType.String,
          false,
        ),
        transactionId: deserializeParam(
          data['transactionId'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        responseCode: deserializeParam(
          data['responseCode'],
          ParamType.String,
          false,
        ),
        responseCodeDescription: deserializeParam(
          data['responseCodeDescription'],
          ParamType.String,
          false,
        ),
        paymentInstrument: deserializeParam(
          data['paymentInstrument'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataStruct &&
        merchantId == other.merchantId &&
        merchantTransactionId == other.merchantTransactionId &&
        transactionId == other.transactionId &&
        amount == other.amount &&
        state == other.state &&
        responseCode == other.responseCode &&
        responseCodeDescription == other.responseCodeDescription &&
        paymentInstrument == other.paymentInstrument;
  }

  @override
  int get hashCode => const ListEquality().hash([
        merchantId,
        merchantTransactionId,
        transactionId,
        amount,
        state,
        responseCode,
        responseCodeDescription,
        paymentInstrument
      ]);
}

DataStruct createDataStruct({
  String? merchantId,
  String? merchantTransactionId,
  String? transactionId,
  double? amount,
  String? state,
  String? responseCode,
  String? responseCodeDescription,
  String? paymentInstrument,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataStruct(
      merchantId: merchantId,
      merchantTransactionId: merchantTransactionId,
      transactionId: transactionId,
      amount: amount,
      state: state,
      responseCode: responseCode,
      responseCodeDescription: responseCodeDescription,
      paymentInstrument: paymentInstrument,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataStruct? updateDataStruct(
  DataStruct? data, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    data
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataStructData(
  Map<String, dynamic> firestoreData,
  DataStruct? data,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (data == null) {
    return;
  }
  if (data.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && data.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataData = getDataFirestoreData(data, forFieldValue);
  final nestedData = dataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = data.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataFirestoreData(
  DataStruct? data, [
  bool forFieldValue = false,
]) {
  if (data == null) {
    return {};
  }
  final firestoreData = mapToFirestore(data.toMap());

  // Add any Firestore field values
  data.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataListFirestoreData(
  List<DataStruct>? datas,
) =>
    datas?.map((e) => getDataFirestoreData(e, true)).toList() ?? [];
