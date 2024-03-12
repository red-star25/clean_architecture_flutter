import 'package:clean_architecture_bloc/core/base/base_state.dart';
import 'package:clean_architecture_bloc/features/counter/domain/entities/counter_entity.dart';

class CounterInfoSucess extends BaseState {
  final CounterEntity counterEntity;

  CounterInfoSucess({
    required this.counterEntity,
  });

  @override
  List<Object?> get props => [counterEntity];
}

class CounterInfoError extends BaseState {
  final String message;

  CounterInfoError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
