// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ServicesStruct extends FFFirebaseStruct {
  ServicesStruct({
    String? serviceId,
    String? serviceName,
    String? serviceSlug,
    String? serviceType,
    String? serviceIcon,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _serviceId = serviceId,
        _serviceName = serviceName,
        _serviceSlug = serviceSlug,
        _serviceType = serviceType,
        _serviceIcon = serviceIcon,
        super(firestoreUtilData);

  // "service_id" field.
  String? _serviceId;
  String get serviceId => _serviceId ?? '';
  set serviceId(String? val) => _serviceId = val;

  bool hasServiceId() => _serviceId != null;

  // "service_name" field.
  String? _serviceName;
  String get serviceName => _serviceName ?? '';
  set serviceName(String? val) => _serviceName = val;

  bool hasServiceName() => _serviceName != null;

  // "service_slug" field.
  String? _serviceSlug;
  String get serviceSlug => _serviceSlug ?? '';
  set serviceSlug(String? val) => _serviceSlug = val;

  bool hasServiceSlug() => _serviceSlug != null;

  // "service_type" field.
  String? _serviceType;
  String get serviceType => _serviceType ?? '';
  set serviceType(String? val) => _serviceType = val;

  bool hasServiceType() => _serviceType != null;

  // "service_icon" field.
  String? _serviceIcon;
  String get serviceIcon => _serviceIcon ?? '';
  set serviceIcon(String? val) => _serviceIcon = val;

  bool hasServiceIcon() => _serviceIcon != null;

  static ServicesStruct fromMap(Map<String, dynamic> data) => ServicesStruct(
        serviceId: data['service_id'] as String?,
        serviceName: data['service_name'] as String?,
        serviceSlug: data['service_slug'] as String?,
        serviceType: data['service_type'] as String?,
        serviceIcon: data['service_icon'] as String?,
      );

  static ServicesStruct? maybeFromMap(dynamic data) =>
      data is Map ? ServicesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'service_id': _serviceId,
        'service_name': _serviceName,
        'service_slug': _serviceSlug,
        'service_type': _serviceType,
        'service_icon': _serviceIcon,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'service_id': serializeParam(
          _serviceId,
          ParamType.String,
        ),
        'service_name': serializeParam(
          _serviceName,
          ParamType.String,
        ),
        'service_slug': serializeParam(
          _serviceSlug,
          ParamType.String,
        ),
        'service_type': serializeParam(
          _serviceType,
          ParamType.String,
        ),
        'service_icon': serializeParam(
          _serviceIcon,
          ParamType.String,
        ),
      }.withoutNulls;

  static ServicesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ServicesStruct(
        serviceId: deserializeParam(
          data['service_id'],
          ParamType.String,
          false,
        ),
        serviceName: deserializeParam(
          data['service_name'],
          ParamType.String,
          false,
        ),
        serviceSlug: deserializeParam(
          data['service_slug'],
          ParamType.String,
          false,
        ),
        serviceType: deserializeParam(
          data['service_type'],
          ParamType.String,
          false,
        ),
        serviceIcon: deserializeParam(
          data['service_icon'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ServicesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ServicesStruct &&
        serviceId == other.serviceId &&
        serviceName == other.serviceName &&
        serviceSlug == other.serviceSlug &&
        serviceType == other.serviceType &&
        serviceIcon == other.serviceIcon;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([serviceId, serviceName, serviceSlug, serviceType, serviceIcon]);
}

ServicesStruct createServicesStruct({
  String? serviceId,
  String? serviceName,
  String? serviceSlug,
  String? serviceType,
  String? serviceIcon,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ServicesStruct(
      serviceId: serviceId,
      serviceName: serviceName,
      serviceSlug: serviceSlug,
      serviceType: serviceType,
      serviceIcon: serviceIcon,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ServicesStruct? updateServicesStruct(
  ServicesStruct? services, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    services
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addServicesStructData(
  Map<String, dynamic> firestoreData,
  ServicesStruct? services,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (services == null) {
    return;
  }
  if (services.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && services.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final servicesData = getServicesFirestoreData(services, forFieldValue);
  final nestedData = servicesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = services.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getServicesFirestoreData(
  ServicesStruct? services, [
  bool forFieldValue = false,
]) {
  if (services == null) {
    return {};
  }
  final firestoreData = mapToFirestore(services.toMap());

  // Add any Firestore field values
  services.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getServicesListFirestoreData(
  List<ServicesStruct>? servicess,
) =>
    servicess?.map((e) => getServicesFirestoreData(e, true)).toList() ?? [];
