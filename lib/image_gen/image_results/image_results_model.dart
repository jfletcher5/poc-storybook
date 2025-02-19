import '/flutter_flow/flutter_flow_util.dart';
import 'image_results_widget.dart' show ImageResultsWidget;
import 'package:flutter/material.dart';

class ImageResultsModel extends FlutterFlowModel<ImageResultsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
