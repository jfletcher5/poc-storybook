import '/flutter_flow/flutter_flow_util.dart';
import 'game_selection_widget.dart' show GameSelectionWidget;
import 'package:flutter/material.dart';

class GameSelectionModel extends FlutterFlowModel<GameSelectionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
