import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/login/data/source/login_remote_source.dart';
import 'package:flutter/foundation.dart';

class LoginController extends GetxController {
  LoginController({required this.remoteSource});
  final LoginRemoteSource remoteSource;
  RxBool showPassword = false.obs;
  RxBool rememberMe = false.obs;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      emailController = TextEditingController(text: 'kebokew783@rinseart.com');
      passwordController = TextEditingController(text: 'Rochak@123');
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

  Future<bool> login({required String email, required String password}) async {
    final result = await remoteSource.login(email: email, password: password);
    return result.fold(
      (l) {
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
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
