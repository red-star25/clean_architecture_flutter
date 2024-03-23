import 'package:clean_architecture_bloc/core/network/client/dio_client.dart';
import 'package:clean_architecture_bloc/core/network/endpoints/endpoints.dart';
import 'package:clean_architecture_bloc/di/service_locator.dart';
import 'package:dio/dio.dart';

abstract class CounterRemoteDataSource {
  Future<Response> getCounterInfo({required int count});
}

class CounterRemoteDataSourceImpl implements CounterRemoteDataSource {
  final _dioClient = getIt.get<DioClient>();

  @override
  Future<Response> getCounterInfo({required int count}) async {
    try {
      final response =
          await _dioClient.get('${Endpoints.counterBaseURL}/$count');
      return response;
    } on DioException {
      rethrow;
    }
  }
}
