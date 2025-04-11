import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/change_password/presentation/controllers/change_password_controller.dart';
import 'package:empowered/utlis/app_validators.dart';
import 'package:form_validator/form_validator.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.cancelRequest();
        Get.back();
        return true;
      },
      child: AppScaffold(
        appBar: CustomAppBar(
          title: 'Change password',
          onTap: () {
            controller.cancelRequest();
            Get.back();
          },
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
                    validator: (value) {
                      var requiredValidation =
                          ValidationBuilder().required().build()(value);
                      if (requiredValidation != null) {
                        return requiredValidation;
                      }
                      return controller.validatePassword(value ?? '');
                    },
                    labelText: 'New password',
                    hintText: 'New password',
                    controller: controller.newPassword,
                    onChanged: (value) {
                      controller.validatePassword(value);
                    },
                  ),
                  const VerticalSpacing(20),
                  AppTextFormField(
                    validator: (value) {
                      var requiredValidation =
                          ValidationBuilder().required().build()(value);
                      if (requiredValidation != null) {
                        return requiredValidation;
                      }
                      return AppValidators.match(
                        value,
                        controller.newPassword.text.trim(),
                      );
                    },
                    hintText: 'Confirm new password',
                    labelText: 'Confirm new password',
                    controller: controller.confirmNewPassword,
                  ),
                  const VerticalSpacing(20),
                  Text(
                    'Password must contain:',
                    style: AppTextStyles.titleSm
                        .copyWith(color: AppColors.textColor100),
                  ),
                  const VerticalSpacing(16),
                  Text(
                    'At least 1 upper case letter (A-Z)',
                    style: AppTextStyles.titleSm.copyWith(
                      color: !controller.isUpperCaseValid.value
                          ? AppColors.textColor100
                          : AppColors.appGreen,
                      decoration: !controller.isUpperCaseValid.value
                          ? null
                          : TextDecoration.lineThrough,
                      decorationColor: !controller.isUpperCaseValid.value
                          ? null
                          : AppColors.appGreen,
                    ),
                  ),
                  const VerticalSpacing(12),
                  Text(
                    'At least 1 number  (0-9)',
                    style: AppTextStyles.titleSm.copyWith(
                      color: !controller.isNumberValid.value
                          ? AppColors.textColor100
                          : AppColors.appGreen,
                      decoration: !controller.isNumberValid.value
                          ? null
                          : TextDecoration.lineThrough,
                      decorationColor: !controller.isNumberValid.value
                          ? null
                          : AppColors.appGreen,
                    ),
                  ),
                  const VerticalSpacing(12),
                  Text(
                    'At least 8 characters',
                    style: AppTextStyles.titleSm.copyWith(
                      color: !controller.isLengthValid.value
                          ? AppColors.textColor100
                          : AppColors.appGreen,
                      decoration: !controller.isLengthValid.value
                          ? null
                          : TextDecoration.lineThrough,
                      decorationColor: !controller.isLengthValid.value
                          ? null
                          : AppColors.appGreen,
                    ),
                  ),
                  const VerticalSpacing(20),
                  AppOutlinedButton(
                    safePadding: true,
                    text: 'Change Password',
                    isLoading: controller.changePasswordState.value ==
                        TheStates.loading,
                    onPressed: () async {
                      if (!AppUtils.validateForm(controller.formKey)) {
                        return;
                      }

                      try {
                        await controller.changePassword();
                        if (context.mounted) {
                          Navigator.pop(Get.overlayContext!);
                        }
                      } catch (e) {
                        AppUtils.showErrorSnackbar(
                          message: 'Failed to change password',
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
