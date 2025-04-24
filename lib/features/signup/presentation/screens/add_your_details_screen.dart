import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/signup/presentation/controller/signup_controller.dart';
import 'package:empowered/features/signup/presentation/widgets/dots_indicator.dart';
import 'package:form_validator/form_validator.dart';

class AddYourDetailsScreen extends StatefulWidget {
  const AddYourDetailsScreen({super.key});

  @override
  State<AddYourDetailsScreen> createState() => _AddYourDetailsScreenState();
}

class _AddYourDetailsScreenState extends State<AddYourDetailsScreen> {
  final controller = Get.find<SignupController>();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // Added for password visibility

  Color getPasswordStrengthColor(
    bool hasMinLength,
    bool containsNumber,
    bool containsSymbol,
    bool containsLetter,
  ) {
    var strengthScore = (hasMinLength ? 1 : 0) +
        (containsNumber ? 1 : 0) +
        (containsSymbol ? 1 : 0) +
        (containsLetter ? 1 : 0);

    if (strengthScore == 4) {
      return AppColors.color279627; // Green for strong password
    } else if (strengthScore == 3) {
      return AppColors.colorFFB032; // Green for strong password
    } else if (strengthScore == 2) {
      return AppColors.colorFFB032
          .withOpacity(0.5); // Orange for moderate strength
    } else {
      return AppColors.colorC03A31; // Red for weak password
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: 'Add your details 3 / 4',
      ),
      body: Obx(
        () => Form(
          key: formkey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const DotsIndicator(itemCount: 4, currentIndex: 2),
                const VerticalSpacing(32),
                AppTextFormField(
                  controller: controller.mobileController,
                  labelText: 'Enter mobile number',
                  textInputType: TextInputType.phone,
                  maxLength: 11,
                  validator: (value) {
                    if (value == null ||
                        (value.length != 10 && value.length != 11)) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const VerticalSpacing(16),
                AppTextFormField(
                  controller: controller.emailController,
                  labelText: 'Enter email address',
                  textInputType: TextInputType.emailAddress,
                  validator: ValidationBuilder().required().email().build(),
                ),
                const VerticalSpacing(16),
                AppTextFormField(
                  controller: controller.passwordController,
                  labelText: 'Enter password',
                  obscureText: !controller.showPassword.value,
                  onChanged: (v) => controller.validatePassword(v),
                  validator: ValidationBuilder().required().build(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.showPassword.value =
                          !controller.showPassword.value;
                    },
                    icon: controller.showPassword.value
                        ? Assets.images.eyeClose.svg()
                        : Assets.images.eyeOpen.svg(),
                  ),
                ),
                const VerticalSpacing(16),
                AppTextFormField(
                  controller: controller.confirmPasswordController,
                  labelText: 'Confirm password',
                  obscureText: !controller.showPassword.value,
                  // onChanged: (v) => controller.validatePassword(v),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != controller.passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.showPassword.value =
                          !controller.showPassword.value;
                    },
                    icon: controller.showPassword.value
                        ? Assets.images.eyeClose.svg()
                        : Assets.images.eyeOpen.svg(),
                  ),
                ),
                const VerticalSpacing(16),
                SizedBox(
                  height: 8,
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(20),
                    value: controller.isPasswordValid.value
                        ? 1.0
                        : (controller.hasMinLength.value ? 0.25 : 0.0) +
                            (controller.containsNumber.value ? 0.25 : 0.0) +
                            (controller.containsSymbol.value ? 0.25 : 0.0) +
                            (controller.containsLetter.value ? 0.25 : 0.0),
                    backgroundColor: AppColors.colorEDECEF,
                    color: getPasswordStrengthColor(
                      controller.hasMinLength.value,
                      controller.containsNumber.value,
                      controller.containsSymbol.value,
                      controller.containsLetter.value,
                    ), // Red for invalid password
                  ),
                ),
                const VerticalSpacing(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildValidationItem(
                      '8 characters minimum',
                      controller.hasMinLength.value,
                    ),
                    const VerticalSpacing(2),
                    _buildValidationItem(
                      'a number',
                      controller.containsNumber.value,
                    ),
                    const VerticalSpacing(2),
                    _buildValidationItem(
                      'a symbol',
                      controller.containsSymbol.value,
                    ),
                    const VerticalSpacing(2),
                    _buildValidationItem(
                      'a letter',
                      controller.containsLetter.value,
                    ),
                  ],
                ),
                const VerticalSpacing(16),
                AppOutlinedButton(
                  text: 'Next',
                  onPressed: controller.isPasswordValid.value
                      ? () {
                          if (formkey.currentState!.validate()) {
                            controller.signUpRequestData.value.phoneNumber =
                                controller.mobileController.text;
                            controller.signUpRequestData.value.email =
                                controller.emailController.text;
                            controller.signUpRequestData.value.password =
                                controller.passwordController.text;
                            Get.toNamed(AppRoutes.addYourOccupation);
                          } else {
                            AppUtils.showErrorSnackbar(
                                message: 'Please fill all fields correctly.');
                          }
                        }
                      : null, // Disable button if password is invalid
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildValidationItem(String text, bool isValid) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: isValid ? null : Border.all(color: AppColors.textColor100),
            color: isValid ? AppColors.color279627 : null, // Background color
          ),
          child: Icon(
            Icons.check,
            color: isValid ? Colors.white : Colors.transparent, // Tick color
            size: 12,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.textColor100,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
