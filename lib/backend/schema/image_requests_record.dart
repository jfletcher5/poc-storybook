import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ImageRequestsRecord extends FirestoreRecord {
  ImageRequestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "requestJSON" field.
  String? _requestJSON;
  String get requestJSON => _requestJSON ?? '';
  bool hasRequestJSON() => _requestJSON != null;

  // "userid" field.
  String? _userid;
  String get userid => _userid ?? '';
  bool hasUserid() => _userid != null;

  // "responseBody" field.
  String? _responseBody;
  String get responseBody => _responseBody ?? '';
  bool hasResponseBody() => _responseBody != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "responseURL" field.
  String? _responseURL;
  String get responseURL => _responseURL ?? '';
  bool hasResponseURL() => _responseURL != null;

  // "requestPrompt" field.
  String? _requestPrompt;
  String get requestPrompt => _requestPrompt ?? '';
  bool hasRequestPrompt() => _requestPrompt != null;

  void _initializeFields() {
    _requestJSON = snapshotData['requestJSON'] as String?;
    _userid = snapshotData['userid'] as String?;
    _responseBody = snapshotData['responseBody'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _responseURL = snapshotData['responseURL'] as String?;
    _requestPrompt = snapshotData['requestPrompt'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('imageRequests');

  static Stream<ImageRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImageRequestsRecord.fromSnapshot(s));

  static Future<ImageRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImageRequestsRecord.fromSnapshot(s));

  static ImageRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ImageRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImageRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImageRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImageRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImageRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImageRequestsRecordData({
  String? requestJSON,
  String? userid,
  String? responseBody,
  String? photoUrl,
  DateTime? createdTime,
  String? responseURL,
  String? requestPrompt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'requestJSON': requestJSON,
      'userid': userid,
      'responseBody': responseBody,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'responseURL': responseURL,
      'requestPrompt': requestPrompt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImageRequestsRecordDocumentEquality
    implements Equality<ImageRequestsRecord> {
  const ImageRequestsRecordDocumentEquality();

  @override
  bool equals(ImageRequestsRecord? e1, ImageRequestsRecord? e2) {
    return e1?.requestJSON == e2?.requestJSON &&
        e1?.userid == e2?.userid &&
        e1?.responseBody == e2?.responseBody &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.responseURL == e2?.responseURL &&
        e1?.requestPrompt == e2?.requestPrompt;
  }

  @override
  int hash(ImageRequestsRecord? e) => const ListEquality().hash([
        e?.requestJSON,
        e?.userid,
        e?.responseBody,
        e?.photoUrl,
        e?.createdTime,
        e?.responseURL,
        e?.requestPrompt
      ]);

  @override
  bool isValidKey(Object? o) => o is ImageRequestsRecord;
}
