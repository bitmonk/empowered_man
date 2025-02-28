import 'package:empowered/features/help/data/source/help_remote_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpController extends GetxController {
  HelpController({required this.remoteSource});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController writeProblemController = TextEditingController();

  final HelpRemoteSource remoteSource;
  @override
  void onClose() {
    titleController.dispose();
    writeProblemController.dispose();
  }
}
