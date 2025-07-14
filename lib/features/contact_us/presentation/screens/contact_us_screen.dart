import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/contact_us/presentation/controllers/contact_us_controller.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:form_validator/form_validator.dart';

class ContactUsScreen extends GetView<ContactUsController> {
  ContactUsScreen({
    required this.name,
    required this.message,
    required this.email,
    super.key,
  });

  final String email;
  final String name;
  final String message;

  @override
  final controller = Get.find<ContactUsController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.isRequestCancelled) {
          return false;
        }
        controller.cancelRequests(contactUs: true);

        return true;
      },
      child: AppScaffold(
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
                      // validator: ValidationBuilder().required().build(),
                      controller: TextEditingController(
                          text: Get.find<ProfileController>()
                              .userProfile
                              .value
                              .fullName,),
                      isReadOnly: true,
                      labelText: 'Your Name',
                      hintText: Get.find<ProfileController>()
                          .userProfile
                          .value
                          .fullName,
                    ),
                    const VerticalSpacing(20),
                    AppTextFormField(
                      // validator: ValidationBuilder().email().build(),
                      controller: TextEditingController(
                          text: Get.find<ProfileController>()
                              .userProfile
                              .value
                              .email,),
                      isReadOnly: true,

                      labelText: 'Your Email',
                      hintText:
                          Get.find<ProfileController>().userProfile.value.email,
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
                      isLoading:
                          controller.contactUsState.value == TheStates.loading,
                      onPressed:
                          controller.contactUsState.value != TheStates.loading
                              ? () async {
                                  // if (!AppUtils.validateForm(controller.formKey)) {
                                  //   return;
                                  // }
                                  // UiHelper.showloaderdialog(context);
                                  // await Future.delayed(const Duration(seconds: 2));
                                  // Navigator.pop(Get.overlayContext!);
                                  await controller.sendInquiryEmail(
                                    controller.nameController.text,
                                    controller.emailController.text,
                                    controller.messageController.text,
                                  );
                                  controller.contactUsState.value =
                                      TheStates.initial;
                                  // if (context.mounted) {
                                  //   Navigator.pop(context);
                                  // }
                                }
                              : null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
