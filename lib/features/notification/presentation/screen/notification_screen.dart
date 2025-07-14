import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/notification/presentation/controller/notification_controller.dart';
import 'package:empowered/features/notification/presentation/screen/widget/app_switch_tile.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen(this.showDone, {super.key});
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
          title: 'Push Notification',
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
              child: controller.getNotificationState.value.showWidget(
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
                  children: [
                    if (controller.notificationList.value.data != null)
                      AppSwitchTile(
                        title: 'All',
                        value: controller.allNotification.value,
                        onChanged: (value) {
                          for (final e in controller
                              .notificationList.value.data!.entries) {
                            final updatedData = {
                              ...?controller.notificationList.value
                                  .data, // Keep existing data
                              e.key: {
                                ...?controller.notificationList.value.data?[
                                    e.key], // Keep existing key-value pairs
                                e.value.entries.first.key:
                                    value, // Update the specific boolean value
                              },
                            };

                            // Assign the new instance to the Rx variable
                            controller.notificationList.value = controller
                                .notificationList.value
                                .copyWith(data: updatedData);
                          }
                          controller.allNotification.value = controller
                                  .notificationList.value.data?.values
                                  .every(
                                (innerMap) =>
                                    innerMap.values.every((val) => val),
                              ) ??
                              false;
                          if (!showDone) {
                            controller.updateNotification();
                          }
                        },
                      ),
                    if (controller.notificationList.value.data != null)
                      const AppDivider(
                        color: Color(0xff313C45),
                      ),
                    if (controller.notificationList.value.data != null)
                      ...controller.notificationList.value.data!.entries.map(
                        (e) => AppSwitchTile(
                          title: formatString(e.value.entries.first.key),
                          value: e.value.entries.first.value,
                          onChanged: (value) {
                            final updatedData = {
                              ...?controller.notificationList.value
                                  .data, // Keep existing data
                              e.key: {
                                ...?controller.notificationList.value.data?[
                                    e.key], // Keep existing key-value pairs
                                e.value.entries.first.key:
                                    value, // Update the specific boolean value
                              },
                            };

                            // Assign the new instance to the Rx variable
                            controller.notificationList.value = controller
                                .notificationList.value
                                .copyWith(data: updatedData);
                            controller.allNotification.value = controller
                                    .notificationList.value.data?.values
                                    .every(
                                  (innerMap) =>
                                      innerMap.values.every((val) => val),
                                ) ??
                                false;
                            if (!showDone) {
                              controller.updateNotification();
                            }
                          },
                        ),
                      ),
                    const VerticalSpacing(16),
                    if (showDone)
                      AppOutlinedButton(
                        text: 'Done',
                        isLoading: controller.updateNotificationState.value ==
                            TheStates.loading,
                        onPressed: () async {
                          await controller.updateNotification();

                          if (controller.updateNotificationState.value ==
                              TheStates.success) {
                            Get.offAllNamed(AppRoutes.gettingStartedScreen);
                          }
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
