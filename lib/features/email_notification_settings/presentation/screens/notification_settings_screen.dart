import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/email_notification_settings/presentation/controllers/notification_settings_controller.dart';
import 'package:empowered/features/email_notification_settings/presentation/screens/widgets/app_switch_tile.dart';
import 'package:empowered/gen/assets.gen.dart';

class NotificationSettingsScreen
    extends GetView<NotificationSettingsController> {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'Notifications',
        onTap: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Assets.images.appLogo.image(
                    width: 96,
                    height: 96,
                    fit: BoxFit.cover,
                  ),
                ),
                const VerticalSpacing(16),
                const Text(
                  'Stay Informed via Email',
                  style: AppTextStyles.titleXS,
                ),
                const VerticalSpacing(16),
                AppSwitchTile(
                  value: controller.emailNotificatios.value,
                  title: 'All Email Notifications',
                  onChanged: (value) {
                    controller.emailNotificatios.value = value;
                  },
                  subtitle: 'Manage your email notification preferences',
                ),
                const Divider(
                  thickness: 1,
                  color: Color(
                    0xFFB7BEC6,
                  ),
                ),
                AppSwitchTile(
                  value: controller.contactusResponxe.value,
                  title: 'Contact Us Response',
                  onChanged: (value) {
                    controller.contactusResponxe.value = value;
                  },
                ),
                AppSwitchTile(
                  value: controller.forGetPassword.value,
                  title: 'Forget Password',
                  onChanged: (value) {
                    controller.forGetPassword.value = value;
                  },
                ),

                AppSwitchTile(
                  value: controller.accountTemporarilySuspended.value,
                  title: 'Account Temporarily Suspended',
                  onChanged: (value) {
                    controller.accountTemporarilySuspended.value = value;
                  },
                ),
                AppSwitchTile(
                  value: controller.accounDeleted.value,
                  title: 'Account Deleted',
                  onChanged: (value) {
                    controller.accounDeleted.value = value;
                  },
                ),
                const Spacer(),
                // AppOutlinedButton(
                //   text: 'Save',
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
