import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeletionrequestRecord extends FirestoreRecord {
  DeletionrequestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  void _initializeFields() {
    _username = snapshotData['username'] as String?;
    _reason = snapshotData['reason'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('deletionrequest');

  static Stream<DeletionrequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeletionrequestRecord.fromSnapshot(s));

  static Future<DeletionrequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeletionrequestRecord.fromSnapshot(s));

  static DeletionrequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DeletionrequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeletionrequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeletionrequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeletionrequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeletionrequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeletionrequestRecordData({
  String? username,
  String? reason,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'username': username,
      'reason': reason,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeletionrequestRecordDocumentEquality
    implements Equality<DeletionrequestRecord> {
  const DeletionrequestRecordDocumentEquality();

  @override
  bool equals(DeletionrequestRecord? e1, DeletionrequestRecord? e2) {
    return e1?.username == e2?.username && e1?.reason == e2?.reason;
  }

  @override
  int hash(DeletionrequestRecord? e) =>
      const ListEquality().hash([e?.username, e?.reason]);

  @override
  bool isValidKey(Object? o) => o is DeletionrequestRecord;
}
