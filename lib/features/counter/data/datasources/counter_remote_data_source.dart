import 'package:clean_architecture_bloc/core/network/client/dio_client.dart';
import 'package:clean_architecture_bloc/core/network/endpoints/endpoints.dart';
import 'package:clean_architecture_bloc/di/service_locator.dart';
import 'package:dio/dio.dart';

import '../models/counter_info_model.dart';

abstract class CounterRemoteDataSource {
  Future<CounterModel> getCounterInfo({required int count});
}

class CounterRemoteDataSourceImpl implements CounterRemoteDataSource {
  final _dioClient = getIt.get<DioClient>();

  @override
  Future<CounterModel> getCounterInfo({required int count}) async {
    try {
      final response =
          await _dioClient.get('${Endpoints.counterBaseURL}/$count');
      return CounterModel.fromJson(json: response.data);
    } on DioException {
      rethrow;
    }
  }
}
