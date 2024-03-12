import 'dart:async';

import 'package:clean_architecture_bloc/di/service_locator.dart';

import 'pref_keys.dart';
import 'preference.dart';

class SharedPreferenceHelper {
  final Preference _sharedPreference = getIt.get<Preference>();

  String? get countInfo {
    return _sharedPreference.getString(PrefKeys.countInfo) ?? '';
  }

  Future<void> cacheCountInfo(String countInfo) async {
    await _sharedPreference.setString(PrefKeys.countInfo, countInfo);
  }
}
