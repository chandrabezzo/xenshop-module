import 'dart:convert';

import 'package:dio/dio.dart';

///
/// [NetworkError] is extension for [DioError]
/// method [toJson] is used for convert error response to JSON format
///
extension NetworkError on DioError {
  Map<String, dynamic> toJson() {
    if (response?.data is Map<String, dynamic>) {
      return response?.data;
    } else {
      if (response?.data is Map) {
        return json.decode(json.encode(response?.data));
      } else {
        final contentJson = <String, dynamic>{};
          contentJson['status'] = response?.statusCode;
          contentJson['code'] = 0;
          contentJson['message'] = response?.statusMessage;

          return json.decode(json.encode(contentJson));
      }
    }
  }

  bool isUnauthorized() => response?.statusCode == 401;

  bool isForbidden() => response?.statusCode == 403;

  bool isServerProblem() => response?.statusCode == 500;

  bool isBadRequest() => response?.statusCode == 400;

  bool isNotFound() => response?.statusCode == 404;
}