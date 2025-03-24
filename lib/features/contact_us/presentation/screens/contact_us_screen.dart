import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/contact_us/presentation/controllers/contact_us_controller.dart';
import 'package:empowered/utlis/uihelper.dart';
import 'package:form_validator/form_validator.dart';

class ContactUsScreen extends GetView<ContactUsController> {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'Contact Us',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextFormField(
                    validator: ValidationBuilder().required().build(),
                    controller: controller.nameController,
                    labelText: 'Your Name',
                    hintText: 'test',
                  ),
                  const VerticalSpacing(20),
                  AppTextFormField(
                    validator: ValidationBuilder().email().build(),
                    controller: controller.emailController,
                    labelText: 'Your Email',
                    hintText: 'Email@gmail.com',
                  ),
                  const VerticalSpacing(20),
                  AppTextFormField(
                    validator: ValidationBuilder().required().build(),
                    maxLines: 3,
                    controller: controller.messageController,
                    labelText: 'Your Message',
                    hintText: 'Write Message',
                  ),
                  const VerticalSpacing(20),
                  AppOutlinedButton(
                    text: 'Send Now',
                    onPressed: () async {
                      if (!AppUtils.validateForm(controller.formKey)) {
                        return;
                      }
                      UiHelper.showloaderdialog(context);
                      await Future.delayed(const Duration(seconds: 2));
                      Navigator.pop(Get.overlayContext!);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
