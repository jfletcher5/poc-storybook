import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_image_widget.dart' show CreateImageWidget;
import 'package:flutter/material.dart';

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
