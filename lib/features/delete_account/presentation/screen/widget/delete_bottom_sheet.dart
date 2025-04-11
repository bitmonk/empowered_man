import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/core/preferences/shared_pref.dart';
import 'package:empowered/features/delete_account/presentation/controller/delete_account_controller.dart';

class DeleteBottomSheet extends StatelessWidget {
  const DeleteBottomSheet({required this.controller, super.key});
  final DeleteAccountController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(
          0xff132534,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 43,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(
                  0xFF4A5D72,
                ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),
            const VerticalSpacing(14),
            const Text(
              'Delete Account?',
              style: AppTextStyles.titleHeading,
            ),
            const VerticalSpacing(20),
            const GreyDivider(),
            const VerticalSpacing(20),
            Text(
              textAlign: TextAlign.center,
              'Are you sure you want to delete your account? This action cannot be undone.',
              style: AppTextStyles.titleMd.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.textColor200,
              ),
            ),
            const VerticalSpacing(24),
            AppOutlinedButton.orange(
              text: 'Delete',
              isLoading:
                  controller.deleteAccountState.value == TheStates.loading,
              onPressed: () async {
                final result = await controller.deleteAccount();
                if (result == true) {
                  await Get.find<AppSharedPref>().removeAll();
                  Get.offAllNamed(AppRoutes.landingScreen);
                }
              },
            ),
            const VerticalSpacing(16),
            AppOutlinedButton.withOutlined(
              safePadding: true,
              hasShadow: false,
              backgroundColor: const Color(
                0xff132534,
              ),
              text: 'Cancel',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const BottomSpacing(),
          ],
        ),
      ),
    );
  }
}
