import 'package:clean_architecture_bloc/core/base/base_state.dart';
import 'package:clean_architecture_bloc/di/service_locator.dart';
import 'package:clean_architecture_bloc/features/news/domain/usecases/get_news.dart';
import 'package:clean_architecture_bloc/features/news/presentation/cubit/news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<BaseState> {
  NewsCubit() : super(StateInitial());

  final getNewsUserCase = getIt.get<GetNews>();

  Future<void> getNews() async {
    emit(StateLoading());
    final result = await getNewsUserCase.call();
    result.fold(
      (failure) => emit(NewsError(message: failure.errorMessage)),
      (news) => emit(NewsSuccess(newsEntity: news)),
    );
  }
}
