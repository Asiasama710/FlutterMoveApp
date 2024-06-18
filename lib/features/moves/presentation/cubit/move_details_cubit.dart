import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_app/features/moves/domain/repositories/moves_repo.dart';

import '../../../../shared/bases/base_state.dart';
import '../../../../shared/navigator_helper.dart';
import '../../../../shared/networking/failures.dart';
import '../../../details/domain/cast_entity.dart';
import '../../domain/move_details_entity.dart';

class MoveDetailsCubit extends Cubit<BaseState> {
  final MovesRepository _movesRepository;

  MoveDetailsCubit(this._movesRepository) : super(const InitState());

  static MoveDetailsCubit get instance =>
      BlocProvider.of(NavigatorHelper.context);

  MoveDetailsEntity move = MoveDetailsEntity();

  String errorMessage = '';

  List<CastEntity> cast = [];

  getCast(String moveId) async {
    emit(const LoadingState());
    Either<NetworkException, List<CastEntity>> result =
        await _movesRepository.getMovieCast(moveId);
    result.fold((NetworkException e) {
      errorMessage = e.message;
      emit(ErrorState(msg: e.message));
    }, (List<CastEntity> value) {
      cast = value;
      emit(const DoneState());
    });
  }

  getMoveDetails(String moveId) async {
    emit(const LoadingState());
    Either<NetworkException, MoveDetailsEntity> result =
        await _movesRepository.getMovieDetail(moveId);
    result.fold((NetworkException e) {
      errorMessage = e.message;
      emit(ErrorState(msg: e.message));
    }, (MoveDetailsEntity value) {
      move = value;
      emit(const DoneState());
    });
  }
}
