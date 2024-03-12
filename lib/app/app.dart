import 'package:clean_architecture_bloc/core/constants/app_theme.dart';
import 'package:clean_architecture_bloc/core/constants/constants.dart';
import 'package:clean_architecture_bloc/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, __) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        locale: const Locale('en', 'US'),
        title: kAppName,
        theme: themeData,
        routerConfig: router,
      ),
    );
  }
}
