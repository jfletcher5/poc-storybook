import '/flutter_flow/flutter_flow_util.dart';
import 'view_storybook_widget.dart' show ViewStorybookWidget;
import 'package:flutter/material.dart';

class ViewStorybookModel extends FlutterFlowModel<ViewStorybookWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
