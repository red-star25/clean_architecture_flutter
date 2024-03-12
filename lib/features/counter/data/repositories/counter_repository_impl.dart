import 'package:clean_architecture_bloc/core/connection/network_info.dart';
import 'package:clean_architecture_bloc/core/errors/exceptions.dart';
import 'package:clean_architecture_bloc/core/errors/failure.dart';
import 'package:clean_architecture_bloc/core/network/client/dio_exception.dart';
import 'package:clean_architecture_bloc/di/service_locator.dart';
import 'package:clean_architecture_bloc/features/counter/data/datasources/counter_local_data_source.dart';
import 'package:clean_architecture_bloc/features/counter/data/datasources/counter_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/counter/data/models/counter_info_model.dart';
import 'package:clean_architecture_bloc/features/counter/domain/repositories/counter_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CounterRepositoryImpl implements CounterInfoRepository {
  final CounterRemoteDataSource remoteDataSource;
  final CounterLocalDataSource localDataSource;

  final networkInfo = getIt.get<NetworkInfo>();

  CounterRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, CounterModel>> getCountInfo(
      {required int count}) async {
    if (await networkInfo.isConnected!) {
      try {
        CounterModel remoteCounterInfo =
            await remoteDataSource.getCounterInfo(count: count);

        await localDataSource.cacheCountInfo(counterToCache: remoteCounterInfo);

        return Right(remoteCounterInfo);
      } on DioException catch (e) {
        final errorMessage = DioExceptions.fromDioError(e);
        return Left(ServerFailure(errorMessage: errorMessage.message));
      }
    } else {
      try {
        CounterModel localCounter = await localDataSource.getCountInfo();
        return Right(localCounter);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'This is a cache exception'));
      }
    }
  }
}
