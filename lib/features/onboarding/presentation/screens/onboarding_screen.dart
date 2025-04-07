import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/core/preferences/preferences.dart';
import 'package:empowered/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool showIntroScreen = true;
  final OnboardingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: showIntroScreen
          ? _buildIntroScreen(context)
          : _buildOnboardingPages(context),
    );
  }

  /// **1️⃣ First Screen (Welcome)**
  Widget _buildIntroScreen(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Assets.images.explainerOne.provider(),
            ),
          ),
        ),
        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.66),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
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
                    'Your personal power weapon',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 76),
              child: AppOutlinedButton(
                safePadding: true,
                text: 'Get Started',
                onPressed: () {
                  setState(() {
                    showIntroScreen = false;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: AppTextStyles.textBodyB2,
                ),
                AppTextButton(
                  label: 'Sign In',
                  onTap: () {
                    Get.find<Preferences>().saveIsFirstRun();
                    Get.offAllNamed(AppRoutes.loginPage);
                  },
                ),
              ],
            ),
            VerticalSpacing(MediaQuery.of(context).viewPadding.bottom + 12),
          ],
        ),
      ],
    );
  }

  /// **2️⃣ Onboarding Pages**
  Widget _buildOnboardingPages(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          PageView.builder(
            itemCount: controller.images.length,
            controller: controller.pageController,
            onPageChanged: controller.changeIndex,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: controller.images[index],
                ),
              ),
            ),
          ),
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.66),
              ),
            ),
          ),
          Positioned(
            right: 24,
            top: MediaQuery.of(context).viewPadding.top + 12,
            child: InkWell(
              onTap: () {
                Get.find<Preferences>().saveIsFirstRun();
                Get.offAllNamed(AppRoutes.landingScreen);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff323940),
                  borderRadius: BorderRadius.circular(24),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor50,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IgnorePointer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Text(
                        controller.titles[controller.currentIndex.value],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorWhite,
                        ),
                      ),
                      const VerticalSpacing(12),
                      Text(
                        controller.descriptions[controller.currentIndex.value],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.textColor50,
                        ),
                      ),
                      const VerticalSpacing(32),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 76),
                child: AppOutlinedButton(
                  safePadding: true,
                  text: controller.currentIndex.value >=
                          controller.titles.length - 2
                      ? 'Done'
                      : 'Next',
                  onPressed: controller.nextIndex,
                ),
              ),
              SmoothPageIndicator(
                controller: controller.pageController,
                count: controller.titles.length - 1,
                effect: ExpandingDotsEffect(
                  expansionFactor: 1.1,
                  dotHeight: 8.h,
                  dotWidth: 8.h,
                  dotColor: AppColors.color9FAAB3,
                  activeDotColor: AppColors.textColor50,
                ),
              ),
              VerticalSpacing(MediaQuery.of(context).viewPadding.bottom + 12),
            ],
          ),
        ],
      ),
    );
  }
}
