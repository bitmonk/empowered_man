import 'package:empowered/features/tribe/data/source/feed_page_remote_source.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:get/get.dart';

class FeedPageBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => FeedPageRemoteSource(Get.find()))
      ..put(
        FeedPageController(
          remoteSource: Get.find<FeedPageRemoteSource>(),
        ),
      );
  }
}

class FeedPageInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => FeedPageRemoteSource(Get.find()))
      ..put(
        FeedPageController(
          remoteSource: Get.find<FeedPageRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<FeedPageRemoteSource>()
      ..delete<FeedPageController>();
  }
}
