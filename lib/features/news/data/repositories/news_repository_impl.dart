import 'package:clean_architecture_bloc/core/errors/exceptions.dart';
import 'package:clean_architecture_bloc/core/errors/failure.dart';
import 'package:clean_architecture_bloc/core/network/client/dio_exception.dart';
import 'package:clean_architecture_bloc/features/news/data/datasources/news_local_data_source.dart';
import 'package:clean_architecture_bloc/features/news/data/models/news_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../di/service_locator.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;

  final networkInfo = getIt.get<NetworkInfo>();

  NewsRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, NewsModel>> getNews() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteNews = await remoteDataSource.getNews();
        final newsModel = NewsModel.fromJson(remoteNews.data);

        await localDataSource.cacheArticles(
          articles: newsModel.articles?.cast<ArticleModel>(),
        );
        return Right(newsModel);
      } on DioException catch (e) {
        final errorMessage = DioExceptions.fromDioError(e);
        return Left(ServerFailure(errorMessage: errorMessage.message));
      }
    } else {
      try {
        final localNews = await localDataSource.getNews();
        if (localNews != null) {
          return Right(
            NewsModel(
              status: '200',
              totalResults: localNews.length,
              articles: localNews,
            ),
          );
        } else {
          throw CacheException();
        }
      } on HiveError catch (_) {
        return Left(HiveFailure(errorMessage: _.message));
      } on CacheException catch (_) {
        return Left(CacheFailure(errorMessage: 'No News Found'));
      }
    }
  }
}
