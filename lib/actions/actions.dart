import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future initializeUser(BuildContext context) async {
  logFirebaseEvent('initializeUser_backend_call');

  await LMCreditsRecord.collection.doc().set(createLMCreditsRecordData(
        userid: currentUserUid,
        totalCreditsPurchased: 0,
        totalCreditsUsed: 0,
      ));
}
