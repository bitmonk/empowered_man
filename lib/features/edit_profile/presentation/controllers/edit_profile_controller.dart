import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/edit_profile/data/source/edit_profile_remote_source.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';

class EditProfileController extends GetxController {
  EditProfileController({required this.remoteSource});

  final EditProfileRemoteSource remoteSource;
  Rx<TheStates> editProfileState = TheStates.initial.obs;

  CancelToken? _cancelToken;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController mobileNumberController;
  late TextEditingController occupationController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Reactive states
  final _profileController = Get.find<ProfileController>();

  final RxBool isFormValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController(
      text: _profileController.userProfile.value.fullName ?? '',
    );
    emailController = TextEditingController(
      text: _profileController.userProfile.value.email ?? '',
    );
    mobileNumberController = TextEditingController(
      text: _profileController.userProfile.value.phoneNumber ?? ' ',
    );
    occupationController = TextEditingController(
      text: _profileController.userProfile.value.occupation ?? '',
    );

    // Add listeners for real-time validation
    nameController.addListener(() {
      _validateForm();
    });
    emailController.addListener(() {
      _validateForm();
    });
    mobileNumberController.addListener(() {
      _validateForm();
    });
    occupationController.addListener(() {
      _validateForm();
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    mobileNumberController.dispose();
    occupationController.dispose();
    _cancelToken?.cancel();
    super.onClose();
  }

  bool _validateForm() {
    final isValid = formKey.currentState?.validate() ?? false;
    isFormValid.value = isValid;
    return isValid;
  }

  Future<void> updateProfile() async {
    editProfileState.value = TheStates.loading;
    _cancelToken = CancelToken();
    if (!isFormValid.value) return;

    try {
      final result = await remoteSource.updateProfile(
        name: nameController.text,
        email: emailController.text,
        phone: mobileNumberController.text,
        occupation: occupationController.text,
      );

      result.fold(
        (l) {
          editProfileState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
          return false;
        },
        (r) async {
          AppUtils.showSnackbar(message: r);
          editProfileState.value = TheStates.success;
          await _profileController.getUserProfile();
          return true;
        },
      );
    } catch (e) {
      editProfileState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: e.toString());
    } finally {
      editProfileState.value = TheStates.initial;
    }
  }

  void cancelRequest() {
    _cancelToken?.cancel();
    editProfileState.value = TheStates.initial;
  }
}
