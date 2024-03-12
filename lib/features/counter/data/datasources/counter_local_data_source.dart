import 'package:clean_architecture_bloc/core/constants/constants.dart';
import 'package:clean_architecture_bloc/features/counter/data/models/counter_info_model.dart';
import 'package:hive/hive.dart';

abstract class CounterLocalDataSource {
  Future<void> cacheCountInfo({required CounterModel? counterToCache});
  Future<CounterModel> getCountInfo();
}

class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  @override
  Future<CounterModel> getCountInfo() async {
    await Hive.openBox(kCounterBox);
    final box = Hive.box(kCounterBox);
    final counterModel = box.get(kCounterBox) as CounterModel;
    return counterModel;
  }

  @override
  Future<void> cacheCountInfo({required CounterModel? counterToCache}) async {
    await Hive.openBox(kCounterBox);
    final box = Hive.box(kCounterBox);
    await box.put(kCounterBox, counterToCache);
  }
}
