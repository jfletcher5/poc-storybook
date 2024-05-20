import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  String _model = '\"dall-e-2\"';
  String get model => _model;
  set model(String _value) {
    _model = _value;
  }

  String _prompt = '\"bitcoins growing in the forest next to a waterfall\"';
  String get prompt => _prompt;
  set prompt(String _value) {
    _prompt = _value;
  }

  String _size = '\"1024x1024\"';
  String get size => _size;
  set size(String _value) {
    _size = _value;
  }

  String _quality = '\"standard\"';
  String get quality => _quality;
  set quality(String _value) {
    _quality = _value;
  }

  dynamic _requestBody = jsonDecode(
      '{\"prompt\":\"picture of a bitcoin\",\"model\":\"dall-e-2\",\"size\":\"1024x1024\",\"quality\":\"standard\"}');
  dynamic get requestBody => _requestBody;
  set requestBody(dynamic _value) {
    _requestBody = _value;
  }
}
