import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/signup/presentation/widgets/dots_indicator.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:form_validator/form_validator.dart';

class AddYourDetailsScreen extends StatefulWidget {
  const AddYourDetailsScreen({super.key});

  @override
  State<AddYourDetailsScreen> createState() => _AddYourDetailsScreenState();
}

class _AddYourDetailsScreenState extends State<AddYourDetailsScreen> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordValid = false;
  bool containsNumber = false;
  bool containsSymbol = false;
  bool hasMinLength = false;
  bool showPassword = false; // Added for password visibility

  void _validatePassword(String value) {
    setState(() {
      hasMinLength = value.length >= 8;
      containsNumber = value.contains(RegExp(r'\d'));
      containsSymbol = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      isPasswordValid = hasMinLength && containsNumber && containsSymbol;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: 'Add your details 3 / 4',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const DotsIndicator(itemCount: 4, currentIndex: 2),
            const VerticalSpacing(32),
            AppTextFormField(
              controller: mobileController,
              labelText: 'Enter mobile number',
              maxLength: 11,
              validator: ValidationBuilder().required().phone().build(),
            ),
            const VerticalSpacing(16),
            AppTextFormField(
              controller: emailController,
              labelText: 'Enter email address',
              validator: ValidationBuilder().required().email().build(),
            ),
            const VerticalSpacing(16),
            AppTextFormField(
              controller: passwordController,
              labelText: 'Enter password',
              obscureText: !showPassword,
              onChanged: _validatePassword,
              validator: ValidationBuilder().required().build(),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: showPassword
                    ? Assets.images.eyeClose.svg()
                    : Assets.images.eyeOpen.svg(),
              ),
            ),
            const VerticalSpacing(16),
            SizedBox(
              height: 8,
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(20),
                value: isPasswordValid
                    ? 1.0
                    : (hasMinLength ? 0.33 : 0.0) +
                        (containsNumber ? 0.33 : 0.0) +
                        (containsSymbol ? 0.33 : 0.0),
                backgroundColor: AppColors.colorEDECEF,
                color: isPasswordValid
                    ? AppColors.color279627 // Green for valid password
                    : hasMinLength && (containsNumber || containsSymbol)
                        ? AppColors
                            .colorFFB032 // Orange for partially valid password
                        : AppColors.colorC03A31, // Red for invalid password
              ),
            ),
            const VerticalSpacing(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildValidationItem('8 characters minimum', hasMinLength),
                const VerticalSpacing(2),
                _buildValidationItem('a number', containsNumber),
                const VerticalSpacing(2),
                _buildValidationItem('a symbol', containsSymbol),
              ],
            ),
            const VerticalSpacing(16),
            AppOutlinedButton(
              text: 'Next',
              onPressed: isPasswordValid
                  ? () {
                      Get.toNamed(AppRoutes.addYourOccupation);
                    }
                  : null, // Disable button if password is invalid
            ),
          ],
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
