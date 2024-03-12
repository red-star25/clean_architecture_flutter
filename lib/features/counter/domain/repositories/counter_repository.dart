import 'package:clean_architecture_bloc/core/errors/failure.dart';
import 'package:clean_architecture_bloc/features/counter/domain/entities/counter_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CounterInfoRepository {
  Future<Either<Failure, CounterEntity>> getCountInfo({required int count});
}
