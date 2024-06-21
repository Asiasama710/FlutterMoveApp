import 'dart:io' show Platform;

import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  static const String _api_key = 'Your_API_KEY';
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["Authorization"] = "Bearer $_api_key";
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        err.requestOptions.headers["Authorization"] != null) {
      // Handle the error here, for example, by logging out the user
    }
    handler.next(err);
  }
}


