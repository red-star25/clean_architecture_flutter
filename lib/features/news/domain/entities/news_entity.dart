import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NewsEntity extends Equatable {
  @HiveField(0)
  final String? status;
  @HiveField(1)
  final int? totalResults;
  @HiveField(2)
  final List<ArticlesEntity>? articles;

  const NewsEntity({this.status, this.totalResults, this.articles});

  @override
  List<Object?> get props => [status, totalResults, articles];
}

class ArticlesEntity extends Equatable {
  @HiveField(1)
  final SourceEntity? source;
  @HiveField(2)
  final String? author;
  @HiveField(3)
  final String? title;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final String? url;
  @HiveField(6)
  final String? urlToImage;
  @HiveField(7)
  final String? publishedAt;
  @HiveField(8)
  final String? content;

  const ArticlesEntity(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];
}

class SourceEntity extends Equatable {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;

  const SourceEntity({this.id, this.name});

  @override
  List<Object?> get props => [id, name];
}
