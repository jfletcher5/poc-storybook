import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _model = 'dall-e-2';
  String get model => _model;
  set model(String value) {
    _model = value;
  }

  String _prompt = 'bitcoins growing in the forest next to a waterfall';
  String get prompt => _prompt;
  set prompt(String value) {
    _prompt = value;
  }

  String _quality = 'standard';
  String get quality => _quality;
  set quality(String value) {
    _quality = value;
  }

  String _size = '1024x1024';
  String get size => _size;
  set size(String value) {
    _size = value;
  }

  dynamic _requestBody = jsonDecode(
      '{\"prompt\":\"picture of a bitcoin\",\"model\":\"dall-e-2\",\"size\":\"1024x1024\",\"quality\":\"standard\"}');
  dynamic get requestBody => _requestBody;
  set requestBody(dynamic value) {
    _requestBody = value;
  }
}
