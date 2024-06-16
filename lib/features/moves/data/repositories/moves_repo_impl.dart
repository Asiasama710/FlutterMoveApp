import 'package:dartz/dartz.dart';
import 'package:moves_app/features/moves/data/move_details_dto.dart';
import 'package:moves_app/features/moves/domain/move_details_entity.dart';
import 'package:moves_app/features/moves/domain/move_entity.dart';

import '../../../../../../shared/configs/endpoints.dart';
import '../../../../../../shared/networking/failures.dart';
import '../../../../../shared/bases/base_repo.dart';
import '../../domain/repositories/moves_repo.dart';
import '../move_dto.dart';

class MovesRepositoryImpl extends BaseRepository implements MovesRepository {
  MovesRepositoryImpl(super.dio);

  @override
  Future<Either<NetworkException, List<MovieEntity>>> getNowPlaying() async {
    return await tryToExecute<List<MovieEntity>>(
            () => dio.get(EndPoints.nowPlaying),
            (data) {
          var results = data['results'];
          if (results is List) {
            var movieDtoList = results.map((e) => MovieDto().fromJson(e)).toList();
            return movieDtoList.map((e) => e.toEntity()).toList();
          }
        }
    );
  }

  @override
  Future<Either<NetworkException, MoveDetailsEntity>> getMovieDetail(String movieId) async {
    return await tryToExecute<MoveDetailsEntity>(
            () => dio.get(EndPoints.moveDetails(movieId)),
            (data) => MoveDetailsDto().fromJson(data).toEntity());
  }

}
