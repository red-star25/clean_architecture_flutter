import '../../domain/entities/counter_entity.dart';

class CounterModel extends CounterEntity {
  const CounterModel({required String countInfo}) : super(countInfo: countInfo);

  factory CounterModel.fromJson({required String json}) {
    return CounterModel(countInfo: json);
  }

  CounterModel copyWith({String? countInfo}) {
    return CounterModel(countInfo: countInfo ?? this.countInfo);
  }
}
