import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/signup/data/model/signup_model.dart';
import 'package:empowered/features/signup/data/model/signup_request_model.dart';
import 'package:empowered/features/signup/data/source/signup_remote_source.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController {
  SignupController({required this.remoteSource});
  final SignupRemoteSource remoteSource;
  Rx<TheStates> signUpState = TheStates.initial.obs;
  CancelToken? _cancelToken;

  Rx<SignupRequestModel> signUpRequestData = SignupRequestModel().obs;
  Rx<XFile?> selectedImage = Rx<XFile?>(null);
  Rx<SignupModel> signUpModel = const SignupModel().obs;

  Future<bool?> register() async {
    signUpState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.signUp(
      signUpRequestModel: signUpRequestData.value,
      profilePhotoPath: selectedImage.value?.path,
      cancelToken: _cancelToken,
    );

    var res = result.fold(
      (l) {
        signUpState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        signUpModel.value = r;
        signUpState.value = TheStates.success;
        return true;
      },
    );
    return res;
  }
}
