import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_outlined_button.dart';
import 'package:empowered/features/common/app_scaffold.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/common/app_text_button.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSuccessScreenParam {
  AppSuccessScreenParam({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.buttonText,
    this.width = 300,
    this.secondarybuttonText,
    this.secondaryOnPressed,
    this.secondaryButton = false,
    this.popRouteName,
    this.onPressed,
  });

  final String title;
  final String subtitle;
  final String image;
  final String buttonText;
  final String? secondarybuttonText;
  final String? popRouteName;
  final bool secondaryButton;
  final double width;
  final void Function(BuildContext context)? onPressed;
  final void Function(BuildContext context)? secondaryOnPressed;
}

class AppSuccessScreen extends StatefulWidget {
  const AppSuccessScreen({super.key});

  @override
  State<AppSuccessScreen> createState() => _AppSuccessScreenState();
}

class _AppSuccessScreenState extends State<AppSuccessScreen> {
  final AppSuccessScreenParam param = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const VerticalSpacing(56),
              Center(
                child: Image.asset(
                  param.image,
                  width: param.width,
                ),
              ),
              Text(
                param.title,
                style: AppTextStyles.titleSm,
              ),
              const VerticalSpacing(20),
              Text(
                param.subtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLGRegular.copyWith(
                  color: AppColors.neutral600,
                ),
              ),
              const VerticalSpacing(32),
              AppOutlinedButton(
                text: param.buttonText,
                onPressed: () {
                  if (param.popRouteName != null) {
                    Navigator.popUntil(
                      context,
                      (route) => route.settings.name == param.popRouteName,
                    );
                  } else {
                    param.onPressed?.call(context);
                  }
                },
              ),
              if (param.secondarybuttonText != null)
                if (param.secondaryButton)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: AppOutlinedButton.white(
                      text: param.secondarybuttonText!,
                      onPressed: () {
                        param.secondaryOnPressed?.call(context);
                      },
                    ),
                  )
                else
                  AppTextButton(
                    label: param.secondarybuttonText!,
                    onTap: () {
                      param.secondaryOnPressed?.call(context);
                    },
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                  ),
              const VerticalSpacing(20),
            ],
          ),
        ),
      ),
    );
  }
}
