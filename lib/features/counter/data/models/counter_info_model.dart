import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/counter_entity.dart';

part 'counter_info_model.g.dart';

@HiveType(typeId: 0)
class CounterModel extends CounterEntity {
  const CounterModel({required String countInfo}) : super(countInfo: countInfo);

  factory CounterModel.fromJson({required String json}) {
    return CounterModel(countInfo: json);
  }

  CounterModel copyWith({String? countInfo}) {
    return CounterModel(countInfo: countInfo ?? this.countInfo);
  }
}
