import 'package:empowered/features/delete_account/data/source/delete_account_remote_source.dart';
import 'package:empowered/features/delete_account/presentation/controller/delete_account_controller.dart';
import 'package:get/get.dart';

class DeleteAccountBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => DeleteAccountRemoteSource(Get.find()))
      ..put(
        DeleteAccountController(
          remoteSource: Get.find<DeleteAccountRemoteSource>(),
        ),
      );
  }
}

class DeleteAccountInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => DeleteAccountRemoteSource(Get.find()))
      ..put(
        DeleteAccountController(
          remoteSource: Get.find<DeleteAccountRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<DeleteAccountRemoteSource>()
      ..delete<DeleteAccountController>();
  }
}
