import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'create_image_model.dart';
export 'create_image_model.dart';

class CreateImageWidget extends StatefulWidget {
  const CreateImageWidget({
    super.key,
    String? model,
    String? prompt,
    String? quality,
    String? size,
  })  : model = model ?? 'dall-e-2',
        prompt = prompt ?? 'nothing entered',
        quality = quality ?? 'standard',
        size = size ?? '1024x1024';

  final String model;
  final String prompt;
  final String quality;
  final String size;

  @override
  State<CreateImageWidget> createState() => _CreateImageWidgetState();
}

class _CreateImageWidgetState extends State<CreateImageWidget> {
  late CreateImageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateImageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'createImage'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                child: Text(
                  'Input a Prompt',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 20.0, 5.0, 5.0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        const Duration(milliseconds: 2000),
                        () async {
                          logFirebaseEvent(
                              'CREATE_IMAGE_TextField_c2h07u2a_ON_TEXTF');
                          logFirebaseEvent('TextField_update_app_state');
                          FFAppState().prompt = _model.textController.text;
                          setState(() {});
                        },
                      ),
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Something funny or clever...',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: _model.textController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.textController?.clear();
                                  logFirebaseEvent(
                                      'CREATE_IMAGE_TextField_c2h07u2a_ON_TEXTF');
                                  logFirebaseEvent(
                                      'TextField_update_app_state');
                                  FFAppState().prompt =
                                      _model.textController.text;
                                  setState(() {});
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.clear,
                                  size: 20.0,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            letterSpacing: 0.0,
                          ),
                      maxLines: 5,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 20.0, 5.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              decoration: const BoxDecoration(),
                              child: Text(
                                'Model:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: FlutterFlowRadioButton(
                              options: ['dall-e-2', 'dall-e-3'].toList(),
                              onChanged: (val) async {
                                setState(() {});
                                logFirebaseEvent(
                                    'CREATE_IMAGE_RadioButtonModel_ON_FORM_WI');
                                logFirebaseEvent(
                                    'RadioButtonModel_update_app_state');
                                FFAppState().model =
                                    _model.radioButtonModelValue!;
                                setState(() {});
                              },
                              controller:
                                  _model.radioButtonModelValueController ??=
                                      FormFieldController<String>(null),
                              optionHeight: 32.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                              selectedTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                              textPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.vertical,
                              radioButtonColor:
                                  FlutterFlowTheme.of(context).primary,
                              inactiveRadioButtonColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              toggleable: false,
                              horizontalAlignment: WrapAlignment.start,
                              verticalAlignment: WrapCrossAlignment.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 20.0, 5.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Text(
                                'Quality:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: FlutterFlowRadioButton(
                              options: ['standard', 'hd'].toList(),
                              onChanged: (val) async {
                                setState(() {});
                                logFirebaseEvent(
                                    'CREATE_IMAGE_RadioButtonQuality_ON_FORM_');
                                logFirebaseEvent(
                                    'RadioButtonQuality_update_app_state');
                                FFAppState().quality =
                                    _model.radioButtonQualityValue!;
                                setState(() {});
                              },
                              controller:
                                  _model.radioButtonQualityValueController ??=
                                      FormFieldController<String>(null),
                              optionHeight: 32.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                              selectedTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.vertical,
                              radioButtonColor:
                                  FlutterFlowTheme.of(context).primary,
                              inactiveRadioButtonColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              toggleable: false,
                              horizontalAlignment: WrapAlignment.start,
                              verticalAlignment: WrapCrossAlignment.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 20.0, 5.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Text(
                                'Resolution:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: FlutterFlowRadioButton(
                              options: ['1024x1024', '1024x1792'].toList(),
                              onChanged: (val) async {
                                setState(() {});
                                logFirebaseEvent(
                                    'CREATE_IMAGE_RadioButtonResolution_ON_FO');
                                logFirebaseEvent(
                                    'RadioButtonResolution_update_app_state');
                                FFAppState().size =
                                    _model.radioButtonResolutionValue!;
                                setState(() {});
                              },
                              controller: _model
                                      .radioButtonResolutionValueController ??=
                                  FormFieldController<String>(null),
                              optionHeight: 32.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                              selectedTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.vertical,
                              radioButtonColor:
                                  FlutterFlowTheme.of(context).primary,
                              inactiveRadioButtonColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              toggleable: false,
                              horizontalAlignment: WrapAlignment.start,
                              verticalAlignment: WrapCrossAlignment.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'CREATE_IMAGE_GENERATE_IMAGE_BTN_ON_TAP');
                        logFirebaseEvent('Button_backend_call');

                        var imageRequestsRecordReference =
                            ImageRequestsRecord.collection.doc();
                        await imageRequestsRecordReference
                            .set(createImageRequestsRecordData(
                          userid: currentUserUid,
                          requestPrompt: FFAppState().prompt,
                          requestJSON: '',
                        ));
                        _model.outputdocID =
                            ImageRequestsRecord.getDocumentFromData(
                                createImageRequestsRecordData(
                                  userid: currentUserUid,
                                  requestPrompt: FFAppState().prompt,
                                  requestJSON: '',
                                ),
                                imageRequestsRecordReference);
                        logFirebaseEvent('Button_backend_call');
                        _model.imageResult =
                            await CoreServicesGroup.generateCall.call();
                        if ((_model.imageResult?.succeeded ?? true)) {
                          logFirebaseEvent('Button_backend_call');

                          await _model.outputdocID!.reference
                              .update(createImageRequestsRecordData(
                            responseURL: getJsonField(
                              (_model.imageResult?.jsonBody ?? ''),
                              r'''$.result''',
                            ).toString(),
                          ));
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('ImageResults');
                        } else {
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('ImageResults');
                        }

                        setState(() {});
                      },
                      text: 'Generate Image',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
