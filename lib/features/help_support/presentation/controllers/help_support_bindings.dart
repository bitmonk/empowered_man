import 'package:empowered/features/help_support/data/source/help_support_remote_source.dart';
import 'package:empowered/features/help_support/presentation/controllers/help_support_controller.dart';
import 'package:get/get.dart';

class HelpSupportBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => HelpSupportRemoteSource(Get.find()))
      ..put(
        HelpSupportController(
          remoteSource: Get.find<HelpSupportRemoteSource>(),
        ),
      );
  }
}

class HelpSupportInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => HelpSupportRemoteSource(Get.find()))
      ..put(
        HelpSupportController(
          remoteSource: Get.find<HelpSupportRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<HelpSupportRemoteSource>()
      ..delete<HelpSupportController>();
  }
}
