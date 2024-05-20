import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_image_widget.dart' show CreateImageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateImageModel extends FlutterFlowModel<CreateImageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for RadioButtonModel widget.
  FormFieldController<String>? radioButtonModelValueController;
  // State field(s) for RadioButtonQuality widget.
  FormFieldController<String>? radioButtonQualityValueController;
  // State field(s) for RadioButtonResolution widget.
  FormFieldController<String>? radioButtonResolutionValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ImageRequestsRecord? outputdocID;
  // Stores action output result for [Backend Call - API (generate)] action in Button widget.
  ApiCallResponse? imageResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonModelValue => radioButtonModelValueController?.value;
  String? get radioButtonQualityValue =>
      radioButtonQualityValueController?.value;
  String? get radioButtonResolutionValue =>
      radioButtonResolutionValueController?.value;
}
