import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/delete_account/presentation/controller/delete_account_controller.dart';
import 'package:empowered/features/delete_account/presentation/screen/widget/delete_bottom_sheet.dart';
import 'package:form_validator/form_validator.dart';

class DeleteAccountScreen extends GetView<DeleteAccountController> {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'Delete account',
        onTap: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Form(
          key: controller.formKey,
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextFormField(
                  validator: ValidationBuilder().required().build(),
                  controller: controller.messageController,
                  labelText: ' Reason for deletion',
                  hintText: 'Reason',
                ),
                const VerticalSpacing(20),
                AppTextFormField(
                  validator: ValidationBuilder().required().build(),
                  controller: controller.passwordController,
                  labelText: 'Enter password',
                  hintText: 'Password',
                  obscureText: !controller.showPassword.value,
                  suffixIcon: IconButton(
                    onPressed: controller.toggleVisibility,
                    icon: controller.showPassword.value
                        ? Assets.images.eyeOpen.svg()
                        : Assets.images.eyeClose.svg(),
                  ),
                ),
                const VerticalSpacing(20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.appRed),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Assets.images.warning.svg(height: 24, width: 24),
                        const HorizontalSpacing(12),
                        Expanded(
                          child: Text(
                            'Deleting your account is permanent and cannot be undone. Please make sure that you have saved any important data before proceeding. If you have any doubts, you can always cancel the deletion process.',
                            style: AppTextStyles.titleSm.copyWith(
                              color: AppColors.appRed,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticalSpacing(20),
                AppOutlinedButton(
                  text: 'Delete',
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        useRootNavigator: true,
                        useSafeArea: true,
                        context: context,
                        builder: (context) => DeleteBottomSheet(
                          controller: controller,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
