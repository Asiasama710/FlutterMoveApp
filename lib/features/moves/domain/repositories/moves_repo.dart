import 'package:dartz/dartz.dart';

import '../../../../shared/networking/failures.dart';
import '../model/cast_entity.dart';
import '../model/move_details_entity.dart';
import '../model/move_entity.dart';

abstract class MovesRepository {
  Future<Either<NetworkException, List<MovieEntity>>> getNowPlaying();

  Future<Either<NetworkException, MoveDetailsEntity>> getMovieDetail(String movieId);
  Future<Either<NetworkException, List<CastEntity>>> getMovieCast(String movieId);
}
