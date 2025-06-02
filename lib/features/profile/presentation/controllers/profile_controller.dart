import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/profile/data/model/user_profile_model.dart';
import 'package:empowered/features/profile/data/source/profile_remote_source.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  ProfileController({required this.remoteSource});
  final ProfileRemoteSource remoteSource;

  Rx<UserProfileModel> userProfile = const UserProfileModel().obs;
  Rx<TheStates> userProfileState = TheStates.initial.obs;

  CancelToken? _cancelToken;
  Rx<XFile?> selectedImage = Rx<XFile?>(null);
  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }

  Future<bool?> uploadProfile() async {
    userProfileState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.updateProfileImage(
      profilePhotoPath: selectedImage.value?.path,
      cancelToken: _cancelToken,
    );

    var res = result.fold(
      (l) {
        userProfileState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        userProfileState.value = TheStates.success;
        selectedImage.value = null;
        AppUtils.showSnackbar(
          message: r,
        );
        getUserProfile();
        return true;
      },
    );
    return res;
  }

  Future<bool?> deleteProfile() async {
    userProfileState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.deleteProfileImage(
      cancelToken: _cancelToken,
    );

    var res = result.fold(
      (l) {
        userProfileState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        userProfileState.value = TheStates.success;
        getUserProfile();
        AppUtils.showSnackbar(
          message: r,
        );

        return true;
      },
    );
    return res;
  }

  Future<bool?> getUserProfile() async {
    userProfileState.value = TheStates.loading;
    // _cancelToken = CancelToken();
    final result = await remoteSource.getProfile(
        // cancelToken: _cancelToken,
        );
    var res = result.fold(
      (l) {
        userProfileState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        userProfile.value = r;
        userProfileState.value = TheStates.success;
        if (userProfile.value.image != null) {
          selectedImage.value = null;
        }
        print('User profile fetched: ${r.slug},${r.agoraUserToken}');
        return true;
      },
    );
    return res;
  }

  void cancelRequest() {
    _cancelToken?.cancel();
    userProfileState.value = TheStates.initial;
  }

  @override
  void onClose() {
    _cancelToken?.cancel(); // Cancel any ongoing requests
    super.onClose();
  }
}
