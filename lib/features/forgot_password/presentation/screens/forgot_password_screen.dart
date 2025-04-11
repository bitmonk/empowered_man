import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/forgot_password/presentation/controllers/forgot_password_controller.dart';
import 'package:form_validator/form_validator.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
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
                  text: 'Continue',
                  isLoading:
                      controller.forgotPasswordState.value == TheStates.loading,
                  onPressed: () async {
                    if (!AppUtils.validateForm(controller.formKey)) {
                      return;
                    }
                    if (await controller.forgotPassword()) {
                      Navigator.pop(context);
                    }
                  },
                ),
                const VerticalSpacing(24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
