import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/entrepreneur/data/repositories/entrepreneur_repository_impl.dart';
import '../../features/entrepreneur/domain/repositories/entrepreneur_repository.dart';
import '../../features/entrepreneur/presentation/cubit/entrepreneur_cubit.dart';
import '../../features/entrepreneur/presentation/cubit/email_cubit.dart';
import 'core/network/api.dart';

final sl = GetIt.instance;

void setupLocator() {
  // ApiClient
  sl.registerLazySingleton<IeCheckerApiClient>(
          () => IeCheckerApiClient(Dio(), baseUrl: 'https://ws.agroprombank.com/proxy/External.MinfinProxy/'));

  // Репозитории
  sl.registerLazySingleton<EntrepreneurRepository>(
          () => EntrepreneurRepositoryImpl(sl<IeCheckerApiClient>()));

  // Cubit
  sl.registerFactory(() => EntrepreneurCubit(sl<EntrepreneurRepository>()));
  sl.registerFactory(() => EmailCubit(sl<EntrepreneurRepository>()));
}
