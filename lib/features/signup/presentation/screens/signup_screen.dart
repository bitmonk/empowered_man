import 'package:empowered/core/routes/app_routes.dart';
import 'package:empowered/features/common/app_outlined_button.dart';
import 'package:empowered/features/common/app_scaffold.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/common/app_text_form_field.dart';
import 'package:empowered/features/common/custom_app_bar.dart';
import 'package:empowered/features/signup/presentation/widgets/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    // Add a listener to the controller to monitor changes
    nameController.addListener(() {
      setState(() {
        _isButtonEnabled = nameController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'Add your name 1 / 4',
        hideLeading: !Navigator.canPop(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            const DotsIndicator(itemCount: 4, currentIndex: 0),
            const VerticalSpacing(32),
            AppTextFormField(
              controller: nameController, // Attach the controller
              labelText: 'Enter name',
              validator: ValidationBuilder().required().build(),
            ),
            const VerticalSpacing(16),
            AppOutlinedButton(
              text: 'Next',
              onPressed: _isButtonEnabled
                  ? () {
                      Get.toNamed(AppRoutes.addYourPhotoScreen);
                    }
                  : null, // Disable the button when the field is empty
            ),
          ],
        ),
      ),
    );
  }
}
