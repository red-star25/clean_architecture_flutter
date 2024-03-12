import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String? status;
  final int? totalResults;
  final List<ArticlesEntity>? articles;

  const NewsEntity({this.status, this.totalResults, this.articles});

  @override
  List<Object?> get props => [status, totalResults, articles];
}

class ArticlesEntity extends Equatable {
  final SourceEntity? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
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
  final String? id;
  final String? name;

  const SourceEntity({this.id, this.name});

  @override
  List<Object?> get props => [id, name];
}
