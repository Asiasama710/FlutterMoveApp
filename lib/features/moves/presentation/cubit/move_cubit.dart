import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_app/features/moves/domain/move_entity.dart';
import 'package:moves_app/features/moves/domain/repositories/moves_repo.dart';

import '../../../../shared/bases/base_state.dart';
import '../../../../shared/navigator_helper.dart';
import '../../../../shared/networking/failures.dart';

class MoveCubit extends Cubit<BaseState> {
  final MovesRepository _movesRepository;

  MoveCubit(this._movesRepository) : super(const InitState());

  static MoveCubit get instance => BlocProvider.of(NavigatorHelper.context);

  List<MovieEntity> moves = [];

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
}
