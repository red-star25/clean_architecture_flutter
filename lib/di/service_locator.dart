import 'package:clean_architecture_bloc/core/connection/network_info.dart';
import 'package:clean_architecture_bloc/core/shared_pref/helper.dart';
import 'package:clean_architecture_bloc/core/shared_pref/preference.dart';
import 'package:clean_architecture_bloc/features/counter/data/datasources/counter_local_data_source.dart';
import 'package:clean_architecture_bloc/features/counter/data/datasources/counter_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/counter/data/repositories/counter_repository_impl.dart';
import 'package:clean_architecture_bloc/features/counter/domain/usecases/get_count_info.dart';
import 'package:clean_architecture_bloc/features/news/data/datasources/news_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/news/data/repositories/news_repository_impl.dart';
import 'package:clean_architecture_bloc/features/news/domain/usecases/get_news.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/network/client/dio_client.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));
  getIt.registerLazySingleton<Preference>(() => Preference());
  await Preference.load();
  getIt.registerLazySingleton<SharedPreferenceHelper>(
      () => SharedPreferenceHelper());

  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));

  // ----------- Counter -----------
  getIt.registerSingleton<CounterRepositoryImpl>(CounterRepositoryImpl(
    localDataSource: CounterLocalDataSourceImpl(),
    remoteDataSource: CounterRemoteDataSourceImpl(),
  ));
  getIt.registerSingleton<GetCountInfo>(
      GetCountInfo(counterRepository: getIt.get<CounterRepositoryImpl>()));

  // ----------- News -----------
  getIt.registerSingleton<NewsRepositoryImpl>(NewsRepositoryImpl(
    remoteDataSource: NewsRemoteDataSourceImpl(),
  ));
  getIt.registerSingleton<GetNews>(
      GetNews(newsRepository: getIt.get<NewsRepositoryImpl>()));
}
