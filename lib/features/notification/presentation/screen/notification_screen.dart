import 'package:empowered/core/routes/app_routes.dart';
import 'package:empowered/features/common/app_divider.dart';
import 'package:empowered/features/common/app_outlined_button.dart';
import 'package:empowered/features/common/app_scaffold.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/common/custom_app_bar.dart';
import 'package:empowered/features/notification/presentation/controller/notification_controller.dart';
import 'package:empowered/features/notification/presentation/screen/widget/app_switch_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen(this.showDone, {super.key});
  final bool showDone;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'Push Notification',
        onTap: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Obx(
          () => Column(
            children: [
              AppSwitchTile(
                title: 'All',
                value: controller.allNotification.value,
                onChanged: (value) {
                  controller.allNotification.value = value;
                },
              ),
              const AppDivider(),
              AppSwitchTile(
                title: 'Check-in reminder',
                value: controller.checkInReminderNotification.value,
                onChanged: (value) {
                  controller.checkInReminderNotification.value = value;
                },
              ),
              AppSwitchTile(
                title: 'New message added',
                value: controller.newMessageAddedNotification.value,
                onChanged: (value) {
                  controller.newMessageAddedNotification.value = value;
                },
              ),
              AppSwitchTile(
                title: 'New video added',
                value: controller.newVideoAddedNotification.value,
                onChanged: (value) {
                  controller.newVideoAddedNotification.value = value;
                },
              ),
              AppSwitchTile(
                title: 'New reply to message',
                value: controller.newReplyToMessage.value,
                onChanged: (value) {
                  controller.newReplyToMessage.value = value;
                },
              ),
              const VerticalSpacing(16),
              if (showDone)
                AppOutlinedButton(
                  text: 'Done',
                  onPressed: () {
                    Get.toNamed(AppRoutes.gettingStartedScreen);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
