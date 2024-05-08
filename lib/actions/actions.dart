import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import 'package:flutter/material.dart';

Future initializeUser(BuildContext context) async {
  await LMCreditsRecord.collection.doc().set(createLMCreditsRecordData(
        userid: currentUserUid,
        totalCreditsPurchased: 0,
        totalCreditsUsed: 0,
      ));
}
