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
  static GenerateGenerateImagePostCall generateGenerateImagePostCall =
      GenerateGenerateImagePostCall();
  static GenerateTextFromImageGenerateTextFromImagePostCall
      generateTextFromImageGenerateTextFromImagePostCall =
      GenerateTextFromImageGenerateTextFromImagePostCall();
  static GetCreditsCreditsRemainingGetCall getCreditsCreditsRemainingGetCall =
      GetCreditsCreditsRemainingGetCall();
  static UpdateCreditsCreditsUpdatePostCall updateCreditsCreditsUpdatePostCall =
      UpdateCreditsCreditsUpdatePostCall();
}

class GenerateGenerateImagePostCall {
  Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "prompt": "",
  "model": "",
  "size": "",
  "quality": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generate_generate_image__post',
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

class GetCreditsCreditsRemainingGetCall {
  Future<ApiCallResponse> call({
    String? userid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get_credits_credits_remaining__get',
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

class UpdateCreditsCreditsUpdatePostCall {
  Future<ApiCallResponse> call({
    String? userid = '3lb50M0hNGSQDpRzSMOx4ygwDes1',
    int? credits = 103,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'update_credits_credits_update__post',
      apiUrl: '${FastAPIWImageGenAndCreditsGroup.baseUrl}/credits_update/',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
      },
      params: {
        'userid': userid,
        'credits': credits,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
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
