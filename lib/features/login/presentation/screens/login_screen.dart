import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/core/routes/app_routes.dart';
import 'package:empowered/features/common/app_outlined_button.dart';
import 'package:empowered/features/common/app_scaffold.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/common/app_text_button.dart';
import 'package:empowered/features/common/app_text_form_field.dart';
import 'package:empowered/features/forgot_password/presentation/controllers/forgot_password_bindings.dart';
import 'package:empowered/features/forgot_password/presentation/screens/forgot_password_screen.dart';
import 'package:empowered/features/login/presentation/controllers/login_controller.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:empowered/utlis/app_utils.dart';
import 'package:empowered/utlis/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgDark,
        scrolledUnderElevation: 0,
        title: const Text(
          'Log into account',
          style: AppTextStyles.textHeadingH3,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Assets.images.appLogo.image(width: 120)),
                VerticalSpacing(16.h),
                AppTextFormField(
                  labelText: 'Enter email',
                  controller: controller.emailController,
                  validator: ValidationBuilder()
                      .email('Invalid email address')
                      .build(),
                  textInputType: TextInputType.emailAddress,
                ),
                VerticalSpacing(16.h),
                Obx(
                  () => AppTextFormField(
                    labelText: 'Enter password',
                    controller: controller.passwordController,
                    obscureText: !controller.showPassword.value,
                    textInputType: TextInputType.visiblePassword,
                    validator: ValidationBuilder().minLength(6).build(),
                    suffixIcon: IconButton(
                      onPressed: controller.toggleVisibility,
                      icon: controller.showPassword.value
                          ? Assets.images.eyeClose.svg()
                          : Assets.images.eyeOpen.svg(),
                    ),
                  ),
                ),
                VerticalSpacing(16.h),
                AppOutlinedButton(
                  text: 'Login',
                  onPressed: () async {
                    if (!AppUtils.validateForm(controller.formKey)) {
                      return;
                    }
                    UiHelper.showloaderdialog(context);
                    await Future.delayed(const Duration(seconds: 2));
                    Navigator.pop(Get.overlayContext!);
                    Get.offAllNamed(AppRoutes.main);
                  },
                ),
                VerticalSpacing(16.h),
                AppOutlinedButton.withOutlined(
                  text: 'Sign up',
                  onPressed: () async {
                    Get.toNamed(AppRoutes.signup);
                  },
                ),
                VerticalSpacing(12.h),
                AppTextButton.grey(
                  label: 'Forgot password?',
                  onTap: () {
                    ForgotPasswordInitializer.destroy();
                    ForgotPasswordInitializer.initialize();
                    Get.to(() => const ForgotPasswordScreen());
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
