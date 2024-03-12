import 'package:clean_architecture_bloc/core/errors/failure.dart';
import 'package:clean_architecture_bloc/features/news/domain/entities/news_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository {
  Future<Either<Failure, NewsEntity>> getNews();
}
