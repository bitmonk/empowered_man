import 'package:empowered/core/device_info/device_info.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/login/data/source/login_remote_source.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_bindings.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter/foundation.dart';

class LoginController extends GetxController {
  LoginController({required this.remoteSource});
  final LoginRemoteSource remoteSource;
  RxBool showPassword = false.obs;
  RxBool rememberMe = false.obs;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<String?> loginError = Rx<String?>(null);
  @override
  void onInit() {
    super.onInit();

    if (kDebugMode) {
      emailController =
          TextEditingController(text: 'socialanjalithapa@gmail.com');
      passwordController = TextEditingController(text: 'Test@123');
    } else {
      emailController = TextEditingController();
      passwordController = TextEditingController();
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  Rx<TheStates> logginInState = TheStates.initial.obs;
  CancelToken? _cancelToken;

  Future<bool> login() async {
    ProfileInitializer.initialize();

    logginInState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final deviceidprint = await getUniqueDeviceId();
    final result = await remoteSource.login(
      email: emailController.text,
      password: passwordController.text,
      cancelToken: _cancelToken,
      deviceId: await getUniqueDeviceId(),
      deviceType: deviceType,
    );
    return result.fold(
      (l) {
        AppUtils.showErrorSnackbar(message: l.message);
        loginError.value = l.message;
        logginInState.value = TheStates.error;
        return false;
      },
      (r) async {
        AppWidgetKey.bottomBarController.jumpToTab(0);
        logginInState.value = TheStates.success;
        // AppUtils.showErrorSnackbar(message: r);
        return true;
      },
    );
  }

  void toggleVisibility() {
    showPassword.value = !showPassword.value;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }
}
