import 'package:clean_architecture_bloc/core/errors/failure.dart';
import 'package:clean_architecture_bloc/core/network/client/dio_exception.dart';
import 'package:clean_architecture_bloc/features/news/data/models/news_model.dart';
import 'package:clean_architecture_bloc/features/news/domain/entities/news_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../di/service_locator.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  final networkInfo = getIt.get<NetworkInfo>();

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, NewsEntity>> getNews() async {
    if (await networkInfo.isConnected!) {
      try {
        NewsModel remoteNews = await remoteDataSource.getNews();
        return Right(remoteNews);
      } on DioException catch (e) {
        final errorMessage = DioExceptions.fromDioError(e);
        return Left(ServerFailure(errorMessage: errorMessage.message));
      }
    }
    return Left(NetWorkFailure(errorMessage: 'Please connect internet'));
  }
}
