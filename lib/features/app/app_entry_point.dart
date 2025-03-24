import 'dart:async';

import 'package:empowered/core/config/app_config.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/app/my_app.dart';

class AppEntryPoint {
  AppEntryPoint(AppConfiguration buildVariant) {
    envSettings = buildVariant;
    initializeStartUpDependenciesAndRun();
  }
  static AppConfiguration? envSettings;

  static Future<void> initializeStartUpDependenciesAndRun() async {
    await AppInitializer.init();

    runApp(
      const MyApp(),
    );
  }
}
