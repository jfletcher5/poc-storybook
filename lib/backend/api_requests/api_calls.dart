import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start FastAPI w image Gen and Credits Group Code

class FastAPIWImageGenAndCreditsGroup {
  static String baseUrl = 'https://poised-legend-421313.ue.r.appspot.com';
  static Map<String, String> headers = {
    'accept': 'application/json',
  };
  static GenerateCall generateCall = GenerateCall();
  static GenerateTextFromImageGenerateTextFromImagePostCall
      generateTextFromImageGenerateTextFromImagePostCall =
      GenerateTextFromImageGenerateTextFromImagePostCall();
  static GetCreditsCall getCreditsCall = GetCreditsCall();
  static UpdateCreditsCall updateCreditsCall = UpdateCreditsCall();
}

class GenerateCall {
  Future<ApiCallResponse> call({
    String? model = 'dall-e-2',
    String? prompt = '',
    String? size = '1024x1024',
    String? quality = 'standard',
  }) async {
    final ffApiRequestBody = '''
{
  "prompt": "$prompt",
  "model":"$model",
  "size": "$size",
  "quality": "$quality"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generate',
      apiUrl: '${FastAPIWImageGenAndCreditsGroup.baseUrl}/generate_image/',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateTextFromImageGenerateTextFromImagePostCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'generate_text_from_image_generate_text_from_image__post',
      apiUrl:
          '${FastAPIWImageGenAndCreditsGroup.baseUrl}/generate_text_from_image/',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCreditsCall {
  Future<ApiCallResponse> call({
    String? userid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Credits',
      apiUrl: '${FastAPIWImageGenAndCreditsGroup.baseUrl}/credits_remaining/',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
      },
      params: {
        'userid': userid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateCreditsCall {
  Future<ApiCallResponse> call({
    String? userid = '3lb50M0hNGSQDpRzSMOx4ygwDes1',
    int? credits = 103,
  }) async {
    final ffApiRequestBody = '''
{"userid": "$userid",
"credits": $credits}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Credits',
      apiUrl: '${FastAPIWImageGenAndCreditsGroup.baseUrl}/credits_update/',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End FastAPI w image Gen and Credits Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
