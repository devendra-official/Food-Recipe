import 'package:food_receipe/features/food_receipe/data/repository/data_repository.dart';
import 'package:food_receipe/features/food_receipe/data/resource/data_resource.dart';
import 'package:food_receipe/features/food_receipe/domain/repository/domain_repository.dart';
import 'package:food_receipe/features/food_receipe/domain/usecase/receipe_usecase.dart';
import 'package:food_receipe/features/food_receipe/presentation/cubit/receipe_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt serviceLocator = GetIt.instance;

void initDependency() {
  serviceLocator.registerFactory(() => http.Client());
  serviceLocator.registerFactory<DataResourceReceipe>(
      () => DataResourceReceipeImp(serviceLocator()));
  serviceLocator.registerFactory<DomainReceipeRepository>(
      () => DataRepositoryImp(serviceLocator()));
  serviceLocator.registerFactory(() => ReceipeUsecase(serviceLocator()));
  serviceLocator.registerLazySingleton(() => ReceipeCubit(serviceLocator()));
}
