import 'package:clean_architecture_bloc/core/errors/failure.dart';
import 'package:clean_architecture_bloc/features/counter/domain/entities/counter_entity.dart';
import 'package:clean_architecture_bloc/features/counter/domain/repositories/counter_repository.dart';
import 'package:dartz/dartz.dart';

class GetCountInfo {
  final CounterInfoRepository counterRepository;

  GetCountInfo({required this.counterRepository});

  Future<Either<Failure, CounterEntity>> call({required int count}) async {
    return await counterRepository.getCountInfo(count: count);
  }
}
