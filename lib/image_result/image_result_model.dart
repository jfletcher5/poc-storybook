import '/flutter_flow/flutter_flow_util.dart';
import 'image_result_widget.dart' show ImageResultWidget;
import 'package:flutter/material.dart';

class ImageResultModel extends FlutterFlowModel<ImageResultWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
