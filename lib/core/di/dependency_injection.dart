import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sweetsstore/core/network/dio_consumer.dart';
import 'package:sweetsstore/core/utils/network_info.dart';
import 'package:sweetsstore/features/home/data/repositories/home_repository_impl.dart';
import 'package:sweetsstore/features/home/presentation/cubit/home_cubit.dart';

// sl => Service Locator
final sl = GetIt.instance;

void setupDependencyInjection() {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<DioConsumer>(DioConsumer(dio: sl()));
  sl.registerSingleton(DataConnectionChecker());
  sl.registerSingleton<NetworkInfoImpl>(NetworkInfoImpl(sl()));

  sl.registerSingleton<HomeRepositoryImpl>(HomeRepositoryImpl(dioConsumer: sl(), networkInfo: sl()));
  sl.registerSingleton<HomeCubit>(HomeCubit(homeRepositoryImpl: sl()));
}
