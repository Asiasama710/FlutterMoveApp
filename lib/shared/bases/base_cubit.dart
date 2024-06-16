import 'package:flutter_bloc/flutter_bloc.dart';

import '../networking/failures.dart';
import 'base_state.dart';

abstract class BaseCubit extends Cubit<BaseState> {
  BaseCubit(super.state);

  void handleException(NetworkException exception) {
    emit(ErrorState(msg: exception.message));
  }
}
