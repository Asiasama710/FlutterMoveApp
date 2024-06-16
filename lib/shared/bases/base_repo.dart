import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../networking/failures.dart';

abstract class BaseRepository {
  final Dio dio;

  BaseRepository(this.dio);

Future<Either<NetworkException, T>> tryToExecute<T>(
      Future<Response> Function() call,
      Function(dynamic) mapper)
  async {
    try {
      var response = await call();
      T mappedResponse = mapper(response.data);
      return right<NetworkException, T>(mappedResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return left(BadRequest(e.response?.data['Message'] ?? ''));
      } else if (e.response?.statusCode == 401) {
        return left(UnAuthorizedFailure('Unauthorized'));
      } else if (e.response?.statusCode == 403) {
        return left(AccessDeniedException(
            e.response?.data['Message'] ?? 'Access Denied '));
      } else if (e.response?.statusCode == 404) {
        return left(NotFoundException('Not Found'));
      } else if (e.response?.statusCode == 500) {
        return left(InternalServerError('Internal Server Error'));
      } else {
        return left(UnknownErrorException('Unknown Error'));
      }
    }
  }
}
