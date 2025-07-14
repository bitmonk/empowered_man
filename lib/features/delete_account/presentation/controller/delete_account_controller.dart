import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/delete_account/data/source/delete_account_remote_source.dart';

class DeleteAccountController extends GetxController {
  DeleteAccountController({required this.remoteSource});
  final DeleteAccountRemoteSource remoteSource;
  late TextEditingController passwordController;
  late TextEditingController messageController;
  RxBool showPassword = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<TheStates> deleteAccountState = TheStates.initial.obs;
  CancelToken? _cancelToken;
  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    messageController = TextEditingController();
  }

  Future<bool?> deleteAccount() async {
    deleteAccountState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.deleteAccount(
      password: passwordController.text,
      reasonForDeletion: messageController.text,
      cancelToken: _cancelToken,
    );

    var res = result.fold(
      (l) {
        deleteAccountState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        deleteAccountState.value = TheStates.success;
        AppUtils.showSnackbar(
          message: 'Your account is deleted successfully.',
        );
        return true;
      },
    );
    return res;
  }

  void toggleVisibility() {
    showPassword.value = !showPassword.value;
  }

  void cancelRequest() {
    _cancelToken?.cancel();
    deleteAccountState.value = TheStates.initial;
  }

  @override
  void onClose() {
    passwordController.dispose();
    messageController.dispose();
  }
}
