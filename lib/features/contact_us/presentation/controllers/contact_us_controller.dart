import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/contact_us/data/source/contact_us_remote_source.dart';

class ContactUsController extends GetxController {
  ContactUsController({required this.remoteSource});
  final ContactUsRemoteSource remoteSource;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController messageController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
  }
}
