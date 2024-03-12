import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CounterEntity extends Equatable {
  @HiveField(0)
  final String countInfo;
  const CounterEntity({required this.countInfo});

  @override
  List<Object?> get props => [countInfo];
}
