import 'package:clean_architecture_bloc/core/network/endpoints/endpoints.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/client/dio_client.dart';
import '../../../../di/service_locator.dart';
import '../models/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<NewsModel> getNews();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final _dioClient = getIt.get<DioClient>();

  @override
  Future<NewsModel> getNews() async {
    try {
      final newsResponse = await _dioClient.get(Endpoints.newsBaseURL);
      return NewsModel.fromJson(newsResponse.data);
    } on DioException {
      rethrow;
    }
  }
}
