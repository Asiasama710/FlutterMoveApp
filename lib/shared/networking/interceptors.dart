import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  static const String _token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzU0NmQ4ZGEzOWEwZDM4MTRiYTk2MjgxYWE1Yzc4MiIsInN1YiI6IjY2NmRiNGI4ZTA4NDdmMDE1MmUxOTNkZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EJoYkNQfi7JnV2ASMSEc-FgywiaqbTIazqiu0HBAc6M";

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["Authorization"] = "Bearer $_token";
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
