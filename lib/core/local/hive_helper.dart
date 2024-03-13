import 'package:clean_architecture_bloc/core/constants/constants.dart';
import 'package:clean_architecture_bloc/features/counter/data/models/counter_info_model.dart';
import 'package:clean_architecture_bloc/features/news/data/models/news_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NewsModelAdapter());
    Hive.registerAdapter(ArticleModelAdapter());
    Hive.registerAdapter(SourceModelAdapter());
    Hive.registerAdapter(CounterModelAdapter());
    await openBox();
  }

  static openBox() async {
    await Hive.openBox(kCounterBox);
    await Hive.openBox(kNewsBox);
  }

  static Box<dynamic> getCounterBox() {
    return Hive.box(kCounterBox);
  }

  static Box<dynamic> getNewsBox() {
    return Hive.box(kNewsBox);
  }
}
