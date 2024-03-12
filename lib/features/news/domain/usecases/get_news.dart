import 'package:clean_architecture_bloc/core/errors/failure.dart';
import 'package:clean_architecture_bloc/features/news/domain/entities/news_entity.dart';
import 'package:clean_architecture_bloc/features/news/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';

class GetNews {
  final NewsRepository newsRepository;

  GetNews({required this.newsRepository});

  Future<Either<Failure, NewsEntity>> call() async {
    return await newsRepository.getNews();
  }
}
