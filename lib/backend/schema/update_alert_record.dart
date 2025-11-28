import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UpdateAlertRecord extends FirestoreRecord {
  UpdateAlertRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "iosVersion" field.
  String? _iosVersion;
  String get iosVersion => _iosVersion ?? '';
  bool hasIosVersion() => _iosVersion != null;

  // "androidversion" field.
  String? _androidversion;
  String get androidversion => _androidversion ?? '';
  bool hasAndroidversion() => _androidversion != null;

  void _initializeFields() {
    _iosVersion = snapshotData['iosVersion'] as String?;
    _androidversion = snapshotData['androidversion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('updateAlert');

  static Stream<UpdateAlertRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UpdateAlertRecord.fromSnapshot(s));

  static Future<UpdateAlertRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UpdateAlertRecord.fromSnapshot(s));

  static UpdateAlertRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UpdateAlertRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UpdateAlertRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UpdateAlertRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UpdateAlertRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UpdateAlertRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUpdateAlertRecordData({
  String? iosVersion,
  String? androidversion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'iosVersion': iosVersion,
      'androidversion': androidversion,
    }.withoutNulls,
  );

  return firestoreData;
}

class UpdateAlertRecordDocumentEquality implements Equality<UpdateAlertRecord> {
  const UpdateAlertRecordDocumentEquality();

  @override
  bool equals(UpdateAlertRecord? e1, UpdateAlertRecord? e2) {
    return e1?.iosVersion == e2?.iosVersion &&
        e1?.androidversion == e2?.androidversion;
  }

  @override
  int hash(UpdateAlertRecord? e) =>
      const ListEquality().hash([e?.iosVersion, e?.androidversion]);

  @override
  bool isValidKey(Object? o) => o is UpdateAlertRecord;
}
