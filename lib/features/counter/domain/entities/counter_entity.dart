import 'package:equatable/equatable.dart';

class CounterEntity extends Equatable {
  final String countInfo;
  const CounterEntity({required this.countInfo});

  @override
  List<Object?> get props => [countInfo];
}
