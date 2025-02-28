import 'package:empowered/features/common/app_loading_widget.dart';
import 'package:flutter/material.dart';

class UiHelper {
  static void showloaderdialog(BuildContext context, {bool canPop = false}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const AppLoadingWidget.small();
      },
    );
  }
}
