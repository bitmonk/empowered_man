import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/contact_us/data/source/contact_us_remote_source.dart';

class ContactUsController extends GetxController {
  ContactUsController({required this.remoteSource});
  final ContactUsRemoteSource remoteSource;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController messageController;
  CancelToken? _cancelToken;
  Rx<TheStates> contactUsState = TheStates.initial.obs;
  bool get isRequestCancelled => _cancelToken?.isCancelled ?? false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    messageController = TextEditingController();
  }

  Future<void> sendInquiryEmail(
    String name,
    String email,
    String message,
  ) async {
    contactUsState.value = TheStates.loading;
    _cancelToken = CancelToken();

    final result = await remoteSource.contactUsDetails(
      name: name,
      email: email,
      message: message,
      cancelToken: _cancelToken,
    );

    result.fold(
      (l) {
        contactUsState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) {
        contactUsState.value = TheStates.success;
        AppUtils.showSnackbar(message: 'Your inquiry was send through email.');
        Get.offNamed(
          AppRoutes.profile,
        );
      },
    );
  }

  void cancelRequests({
    bool contactUs = false,
  }) {
    _cancelToken?.cancel();
    _cancelToken = null;

    if (contactUs) contactUsState.value = TheStates.initial;
  }

  @override
  void onClose() {
    _cancelToken?.cancel();
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
  }
}
