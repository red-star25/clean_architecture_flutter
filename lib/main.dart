import 'dart:async';

import 'package:clean_architecture_bloc/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;
import 'package:logger/logger.dart';

import 'app/app.dart';

final logger = Logger();

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await setupLocator();

      service.SystemChrome.setPreferredOrientations(
          [service.DeviceOrientation.portraitUp]).then((_) {
        runApp(const App());
      });
    },
    (error, stackTrace) => logger.e(error.toString()),
  );
}
