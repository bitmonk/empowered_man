import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/notification/presentation/screen/widget/notification_tile.dart';
import 'package:empowered/features/push_notification/presentation/controller/push_notification_controller.dart';
import 'package:intl/intl.dart';

class PushNotificationScreen extends GetView<PushNotificationController> {
  const PushNotificationScreen(this.showDone, {super.key});
  final bool showDone;

  @override
  Widget build(BuildContext context) {
    controller.getNotification();
    String formatDate(DateTime dateTime) {
      return DateFormat('dd MMM yyyy, hh:mm a').format(dateTime.toLocal());
    }

    return WillPopScope(
      onWillPop: () async {
        // if (showDone) {
        //   Get.offAllNamed(AppRoutes.gettingStartedScreen);
        // } else {
        //   Navigator.pop(context);
        // }
        Navigator.pop(context);
        return true;
      },
      child: AppScaffold(
        appBar: CustomAppBar(
          title: 'Notification',
          onTap: () {
            // if (showDone) {
            //   Get.offAllNamed(AppRoutes.gettingStartedScreen);
            // } else {
            //   Navigator.pop(context);
            // }
            Navigator.pop(context);
          },
        ),
        body: Obx(
          () => RefreshIndicator(
            onRefresh: () async {
              controller.getNotification();
            },
            child: Padding(
              // physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
                orElse: () {
                  final notifications = controller
                          .pushNotificationModel.value.data?.notifications ??
                      [];

                  if (notifications.isEmpty) {
                    return  Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          'No notifications yet',
                          style: AppTextStyles.bodyLGMedium.copyWith(
                            color: AppColors.colorWhite,),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final notification = notifications[index];
                      return NotificationTile(
                        title: notification.data?.title ?? '',
                        body: notification.data?.body ?? '',
                        createdAt: formatDate(
                            notification.createdAt ?? DateTime.now()),
                        // notification: notification,
                        // onTap: () {
                        //   // Handle notification tap
                        //   // You can navigate to specific screens based on notification type
                        //   _handleNotificationTap(notification);
                        // },
                      );
                    },
                  );
                  //   return Column(
                  //   children: [NotificationTile()],
                  // );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
