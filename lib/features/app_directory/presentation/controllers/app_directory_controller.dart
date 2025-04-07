import 'package:empowered/enum/the_states.dart';
import 'package:empowered/features/app_directory/data/model/privacy_policy_model.dart';
import 'package:empowered/features/app_directory/data/source/app_directory_remote_source.dart';
import 'package:empowered/utlis/app_utils.dart';
import 'package:get/get.dart';

class AppDirectoryController extends GetxController {
  AppDirectoryController({required this.remoteSource});
  final AppDirectoryRemoteSource remoteSource;
  Rx<PrivacyPolicyData> privacyPolicy = const PrivacyPolicyData().obs;
  Rx<PrivacyPolicyData> termsAndConditions = const PrivacyPolicyData().obs;
  Rx<PrivacyPolicyData> communityGuidelines = const PrivacyPolicyData().obs;

  Rx<TheStates> privacyPolicyState = TheStates.initial.obs;

  Future<void> getPrivacyPolicy() async {
    privacyPolicyState.value = TheStates.loading;
    final result = await remoteSource.getPrivacyPolicyDetails();
    result.fold(
      (l) {
        privacyPolicyState.value = TheStates.error;
        AppUtils.showErrorSnackbar(
          message: l.message,
        );
      },
      (r) {
        if (r.privacyPolicyData != null) {
          privacyPolicy.value = r.privacyPolicyData!;
          privacyPolicyState.value = TheStates.success;
        }
      },
    );
  }

  Future<void> getTermsAndConditions() async {
    privacyPolicyState.value = TheStates.loading;
    final result = await remoteSource.getTermConditionsDetails();
    result.fold(
      (l) {
        privacyPolicyState.value = TheStates.error;
        AppUtils.showErrorSnackbar(
          message: l.message,
        );
      },
      (r) {
        privacyPolicyState.value = TheStates.success;
        if (r.privacyPolicyData != null) {
          termsAndConditions.value = r.privacyPolicyData!;
        }
      },
    );
  }

  Future<void> getCommunityGuide() async {
    privacyPolicyState.value = TheStates.loading;
    final result = await remoteSource.getGuidelinesDetails();
    result.fold(
      (l) {
        privacyPolicyState.value = TheStates.error;
        AppUtils.showErrorSnackbar(
          message: l.message,
        );
      },
      (r) {
        if (r.privacyPolicyData != null) {
          communityGuidelines.value = r.privacyPolicyData!;
          privacyPolicyState.value = TheStates.success;
        }
      },
    );
  }
}
