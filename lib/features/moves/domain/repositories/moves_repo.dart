import 'package:dartz/dartz.dart';
import 'package:moves_app/features/moves/domain/move_entity.dart';

import '../../../../shared/networking/failures.dart';
import '../../../details/domain/cast_entity.dart';
import '../move_details_entity.dart';

abstract class MovesRepository {
  Future<Either<NetworkException, List<MovieEntity>>> getNowPlaying();

  Future<Either<NetworkException, MoveDetailsEntity>> getMovieDetail(String movieId);
  Future<Either<NetworkException, List<CastEntity>>> getMovieCast(String movieId);
}
