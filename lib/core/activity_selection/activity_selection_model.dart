import '/flutter_flow/flutter_flow_util.dart';
import 'activity_selection_widget.dart' show ActivitySelectionWidget;
import 'package:flutter/material.dart';

class ActivitySelectionModel extends FlutterFlowModel<ActivitySelectionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
