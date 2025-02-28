import 'package:empowered/features/common/app_outlined_button.dart';
import 'package:empowered/features/common/app_scaffold.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/common/app_text_form_field.dart';
import 'package:empowered/features/common/custom_app_bar.dart';
import 'package:empowered/features/notification/presentation/controller/notification_bindings.dart';
import 'package:empowered/features/notification/presentation/screen/notification_screen.dart';
import 'package:empowered/features/signup/presentation/widgets/dots_indicator.dart';
import 'package:empowered/utlis/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class AddYourOccupation extends StatefulWidget {
  const AddYourOccupation({super.key});

  @override
  State<AddYourOccupation> createState() => _AddYourOccupationState();
}

class _AddYourOccupationState extends State<AddYourOccupation> {
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
      appBar: const CustomAppBar(
        title: 'Add your occupation 4 / 4',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            const DotsIndicator(itemCount: 4, currentIndex: 3),
            const VerticalSpacing(32),
            AppTextFormField(
              controller: nameController, // Attach the controller
              labelText: 'Enter occupation',
              validator: ValidationBuilder().required().build(),
            ),
            const VerticalSpacing(16),
            AppOutlinedButton(
              text: 'Done',
              onPressed: _isButtonEnabled
                  ? () {
                      NotificationInitializer.destroy();
                      NotificationInitializer.initialize();
                      NavigationHelper.navigateWithFadeTransition(
                          context, const NotificationScreen(true),);
                    }
                  : null, // Disable the button when the field is empty
            ),
          ],
        ),
      ),
    );
  }
}
