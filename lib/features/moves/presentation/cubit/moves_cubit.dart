import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_app/features/moves/domain/repositories/moves_repo.dart';

import '../../../../shared/bases/base_state.dart';
import '../../../../shared/navigator_helper.dart';
import '../../../../shared/networking/failures.dart';
import '../../domain/model/move_details_entity.dart';
import '../../domain/model/move_entity.dart';

class MovesCubit extends Cubit<BaseState> {
  final MovesRepository _movesRepository;

  MovesCubit(this._movesRepository) : super(const InitState());

  static MovesCubit get instance => BlocProvider.of(NavigatorHelper.context);

  List<MovieEntity> moves = [];
  MoveDetailsEntity move = MoveDetailsEntity();

  String errorMessage = '';

  getMoves() async {
    emit(const LoadingState());

    Either<NetworkException, List<MovieEntity>> result =
        await _movesRepository.getNowPlaying();
    result.fold((NetworkException e) {
      errorMessage = e.message;
      emit(ErrorState(msg: e.message));
    }, (List<MovieEntity> value) {
      moves = value;
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
