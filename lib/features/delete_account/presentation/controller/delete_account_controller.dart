import 'package:empowered/features/delete_account/data/source/delete_account_remote_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountController extends GetxController {
  DeleteAccountController({required this.remoteSource});
  final DeleteAccountRemoteSource remoteSource;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController messageController;
  RxBool showPassword = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    messageController = TextEditingController();
  }

  void toggleVisibility() {
    showPassword.value = !showPassword.value;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
  }
}
