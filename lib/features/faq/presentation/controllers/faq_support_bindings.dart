import 'package:empowered/features/faq/data/source/faq_support_remote_source.dart';
import 'package:empowered/features/faq/presentation/controllers/faq_support_controller.dart';
import 'package:get/get.dart';

class FaqSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => FaqSupportRemoteSource(Get.find()))
      ..put(
        FaqController(
          remoteSource: Get.find<FaqSupportRemoteSource>(),
        ),
      );
  }
}

class FaqInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => FaqSupportRemoteSource(Get.find()))
      ..put(
        FaqController(
          remoteSource: Get.find<FaqSupportRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<FaqSupportRemoteSource>()
      ..delete<FaqController>();
  }
}
