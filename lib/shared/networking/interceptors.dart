import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  static const apiKey = String.fromEnvironment('API_KEY');

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["Authorization"] = "Bearer $apiKey";
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

class AppConfig {
  final String? BASE_API_URL;
  final String? BASE_IMAGE_API_URL;
  final String? API_KEY;

  AppConfig({this.BASE_API_URL, this.BASE_IMAGE_API_URL, this.API_KEY});
}
