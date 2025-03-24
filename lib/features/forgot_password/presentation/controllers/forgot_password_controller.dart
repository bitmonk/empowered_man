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
}
