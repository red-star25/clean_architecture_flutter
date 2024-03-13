import 'package:clean_architecture_bloc/core/constants/constants.dart';
import 'package:clean_architecture_bloc/core/errors/exceptions.dart';
import 'package:clean_architecture_bloc/core/local/hive_helper.dart';
import 'package:clean_architecture_bloc/features/news/data/models/news_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class NewsLocalDataSource {
  Future<void> cacheArticles({required List<ArticleModel>? articles});
  Future<List<ArticleModel>?> getNews();
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  @override
  Future<List<ArticleModel>?> getNews() async {
    final newsData = HiveHelper.getNewsBox().get(kNewsBox);

    if (newsData != null) {
      final List<ArticleModel> newsList = [];
      for (ArticleModel item in newsData) {
        newsList.add(ArticleModel.fromJson(item.toJson()));
      }
      return newsList;
    }

    return null;
  }

  @override
  Future<void> cacheArticles({required List<ArticleModel>? articles}) async {
    try {
      await HiveHelper.getNewsBox().put(
        kNewsBox,
        articles,
      );
    } on HiveError {
      throw CacheException();
    }
  }
}
