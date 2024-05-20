import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class StorybooksRecord extends FirestoreRecord {
  StorybooksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userid" field.
  String? _userid;
  String get userid => _userid ?? '';
  bool hasUserid() => _userid != null;

  // "storybookid" field.
  String? _storybookid;
  String get storybookid => _storybookid ?? '';
  bool hasStorybookid() => _storybookid != null;

  // "storybooktitle" field.
  String? _storybooktitle;
  String get storybooktitle => _storybooktitle ?? '';
  bool hasStorybooktitle() => _storybooktitle != null;

  void _initializeFields() {
    _userid = snapshotData['userid'] as String?;
    _storybookid = snapshotData['storybookid'] as String?;
    _storybooktitle = snapshotData['storybooktitle'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('storybooks');

  static Stream<StorybooksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StorybooksRecord.fromSnapshot(s));

  static Future<StorybooksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StorybooksRecord.fromSnapshot(s));

  static StorybooksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StorybooksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StorybooksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StorybooksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StorybooksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StorybooksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStorybooksRecordData({
  String? userid,
  String? storybookid,
  String? storybooktitle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userid': userid,
      'storybookid': storybookid,
      'storybooktitle': storybooktitle,
    }.withoutNulls,
  );

  return firestoreData;
}

class StorybooksRecordDocumentEquality implements Equality<StorybooksRecord> {
  const StorybooksRecordDocumentEquality();

  @override
  bool equals(StorybooksRecord? e1, StorybooksRecord? e2) {
    return e1?.userid == e2?.userid &&
        e1?.storybookid == e2?.storybookid &&
        e1?.storybooktitle == e2?.storybooktitle;
  }

  @override
  int hash(StorybooksRecord? e) =>
      const ListEquality().hash([e?.userid, e?.storybookid, e?.storybooktitle]);

  @override
  bool isValidKey(Object? o) => o is StorybooksRecord;
}
