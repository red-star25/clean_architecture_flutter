import 'package:clean_architecture_bloc/core/base/base.dart';
import 'package:clean_architecture_bloc/features/news/domain/entities/news_entity.dart';

class NewsSuccess extends BaseState {
  final NewsEntity newsEntity;

  NewsSuccess({required this.newsEntity});

  @override
  List<Object?> get props => [newsEntity];
}

class NewsError extends BaseState {
  final String message;

  NewsError({required this.message});

  @override
  List<Object?> get props => [message];
}
