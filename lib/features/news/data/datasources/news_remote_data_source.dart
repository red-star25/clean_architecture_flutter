import 'package:clean_architecture_bloc/core/network/endpoints/endpoints.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/client/dio_client.dart';
import '../../../../di/service_locator.dart';

abstract class NewsRemoteDataSource {
  Future<Response> getNews();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final _dioClient = getIt.get<DioClient>();

  @override
  Future<Response> getNews() async {
    try {
      final newsResponse = await _dioClient.get(Endpoints.newsBaseURL);
      return newsResponse;
    } on DioException {
      rethrow;
    }
  }
}
