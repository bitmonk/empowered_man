import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/forgot_password/presentation/controllers/forgot_password_bindings.dart';
import 'package:empowered/features/forgot_password/presentation/screens/forgot_password_screen.dart';
import 'package:empowered/features/login/presentation/controllers/login_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';

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
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Obx(
        () => SafeArea(
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
                  // Center(child: Assets.images.appLogo.image(width: 120)),
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
                  if (controller.logginInState.value == TheStates.error &&
                      (controller.loginError.value
                              ?.toLowerCase()
                              .contains('invalid') ??
                          false))
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Opps! Password incorrect try again',
                        style: AppTextStyles.textSmallS2
                            .copyWith(color: AppColors.appRed),
                      ),
                    ),
                  AppOutlinedButton(
                    text: 'Login',
                    isLoading:
                        controller.logginInState.value == TheStates.loading,
                    onPressed: () async {
                      if (!AppUtils.validateForm(controller.formKey)) {
                        return;
                      }
                      if (await controller.login()) {
                        Get.offAllNamed(AppRoutes.main);
                      }
                    },
                  ),
                  // VerticalSpacing(16.h),
                  // AppOutlinedButton.withOutlined(
                  //   text: 'Sign up',
                  //   onPressed: () async {
                  //     Get.toNamed(AppRoutes.signup);
                  //   },
                  // ),
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
      ),
    );
  }
}
