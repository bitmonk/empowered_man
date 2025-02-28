import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_logo.dart';
import 'package:empowered/features/common/app_outlined_button.dart';
import 'package:empowered/features/common/app_scaffold.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/common/app_text_form_field.dart';
import 'package:empowered/features/common/custom_app_bar.dart';
import 'package:empowered/features/forgot_password/presentation/controllers/forgot_password_controller.dart';

import 'package:empowered/utlis/app_text_styles.dart';
import 'package:empowered/utlis/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: AppLogo()),
              const VerticalSpacing(32),
              const Text(
                'Forgot password?',
                style: AppTextStyles.titleSm,
              ),
              const VerticalSpacing(16),
              const Text(
                'Please enter the email associated with your account.',
                style: TextStyle(color: AppColors.neutral600),
              ),
              const VerticalSpacing(32),
              Form(
                key: controller.formKey,
                child: AppTextFormField(
                  controller: controller.emailController,
                  validator: ValidationBuilder().email().build(),
                  labelText: 'Email Address',
                  textInputType: TextInputType.emailAddress,
                ),
              ),
              const VerticalSpacing(32),
              AppOutlinedButton(
                text: 'Conttinue',
                onPressed: () {
                  if (!AppUtils.validateForm(controller.formKey)) {
                    return;
                  }
                  AppUtils.showSnackbar(
                    message: 'Please check your email to reset your password',
                  );
                  Navigator.pop(context);
                },
              ),
              const VerticalSpacing(24),
            ],
          ),
        ),
      ),
    );
  }
}
