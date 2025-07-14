import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/forgot_password/data/source/forgot_password_remote_source.dart';

class ForgotPasswordController extends GetxController {
  ForgotPasswordController({required this.remoteSource});
  final ForgotPasswordRemoteSource remoteSource;
  late TextEditingController emailController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  Rx<TheStates> forgotPasswordState = TheStates.initial.obs;
  CancelToken? _cancelToken;

  Future<bool> forgotPassword() async {
    forgotPasswordState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.forgotPassword(
        email: emailController.text, cancelToken: _cancelToken,);
    return result.fold(
      (l) {
        AppUtils.showErrorSnackbar(message: l.message);
        forgotPasswordState.value = TheStates.error;
        return false;
      },
      (r) {
        forgotPasswordState.value = TheStates.success;
        // AppUtils.showErrorSnackbar(message: r);
        AppUtils.showSnackbar(
          message: 'Please check your email to reset your password',
        );
        return true;
      },
    );
  }
}
