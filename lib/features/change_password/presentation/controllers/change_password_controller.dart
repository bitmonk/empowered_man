import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/change_password/data/source/change_password_remote_source.dart';

class ChangePasswordController extends GetxController {
  ChangePasswordController({required this.remoteSource});
  final ChangePasswordRemoteSource remoteSource;
  Rx<TheStates> changePasswordState = TheStates.initial.obs;
  CancelToken? _cancelToken;

  late TextEditingController newPassword;
  late TextEditingController confirmNewPassword;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isUpperCaseValid = false.obs;
  RxBool isNumberValid = false.obs;
  RxBool isLengthValid = false.obs;

  RxBool isPaswordMatched = false.obs;

  String? validatePassword(String value) {
    var hasUpperCase = RegExp('[A-Z]').hasMatch(value);
    var hasNumber = RegExp('[0-9]').hasMatch(value);
    var hasMinLength = value.length >= 8;
    isUpperCaseValid.value = hasUpperCase;
    isNumberValid.value = hasNumber;
    isLengthValid.value = hasMinLength;

    return null;
  }

  void isMatchWithNewPassword() {
    isPaswordMatched.value = newPassword.text == confirmNewPassword.text;
  }

  Future<void> changePassword() async {
    changePasswordState.value = TheStates.loading;
    _cancelToken = CancelToken();

    if (!formKey.currentState!.validate()) return;

    if (!isUpperCaseValid.value ||
        !isNumberValid.value ||
        !isLengthValid.value) {
      changePasswordState.value = TheStates.error;
      AppUtils.showErrorSnackbar(
        message:
            'Password must contain uppercase letter, number and minimum 8 characters',
      );
      return;
    }

    try {
      debugPrint('Calling changePassword API...');
      final result = await remoteSource.changePassword(
        newPassword: newPassword.text,
        newPasswordConfirmation: confirmNewPassword.text,
        cancelToken: _cancelToken,
      );

      result.fold(
        (error) {
          debugPrint('API Error: ${error.message}');
          changePasswordState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (message) {
          debugPrint('API Success: $message');
          Get
            ..back()
            ..rawSnackbar(
              message: message,
              backgroundColor: Colors.green,
            );
        },
      );
    } catch (e) {
      debugPrint('Exception: $e');
      changePasswordState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: e.toString());
    } finally {
      changePasswordState.value = TheStates.initial;
    }
  }

  @override
  void onInit() {
    super.onInit();
    newPassword = TextEditingController();
    confirmNewPassword = TextEditingController();
  }

  void cancelRequest() {
    _cancelToken?.cancel();
    changePasswordState.value = TheStates.initial;
  }

  @override
  void onClose() {
    newPassword.dispose();
    confirmNewPassword.dispose();
    super.onClose();
  }
}
