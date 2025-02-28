import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/core/routes/app_routes.dart';
import 'package:empowered/features/common/app_outlined_button.dart';
import 'package:empowered/features/common/app_scaffold.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/common/app_text_button.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Assets.images.explainerOne.provider(),
              ),
            ),
          ),

          // Grey shader overlay
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                color:
                    Colors.black.withOpacity(0.66), // Adjust opacity as needed
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            top: 122,
            child: Assets.images.appLogo.image(height: 123.h),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const IgnorePointer(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Welcome To\nEmpowered Man!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorWhite,
                        ),
                      ),
                      VerticalSpacing(12),
                      Text(
                        'Your personal fitness AI Assistant 🤖',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textColor50,
                        ),
                      ),
                      VerticalSpacing(32),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 76),
                child: AppOutlinedButton(
                  safePadding: true,
                  text: 'Get Started',
                  onPressed: () {
                    Get.toNamed(AppRoutes.signup);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have account?',
                    style: AppTextStyles.textBodyB2,
                  ),
                  AppTextButton(
                    label: 'Sign In',
                    onTap: () {
                      Get.toNamed(AppRoutes.loginPage);
                    },
                  ),
                ],
              ),
              VerticalSpacing(
                MediaQuery.of(context).viewPadding.bottom + 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
