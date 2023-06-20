import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_assignment_effective/app/main/main_cubit.dart';
import 'package:test_assignment_effective/app/main/pages/bag_cubit/bag_cubit.dart';
import 'package:test_assignment_effective/app/main/pages/home/category/dishes_category_cubit.dart';
import 'package:test_assignment_effective/app/main/pages/home/home_page_cubit.dart';
import 'package:test_assignment_effective/data/repository_impl.dart';
import 'package:test_assignment_effective/domain/repository.dart';

final GetIt getIt = GetIt.instance;

void setupInjection() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<Repository>(() => RepositoryImpl(getIt<Dio>()));

  getIt.registerLazySingleton<MainCubit>(() => MainCubit());

  getIt.registerLazySingleton<HomePageCubit>(() => HomePageCubit(getIt<Repository>()));

  getIt.registerFactory<DishesCategoryCubit>(() => DishesCategoryCubit(getIt<Repository>()));

  getIt.registerLazySingleton<BagCubit>(() => BagCubit());
}
