import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/edit_profile/presentation/controllers/edit_profile_controller.dart';
import 'package:empowered/utlis/uihelper.dart';
import 'package:form_validator/form_validator.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditProfileScreen> {
  final controller = Get.find<EditProfileController>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'Edit Profile',
        onTap: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              AppTextFormField(
                controller: controller.nameController,
                hintText: 'Name',
                labelText: 'Name',
                validator: ValidationBuilder().required().build(),
              ),
              const VerticalSpacing(20),
              AppTextFormField(
                hintText: 'Email@gmail.com',
                validator: ValidationBuilder().email().build(),
                controller: controller.emailController,
                labelText: 'Email',
              ),
              const VerticalSpacing(20),
              AppTextFormField(
                controller: controller.mobileNumberController,
                hintText: '+01 234 567 89',
                labelText: 'Mobile number',
                maxLength: 11,
                validator: ValidationBuilder().required().build(),
              ),
              const VerticalSpacing(20),
              AppTextFormField(
                hintText: 'Occupation',
                controller: controller.occupationController,
                labelText: 'Occupation',
                validator: ValidationBuilder().required().build(),
              ),
              const VerticalSpacing(20),
              AppOutlinedButton(
                text: 'Save',
                onPressed: () async {
                  if (!AppUtils.validateForm(controller.formKey)) {
                    return;
                  }
                  UiHelper.showloaderdialog(context);
                  await Future.delayed(const Duration(seconds: 1));
                  Navigator.pop(Get.overlayContext!);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
