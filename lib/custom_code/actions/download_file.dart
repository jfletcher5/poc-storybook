// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> downloadFile(String url, String fileName) async {
  final dio = Dio();

  // Request storage permissions
  var status = await Permission.storage.request();
  if (status.isGranted) {
    // Get the application documents directory
    final dir = await getApplicationDocumentsDirectory();
    final filePath = '${dir.path}/$fileName';

    // Start the download
    try {
      await dio.download(url, filePath);
      // Optionally, trigger any action after the download is complete
      print('Download completed: $filePath');
    } catch (e) {
      print('Error downloading file: $e');
    }
  } else {
    print('Storage permission denied');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
