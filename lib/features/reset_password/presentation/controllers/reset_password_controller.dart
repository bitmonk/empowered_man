import 'package:empowered/features/reset_password/data/source/reset_password_remote_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  ResetPasswordController({required this.remoteSource});
  final ResetPasswordRemoteSource remoteSource;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  RxBool showPassword = false.obs;
  RxBool showConfirmPassword = false.obs;
  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void togglePassVisibility() {
    showPassword.value = !showPassword.value;
  }

  void toggleConfirmVisibility() {
    showConfirmPassword.value = !showConfirmPassword.value;
  }
}
