import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/core/preferences/preferences.dart';
import 'package:empowered/features/onboarding/data/source/onboarding_remote_source.dart';

class OnboardingController extends GetxController {
  OnboardingController({required this.remoteSource});

  final OnboardingRemoteSource remoteSource;
  final PageController pageController = PageController();
  RxInt currentIndex = 0.obs;

  List<String> titles = [
    'Upgrade yourself',
    'Build Powerful Habits',
    'Join an ELITE Tribe',
    '',
  ];

  List<String> descriptions = [
    'Earn points to level up and win at life.',
    'Stay consistent with checklists and unlock rewards to create lasting change.',
    'Connect with a community of high-performing men, including world-class experts & coaches.',
    '',
  ];

  List<ImageProvider<Object>> images = [
    Assets.images.explainerTwo.provider(),
    Assets.images.explainerThree.provider(),
    Assets.images.explainerFour.provider(),
    Assets.images.explainerFour.provider(),
  ];

  void nextIndex() {
    final nextIndex = (pageController.page?.toInt() ?? 0) + 1;
    if (nextIndex < titles.length) {
      currentIndex.value = nextIndex;
      pageController.animateToPage(
        nextIndex,
        curve: Curves.linear,
        duration: const Duration(milliseconds: 300),
      );
    } else {
      Get.find<Preferences>().saveIsFirstRun();
      Get.offAllNamed(AppRoutes.signup);
    }
  }

  void changeIndex(int index) {
    currentIndex.value = index;

    if (index == 3) {
      Get.offAllNamed(AppRoutes.signup);
    }
  }
}
