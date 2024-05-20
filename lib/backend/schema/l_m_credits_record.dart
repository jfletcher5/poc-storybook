import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LMCreditsRecord extends FirestoreRecord {
  LMCreditsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userid" field.
  String? _userid;
  String get userid => _userid ?? '';
  bool hasUserid() => _userid != null;

  // "totalCreditsPurchased" field.
  int? _totalCreditsPurchased;
  int get totalCreditsPurchased => _totalCreditsPurchased ?? 0;
  bool hasTotalCreditsPurchased() => _totalCreditsPurchased != null;

  // "totalCreditsUsed" field.
  int? _totalCreditsUsed;
  int get totalCreditsUsed => _totalCreditsUsed ?? 0;
  bool hasTotalCreditsUsed() => _totalCreditsUsed != null;

  void _initializeFields() {
    _userid = snapshotData['userid'] as String?;
    _totalCreditsPurchased =
        castToType<int>(snapshotData['totalCreditsPurchased']);
    _totalCreditsUsed = castToType<int>(snapshotData['totalCreditsUsed']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('LMCredits');

  static Stream<LMCreditsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LMCreditsRecord.fromSnapshot(s));

  static Future<LMCreditsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LMCreditsRecord.fromSnapshot(s));

  static LMCreditsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LMCreditsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LMCreditsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LMCreditsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LMCreditsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LMCreditsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLMCreditsRecordData({
  String? userid,
  int? totalCreditsPurchased,
  int? totalCreditsUsed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userid': userid,
      'totalCreditsPurchased': totalCreditsPurchased,
      'totalCreditsUsed': totalCreditsUsed,
    }.withoutNulls,
  );

  return firestoreData;
}

class LMCreditsRecordDocumentEquality implements Equality<LMCreditsRecord> {
  const LMCreditsRecordDocumentEquality();

  @override
  bool equals(LMCreditsRecord? e1, LMCreditsRecord? e2) {
    return e1?.userid == e2?.userid &&
        e1?.totalCreditsPurchased == e2?.totalCreditsPurchased &&
        e1?.totalCreditsUsed == e2?.totalCreditsUsed;
  }

  @override
  int hash(LMCreditsRecord? e) => const ListEquality()
      .hash([e?.userid, e?.totalCreditsPurchased, e?.totalCreditsUsed]);

  @override
  bool isValidKey(Object? o) => o is LMCreditsRecord;
}
