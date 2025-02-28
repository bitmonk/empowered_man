import 'package:empowered/features/edit_profile/data/source/edit_profile_remote_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  EditProfileController({required this.remoteSource});

  final EditProfileRemoteSource remoteSource;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController mobileNumberController;
  late TextEditingController occupationController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController(text: 'John Doe');
    emailController = TextEditingController(text: 'empoweredman@gmail.com');
    mobileNumberController = TextEditingController(text: '61283291392');
    occupationController = TextEditingController(text: 'Computer Engineer');
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    mobileNumberController.dispose();
    occupationController.dispose();
    super.onClose();
  }
}
