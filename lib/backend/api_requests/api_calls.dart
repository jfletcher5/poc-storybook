import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start FastAPI Group Code

class FastAPIGroup {
  static String baseUrl = '';
  static Map<String, String> headers = {};
  static GenerateGenerateImagePostCall generateGenerateImagePostCall =
      GenerateGenerateImagePostCall();
}

class GenerateGenerateImagePostCall {
  Future<ApiCallResponse> call({
    String? prompt = '\"picture of bitcoins growing in the forest\"',
    String? model = '\"dall-e2\"',
    String? size = '\"1024x1024\"',
    String? quality = '\"standard\"',
  }) async {
    final ffApiRequestBody = '''
{
  "prompt": "$prompt",
  "model": "$model",
  "size": "$size",
  "quality": "$quality"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generate_generate_image__post',
      apiUrl: '${FastAPIGroup.baseUrl}/generate_image/',
      callType: ApiCallType.POST,
      headers: {},
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

/// End FastAPI Group Code

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
