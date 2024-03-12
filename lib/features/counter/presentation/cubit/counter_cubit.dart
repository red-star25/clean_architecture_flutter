import 'package:clean_architecture_bloc/core/base/base.dart';
import 'package:clean_architecture_bloc/di/service_locator.dart';
import 'package:clean_architecture_bloc/features/counter/domain/usecases/get_count_info.dart';
import 'package:clean_architecture_bloc/features/counter/presentation/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<BaseState> {
  CounterCubit() : super(StateInitial());

  final getCountInfoUseCase = getIt.get<GetCountInfo>();

  Future<void> getCount({required int count}) async {
    emit(StateLoading());
    final result = await getCountInfoUseCase.call(count: count);
    result.fold(
      (failure) => emit(CounterInfoError(message: failure.errorMessage)),
      (counter) => emit(CounterInfoSucess(counterEntity: counter)),
    );
  }
}
