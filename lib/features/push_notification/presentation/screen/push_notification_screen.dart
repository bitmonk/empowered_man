import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/push_notification/presentation/controller/push_notification_controller.dart';
import 'package:empowered/features/settings_notification/presentation/screen/widget/notification_tile.dart';

class PushNotificationScreen extends GetView<PushNotificationController> {
  const PushNotificationScreen(this.showDone, {super.key});
  final bool showDone;

  @override
  Widget build(BuildContext context) {
    controller.getNotification();
    return WillPopScope(
      onWillPop: () async {
        if (showDone) {
          Get.offAllNamed(AppRoutes.gettingStartedScreen);
        } else {
          Navigator.pop(context);
        }
        return true;
      },
      child: AppScaffold(
        appBar: CustomAppBar(
          title: 'Notification',
          onTap: () {
            if (showDone) {
              Get.offAllNamed(AppRoutes.gettingStartedScreen);
            } else {
              Navigator.pop(context);
            }
          },
        ),
        body: Obx(
          () => RefreshIndicator(
            onRefresh: () async {
              controller.getNotification();
            },
            child: Padding(
              // physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: controller.getPushNotificationState.value.showWidget(
                loading: () => const AppLoadingWidget.small(
                  color: AppColors.colorWhite,
                ),
                error: () => AppOutlinedButton(
                  onPressed: () {
                    controller.getNotification();
                  },
                  text: 'Retry',
                ),
                orElse: () => Column(
                  children: [NotificationTile()],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
