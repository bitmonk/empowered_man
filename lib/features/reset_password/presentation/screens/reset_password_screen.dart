import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/reset_password/presentation/controllers/reset_password_controller.dart';
import 'package:empowered/features/reset_password/presentation/screens/app_success_screen.dart';
import 'package:empowered/utlis/app_validators.dart';
import 'package:empowered/utlis/uihelper.dart';
import 'package:form_validator/form_validator.dart';

class ResetPasswordScreenParam {
  ResetPasswordScreenParam({required this.email, required this.otp});

  final String email;
  final String otp;
}

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final controller = Get.find<ResetPasswordController>();
  final ResetPasswordScreenParam param = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: AppLogo()),
                  const VerticalSpacing(32),
                  const Text(
                    'Reset password',
                    style: AppTextStyles.titleSm,
                  ),
                  const VerticalSpacing(16),
                  const Text(
                    'Please set up a new password.',
                    style: TextStyle(
                      color: AppColors.neutral600,
                    ),
                  ),
                  const VerticalSpacing(24),
                  Obx(
                    () => AppTextFormField(
                      labelText: 'New Password',
                      controller: controller.passwordController,
                      obscureText: !controller.showPassword.value,
                      textInputType: TextInputType.visiblePassword,
                      validator: ValidationBuilder().minLength(6).build(),
                      suffixIcon: IconButton(
                        onPressed: controller.togglePassVisibility,
                        icon: controller.showPassword.value
                            ? Assets.images.eyeClose.svg()
                            : Assets.images.eyeOpen.svg(),
                      ),
                    ),
                  ),
                  const VerticalSpacing(16),
                  Obx(
                    () => AppTextFormField(
                      labelText: 'Confirm New Password',
                      controller: controller.confirmPasswordController,
                      obscureText: !controller.showConfirmPassword.value,
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) => AppValidators.match(
                        value,
                        controller.passwordController.text.trim(),
                      ),
                      suffixIcon: IconButton(
                        onPressed: controller.toggleConfirmVisibility,
                        icon: controller.showConfirmPassword.value
                            ? Assets.images.eyeClose.svg()
                            : Assets.images.eyeOpen.svg(),
                      ),
                    ),
                  ),
                  const VerticalSpacing(32),
                  AppOutlinedButton(
                    safePadding: true,
                    text: 'Change Password',
                    onPressed: () async {
                      if (!AppUtils.validateForm(controller.formkey)) {
                        return;
                      }
                      UiHelper.showloaderdialog(context);
                      await Future.delayed(const Duration(seconds: 2));
                      Navigator.pop(Get.overlayContext!);
                      Get.toNamed(
                        AppRoutes.success,
                        arguments: AppSuccessScreenParam(
                          title: 'Password changed!',
                          subtitle:
                              'Your password has been changed successfully.',
                          image: Assets.images.done.path,
                          width: 104,
                          buttonText: 'Back to Login',
                          onPressed: (context) {
                            Navigator.popUntil(
                              context,
                              (route) => route.isFirst,
                            );
                          },
                        ),
                      );
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
