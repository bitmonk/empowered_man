import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/login/presentation/controllers/login_bindings.dart';
import 'package:empowered/features/login/presentation/controllers/login_controller.dart';
import 'package:empowered/features/notification/presentation/controller/notification_bindings.dart';
import 'package:empowered/features/notification/presentation/screen/notification_screen.dart';
import 'package:empowered/features/signup/presentation/controller/signup_controller.dart';
import 'package:empowered/features/signup/presentation/widgets/dots_indicator.dart';
import 'package:empowered/utlis/navigation_helper.dart';
import 'package:form_validator/form_validator.dart';

class AddYourOccupation extends StatefulWidget {
  const AddYourOccupation({super.key});

  @override
  State<AddYourOccupation> createState() => _AddYourOccupationState();
}

class _AddYourOccupationState extends State<AddYourOccupation> {
  bool _isButtonEnabled = false;
  final controller = Get.find<SignupController>();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void _occupationListener() {
    setState(() {
      _isButtonEnabled = controller.occupationController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    LoginInitializer.destroy();
    LoginInitializer.initialize();

    // Set initial button state based on current text
    _isButtonEnabled = controller.occupationController.text.isNotEmpty;

    // Add a listener to the controller to monitor changes
    controller.occupationController.addListener(_occupationListener);
  }

  @override
  void dispose() {
    controller.occupationController.removeListener(_occupationListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.cancelRequest();
        Get.back();
        return true;
      },
      child: AppScaffold(
        appBar: CustomAppBar(
          title: 'Add your occupation 4 / 4',
          onTap: () {
            controller.cancelRequest();
            Get.back();
          },
        ),
        body: Obx(
          () => Form(
            key: formkey,
            child: SingleChildScrollView(
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
                    controller: controller.occupationController,
                    labelText: 'Enter occupation',
                    validator: ValidationBuilder().required().build(),
                  ),
                  const VerticalSpacing(16),
                  AppOutlinedButton(
                    text: 'Done',
                    isLoading:
                        controller.signUpState.value == TheStates.loading ||
                            Get.find<LoginController>().logginInState.value ==
                                TheStates.loading,
                    onPressed: _isButtonEnabled
                        ? () async {
                            if (formkey.currentState!.validate()) {
                              controller.signUpRequestData.value.occupation =
                                  controller.occupationController.text;
                              var a = await controller.register();
                              if (a == true) {
                                Get.find<LoginController>()
                                        .emailController
                                        .text =
                                    controller.signUpRequestData.value.email!;
                                Get.find<LoginController>()
                                        .passwordController
                                        .text =
                                    controller
                                        .signUpRequestData.value.password!;
                                var login =
                                    await Get.find<LoginController>().login();
                                if (login) {
                                  NotificationInitializer.destroy();
                                  NotificationInitializer.initialize();
                                  NavigationHelper.navigateWithFadeTransition(
                                    context,
                                    const NotificationScreen(true),
                                  );
                                }
                              }
                            } else {
                              AppUtils.showErrorSnackbar(message: 'Required');
                            }
                          }
                        : null,
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
