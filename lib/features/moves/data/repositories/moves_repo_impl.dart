import 'package:dartz/dartz.dart';
import 'package:moves_app/features/moves/data/BaseResponse.dart';
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
        () => dio.get('${EndPoints.nowPlaying}'),
        (data) => BaseResponse().fromJson(data).results?.map((e) => e.toEntity()).toList());
  }

}
