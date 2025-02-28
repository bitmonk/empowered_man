import 'package:empowered/features/change_password/data/source/change_password_remote_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  ChangePasswordController({required this.remoteSource});
  final ChangePasswordRemoteSource remoteSource;
  late TextEditingController newPassword;
  late TextEditingController confirmNewPassword;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isUpperCaseValid = false.obs;
  RxBool isNumberValid = false.obs;
  RxBool isLengthValid = false.obs;

  RxBool isPaswordMatched = false.obs;
  String? validatePassword(String value) {
    var hasUpperCase = RegExp('[A-Z]').hasMatch(value);
    var hasNumber = RegExp('[0-9]').hasMatch(value);
    var hasMinLength = value.length >= 8;
    isUpperCaseValid.value = hasUpperCase;
    isNumberValid.value = hasNumber;
    isLengthValid.value = hasMinLength;

    return null;
  }

  void isMatchWithNewPassword() {
    isPaswordMatched.value = newPassword.text == confirmNewPassword.text;
  }

  @override
  void onInit() {
    super.onInit();
    newPassword = TextEditingController();
    confirmNewPassword = TextEditingController();
  }

  @override
  void onClose() {
    newPassword.dispose();
    confirmNewPassword.dispose();
  }
}
