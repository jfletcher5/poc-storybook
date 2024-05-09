import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'request_credits_widget.dart' show RequestCreditsWidget;
import 'package:flutter/material.dart';

class RequestCreditsModel extends FlutterFlowModel<RequestCreditsWidget> {
  ///  Local state fields for this component.

  int? creditReq = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  int? outputInt;
  // Stores action output result for [Backend Call - API (Update Credits)] action in Button widget.
  ApiCallResponse? apiResult28j;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
