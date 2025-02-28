import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:empowered/core/config/environment_helper.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AppInitializer {
  static Future<void> init() async {
    if (Platform.isAndroid) {
      unawaited(_setHighRefreshRate());
    }

    unawaited(
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]),
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    injectDependencies();
  }

  static Future<void> _setHighRefreshRate() async {
    try {
      await FlutterDisplayMode.setHighRefreshRate();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static void injectDependencies() {
    Get
      ..put(const FlutterSecureStorage())
      ..put(Preferences(Get.find()))
      ..put(Dio())
      ..put(EnvironmentHelper())
      ..put(
        DioApiClient(Get.find(), Get.find(), Get.find(), Dio()),
      );
  }
}
