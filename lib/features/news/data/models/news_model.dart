import 'package:clean_architecture_bloc/features/news/domain/entities/news_entity.dart';
import 'package:hive/hive.dart';

part 'news_model.g.dart';

@HiveType(typeId: 1)
class NewsModel extends NewsEntity {
  const NewsModel({
    required super.status,
    required super.totalResults,
    required super.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: (json['articles'] as List)
          .map((e) => ArticleModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles':
          articles?.cast<ArticleModel>().map((e) => e.toJson()).toList(),
    };
  }
}

@HiveType(typeId: 2)
class ArticleModel extends ArticlesEntity {
  const ArticleModel({
    required super.source,
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source:
          json['source'] != null ? SourceModel.fromJson(json['source']) : null,
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': (source as SourceModel).toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}

@HiveType(typeId: 3)
class SourceModel extends SourceEntity {
  const SourceModel({
    required super.id,
    required super.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
