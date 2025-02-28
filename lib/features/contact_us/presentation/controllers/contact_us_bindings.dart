import 'package:empowered/features/contact_us/data/source/contact_us_remote_source.dart';
import 'package:empowered/features/contact_us/presentation/controllers/contact_us_controller.dart';
import 'package:get/get.dart';

class ContactUsBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => ContactUsRemoteSource(Get.find()))
      ..put(
        ContactUsController(
          remoteSource: Get.find<ContactUsRemoteSource>(),
        ),
      );
  }
}

class ContactUsInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => ContactUsRemoteSource(Get.find()))
      ..put(
        ContactUsController(
          remoteSource: Get.find<ContactUsRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<ContactUsRemoteSource>()
      ..delete<ContactUsController>();
  }
}
