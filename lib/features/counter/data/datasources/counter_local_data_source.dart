import 'package:clean_architecture_bloc/core/constants/constants.dart';
import 'package:clean_architecture_bloc/core/local/hive_helper.dart';
import 'package:clean_architecture_bloc/features/counter/data/models/counter_info_model.dart';

abstract class CounterLocalDataSource {
  Future<void> cacheCountInfo({required CounterModel? counterToCache});
  Future<CounterModel?> getCountInfo();
}

class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  @override
  Future<CounterModel?> getCountInfo() async {
    final counterModel =
        HiveHelper.getCounterBox().get(kCounterBox) as CounterModel?;
    return counterModel;
  }

  @override
  Future<void> cacheCountInfo({required CounterModel? counterToCache}) async {
    await HiveHelper.getCounterBox().put(kCounterBox, counterToCache);
  }
}
