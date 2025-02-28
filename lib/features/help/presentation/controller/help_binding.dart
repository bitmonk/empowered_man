import 'package:empowered/features/help/data/source/help_remote_source.dart';
import 'package:empowered/features/help/presentation/controller/help_controller.dart';
import 'package:get/get.dart';

class HelpBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => HelpRemoteSource(Get.find()))
      ..put(HelpController(remoteSource: Get.find<HelpRemoteSource>()));
  }
}

class HelpInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => HelpRemoteSource(Get.find()))
      ..put(
        HelpController(
          remoteSource: Get.find<HelpRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<HelpRemoteSource>()
      ..delete<HelpController>();
  }
}
