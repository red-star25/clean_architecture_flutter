import 'package:clean_architecture_bloc/core/errors/exceptions.dart';
import 'package:clean_architecture_bloc/core/shared_pref/helper.dart';
import 'package:clean_architecture_bloc/di/service_locator.dart';
import 'package:clean_architecture_bloc/features/counter/data/models/counter_info_model.dart';

abstract class CounterLocalDataSource {
  Future<void> cacheCountInfo({required CounterModel? counterToCache});
  Future<CounterModel> getCountInfo();
}

class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  final sharedPreferences = getIt.get<SharedPreferenceHelper>();
  @override
  Future<CounterModel> getCountInfo() {
    final countInfo = sharedPreferences.countInfo ?? '';
    return Future.value(CounterModel.fromJson(json: countInfo));
  }

  @override
  Future<void> cacheCountInfo({required CounterModel? counterToCache}) async {
    if (counterToCache != null) {
      await sharedPreferences.cacheCountInfo(counterToCache.countInfo);
    } else {
      throw CacheException();
    }
  }
}
