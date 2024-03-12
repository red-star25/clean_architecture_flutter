import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {}

class Unauthenticated extends BaseState {
  @override
  List<Object?> get props => [];
}

class StateInitial extends BaseState {
  @override
  List<Object> get props => [];
}

class StateLoading extends BaseState {
  @override
  List<Object> get props => [];
}

class StateInternetError extends BaseState {
  @override
  List<Object?> get props => [];
}

class StateErrorServer extends BaseState {
  @override
  List<Object?> get props => [];
}

class StateOnSuccess<T> extends BaseState {
  final T response;

  StateOnSuccess(this.response);

  @override
  List<Object?> get props => [];
}
