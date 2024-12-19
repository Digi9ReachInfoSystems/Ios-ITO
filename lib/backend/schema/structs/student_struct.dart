// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentStruct extends FFFirebaseStruct {
  StudentStruct({
    String? studentName,
    String? userId,
    String? mobileNo,
    String? password,
    String? token,
    List<String>? allowedServices,
    String? parentName,
    String? parentEmail,
    String? address,
    String? district,
    String? state,
    String? city,
    String? pincode,
    String? schoolName,
    String? schoolState,
    String? schoolAddress,
    String? schoolCity,
    String? schoolPincode,
    String? stdId,
    int? oldId,
    int? updatedId,
    String? username,
    bool? result,
    int? showresult,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _studentName = studentName,
        _userId = userId,
        _mobileNo = mobileNo,
        _password = password,
        _token = token,
        _allowedServices = allowedServices,
        _parentName = parentName,
        _parentEmail = parentEmail,
        _address = address,
        _district = district,
        _state = state,
        _city = city,
        _pincode = pincode,
        _schoolName = schoolName,
        _schoolState = schoolState,
        _schoolAddress = schoolAddress,
        _schoolCity = schoolCity,
        _schoolPincode = schoolPincode,
        _stdId = stdId,
        _oldId = oldId,
        _updatedId = updatedId,
        _username = username,
        _result = result,
        _showresult = showresult,
        super(firestoreUtilData);

  // "student_name" field.
  String? _studentName;
  String get studentName => _studentName ?? '';
  set studentName(String? val) => _studentName = val;
  bool hasStudentName() => _studentName != null;

  // "user_Id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;
  bool hasUserId() => _userId != null;

  // "mobileNo" field.
  String? _mobileNo;
  String get mobileNo => _mobileNo ?? '';
  set mobileNo(String? val) => _mobileNo = val;
  bool hasMobileNo() => _mobileNo != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;
  bool hasPassword() => _password != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;
  bool hasToken() => _token != null;

  // "allowedServices" field.
  List<String>? _allowedServices;
  List<String> get allowedServices => _allowedServices ?? const [];
  set allowedServices(List<String>? val) => _allowedServices = val;
  void updateAllowedServices(Function(List<String>) updateFn) =>
      updateFn(_allowedServices ??= []);
  bool hasAllowedServices() => _allowedServices != null;

  // "parentName" field.
  String? _parentName;
  String get parentName => _parentName ?? '';
  set parentName(String? val) => _parentName = val;
  bool hasParentName() => _parentName != null;

  // "parentEmail" field.
  String? _parentEmail;
  String get parentEmail => _parentEmail ?? '';
  set parentEmail(String? val) => _parentEmail = val;
  bool hasParentEmail() => _parentEmail != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "district" field.
  String? _district;
  String get district => _district ?? '';
  set district(String? val) => _district = val;
  bool hasDistrict() => _district != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;
  bool hasState() => _state != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "pincode" field.
  String? _pincode;
  String get pincode => _pincode ?? '';
  set pincode(String? val) => _pincode = val;
  bool hasPincode() => _pincode != null;

  // "school_name" field.
  String? _schoolName;
  String get schoolName => _schoolName ?? '';
  set schoolName(String? val) => _schoolName = val;
  bool hasSchoolName() => _schoolName != null;

  // "school_state" field.
  String? _schoolState;
  String get schoolState => _schoolState ?? '';
  set schoolState(String? val) => _schoolState = val;
  bool hasSchoolState() => _schoolState != null;

  // "school_address" field.
  String? _schoolAddress;
  String get schoolAddress => _schoolAddress ?? '';
  set schoolAddress(String? val) => _schoolAddress = val;
  bool hasSchoolAddress() => _schoolAddress != null;

  // "school_city" field.
  String? _schoolCity;
  String get schoolCity => _schoolCity ?? '';
  set schoolCity(String? val) => _schoolCity = val;
  bool hasSchoolCity() => _schoolCity != null;

  // "school_pincode" field.
  String? _schoolPincode;
  String get schoolPincode => _schoolPincode ?? '';
  set schoolPincode(String? val) => _schoolPincode = val;
  bool hasSchoolPincode() => _schoolPincode != null;

  // "std_id" field.
  String? _stdId;
  String get stdId => _stdId ?? '';
  set stdId(String? val) => _stdId = val;
  bool hasStdId() => _stdId != null;

  // "old_id" field.
  int? _oldId;
  int get oldId => _oldId ?? 0;
  set oldId(int? val) => _oldId = val;
  void incrementOldId(int amount) => _oldId = oldId + amount;
  bool hasOldId() => _oldId != null;

  // "updated_id" field.
  int? _updatedId;
  int get updatedId => _updatedId ?? 0;
  set updatedId(int? val) => _updatedId = val;
  void incrementUpdatedId(int amount) => _updatedId = updatedId + amount;
  bool hasUpdatedId() => _updatedId != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;
  bool hasUsername() => _username != null;

  // "result" field.
  bool? _result;
  bool get result => _result ?? false;
  set result(bool? val) => _result = val;
  bool hasResult() => _result != null;

  // "showresult" field.
  int? _showresult;
  int get showresult => _showresult ?? 0;
  set showresult(int? val) => _showresult = val;
  void incrementShowresult(int amount) => _showresult = showresult + amount;
  bool hasShowresult() => _showresult != null;

  static StudentStruct fromMap(Map<String, dynamic> data) => StudentStruct(
        studentName: data['student_name'] as String?,
        userId: data['user_Id'] as String?,
        mobileNo: data['mobileNo'] as String?,
        password: data['password'] as String?,
        token: data['token'] as String?,
        allowedServices: getDataList(data['allowedServices']),
        parentName: data['parentName'] as String?,
        parentEmail: data['parentEmail'] as String?,
        address: data['address'] as String?,
        district: data['district'] as String?,
        state: data['state'] as String?,
        city: data['city'] as String?,
        pincode: data['pincode'] as String?,
        schoolName: data['school_name'] as String?,
        schoolState: data['school_state'] as String?,
        schoolAddress: data['school_address'] as String?,
        schoolCity: data['school_city'] as String?,
        schoolPincode: data['school_pincode'] as String?,
        stdId: data['std_id'] as String?,
        oldId: castToType<int>(data['old_id']),
        updatedId: castToType<int>(data['updated_id']),
        username: data['username'] as String?,
        result: data['result'] as bool?,
        showresult: castToType<int>(data['showresult']),
      );

  static StudentStruct? maybeFromMap(dynamic data) =>
      data is Map ? StudentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'student_name': _studentName,
        'user_Id': _userId,
        'mobileNo': _mobileNo,
        'password': _password,
        'token': _token,
        'allowedServices': _allowedServices,
        'parentName': _parentName,
        'parentEmail': _parentEmail,
        'address': _address,
        'district': _district,
        'state': _state,
        'city': _city,
        'pincode': _pincode,
        'school_name': _schoolName,
        'school_state': _schoolState,
        'school_address': _schoolAddress,
        'school_city': _schoolCity,
        'school_pincode': _schoolPincode,
        'std_id': _stdId,
        'old_id': _oldId,
        'updated_id': _updatedId,
        'username': _username,
        'result': _result,
        'showresult': _showresult,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'student_name': serializeParam(
          _studentName,
          ParamType.String,
        ),
        'user_Id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'mobileNo': serializeParam(
          _mobileNo,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
        'allowedServices': serializeParam(
          _allowedServices,
          ParamType.String,
          true,
        ),
        'parentName': serializeParam(
          _parentName,
          ParamType.String,
        ),
        'parentEmail': serializeParam(
          _parentEmail,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'district': serializeParam(
          _district,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'pincode': serializeParam(
          _pincode,
          ParamType.String,
        ),
        'school_name': serializeParam(
          _schoolName,
          ParamType.String,
        ),
        'school_state': serializeParam(
          _schoolState,
          ParamType.String,
        ),
        'school_address': serializeParam(
          _schoolAddress,
          ParamType.String,
        ),
        'school_city': serializeParam(
          _schoolCity,
          ParamType.String,
        ),
        'school_pincode': serializeParam(
          _schoolPincode,
          ParamType.String,
        ),
        'std_id': serializeParam(
          _stdId,
          ParamType.String,
        ),
        'old_id': serializeParam(
          _oldId,
          ParamType.int,
        ),
        'updated_id': serializeParam(
          _updatedId,
          ParamType.int,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'result': serializeParam(
          _result,
          ParamType.bool,
        ),
        'showresult': serializeParam(
          _showresult,
          ParamType.int,
        ),
      }.withoutNulls;

  static StudentStruct fromSerializableMap(Map<String, dynamic> data) =>
      StudentStruct(
        studentName: deserializeParam(
          data['student_name'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_Id'],
          ParamType.String,
          false,
        ),
        mobileNo: deserializeParam(
          data['mobileNo'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
        allowedServices: deserializeParam<String>(
          data['allowedServices'],
          ParamType.String,
          true,
        ),
        parentName: deserializeParam(
          data['parentName'],
          ParamType.String,
          false,
        ),
        parentEmail: deserializeParam(
          data['parentEmail'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        district: deserializeParam(
          data['district'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        pincode: deserializeParam(
          data['pincode'],
          ParamType.String,
          false,
        ),
        schoolName: deserializeParam(
          data['school_name'],
          ParamType.String,
          false,
        ),
        schoolState: deserializeParam(
          data['school_state'],
          ParamType.String,
          false,
        ),
        schoolAddress: deserializeParam(
          data['school_address'],
          ParamType.String,
          false,
        ),
        schoolCity: deserializeParam(
          data['school_city'],
          ParamType.String,
          false,
        ),
        schoolPincode: deserializeParam(
          data['school_pincode'],
          ParamType.String,
          false,
        ),
        stdId: deserializeParam(
          data['std_id'],
          ParamType.String,
          false,
        ),
        oldId: deserializeParam(
          data['old_id'],
          ParamType.int,
          false,
        ),
        updatedId: deserializeParam(
          data['updated_id'],
          ParamType.int,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        result: deserializeParam(
          data['result'],
          ParamType.bool,
          false,
        ),
        showresult: deserializeParam(
          data['showresult'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'StudentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StudentStruct &&
        studentName == other.studentName &&
        userId == other.userId &&
        mobileNo == other.mobileNo &&
        password == other.password &&
        token == other.token &&
        listEquality.equals(allowedServices, other.allowedServices) &&
        parentName == other.parentName &&
        parentEmail == other.parentEmail &&
        address == other.address &&
        district == other.district &&
        state == other.state &&
        city == other.city &&
        pincode == other.pincode &&
        schoolName == other.schoolName &&
        schoolState == other.schoolState &&
        schoolAddress == other.schoolAddress &&
        schoolCity == other.schoolCity &&
        schoolPincode == other.schoolPincode &&
        stdId == other.stdId &&
        oldId == other.oldId &&
        updatedId == other.updatedId &&
        username == other.username &&
        result == other.result &&
        showresult == other.showresult;
  }

  @override
  int get hashCode => const ListEquality().hash([
        studentName,
        userId,
        mobileNo,
        password,
        token,
        allowedServices,
        parentName,
        parentEmail,
        address,
        district,
        state,
        city,
        pincode,
        schoolName,
        schoolState,
        schoolAddress,
        schoolCity,
        schoolPincode,
        stdId,
        oldId,
        updatedId,
        username,
        result,
        showresult
      ]);
}

StudentStruct createStudentStruct({
  String? studentName,
  String? userId,
  String? mobileNo,
  String? password,
  String? token,
  String? parentName,
  String? parentEmail,
  String? address,
  String? district,
  String? state,
  String? city,
  String? pincode,
  String? schoolName,
  String? schoolState,
  String? schoolAddress,
  String? schoolCity,
  String? schoolPincode,
  String? stdId,
  int? oldId,
  int? updatedId,
  String? username,
  bool? result,
  int? showresult,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StudentStruct(
      studentName: studentName,
      userId: userId,
      mobileNo: mobileNo,
      password: password,
      token: token,
      parentName: parentName,
      parentEmail: parentEmail,
      address: address,
      district: district,
      state: state,
      city: city,
      pincode: pincode,
      schoolName: schoolName,
      schoolState: schoolState,
      schoolAddress: schoolAddress,
      schoolCity: schoolCity,
      schoolPincode: schoolPincode,
      stdId: stdId,
      oldId: oldId,
      updatedId: updatedId,
      username: username,
      result: result,
      showresult: showresult,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StudentStruct? updateStudentStruct(
  StudentStruct? student, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    student
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStudentStructData(
  Map<String, dynamic> firestoreData,
  StudentStruct? student,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (student == null) {
    return;
  }
  if (student.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && student.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final studentData = getStudentFirestoreData(student, forFieldValue);
  final nestedData = studentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = student.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStudentFirestoreData(
  StudentStruct? student, [
  bool forFieldValue = false,
]) {
  if (student == null) {
    return {};
  }
  final firestoreData = mapToFirestore(student.toMap());

  // Add any Firestore field values
  student.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStudentListFirestoreData(
  List<StudentStruct>? students,
) =>
    students?.map((e) => getStudentFirestoreData(e, true)).toList() ?? [];
