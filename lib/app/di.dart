import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:moves_app/features/moves/data/repositories/moves_repo_impl.dart';
import 'package:moves_app/features/moves/domain/repositories/moves_repo.dart';


import '../features/moves/presentation/cubit/move_details_cubit.dart';
import '../features/moves/presentation/cubit/moves_cubit.dart';
import '../shared/networking/dio.dart';
import '../shared/networking/interceptors.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {

  // NETWORK
  getIt.registerSingleton<AuthInterceptor>(AuthInterceptor());
  getIt.registerSingleton<Dio>(initDio(getIt<AuthInterceptor>()));

  // REPOSITORIES
  getIt.registerSingleton<MovesRepository>(MovesRepositoryImpl(getIt<Dio>(),));

  // CUBITS
  getIt.registerFactory<MovesCubit>(() => MovesCubit(getIt()));
  getIt.registerFactory<MoveDetailsCubit>(() => MoveDetailsCubit(getIt()));

}
