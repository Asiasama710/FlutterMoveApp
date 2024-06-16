import 'package:dartz/dartz.dart';
import 'package:moves_app/features/moves/domain/move_entity.dart';

import '../../../../shared/networking/failures.dart';
import '../../data/BaseResponse.dart';

abstract class MovesRepository {
  Future<Either<NetworkException, List<MovieEntity>>> getNowPlaying();
  // Future<Either<NetworkException, BaseResponse<List<MovieEntity>>>> getNoPlaying();
}
