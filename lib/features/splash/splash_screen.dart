import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/core/preferences/preferences.dart';
import 'package:empowered/core/preferences/shared_pref.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        precacheImages(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Assets.images.splashScreen.provider(),
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox().animate(
                  onComplete: (controller) async {
                    final status = await checkInitialStatus();
                    // var sharedPreferences =
                    //     await SharedPreferences.getInstance();
                    // final isFirstRun = sharedPreferences
                    //         .getBool(SharedPreferencesKey.isFirstRun) ??
                    //     true;
                    // if (isFirstRun) {
                    //   sharedPreferences.setBool(
                    //     SharedPreferencesKey.isFirstRun,
                    //     false,
                    //   );
                    //   await Get.find<AppSharedPref>().removeAll();
                    //   Get.offNamed(AppRoutes.onboarding);
                    //   return;
                    // }
                    // await Future.delayed(const Duration(seconds: 2));
                    Future.delayed(
                      Durations.long2,
                      () {
                        return status == 0
                            ? Get.offNamed(AppRoutes.onboarding)
                            : status == 1
                                ? Get.offAllNamed(AppRoutes.landingScreen)
                                : Get.offAllNamed(AppRoutes.main);
                      },
                    );
                  },
                ).slideY(
                  begin: 1,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.decelerate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<int> checkInitialStatus() async {
    final isFirstRun = await Get.find<Preferences>().getIsFirstRun();
    final userData = await Get.find<AppSharedPref>().getUserModel();

    if (isFirstRun == 'false' && userData == null) {
      return 1;
    } else if (isFirstRun == 'false' && userData != null) {
      Get.find<ProfileController>().userProfile.value = userData;
      return 2;
    } else {
      return 0;
    }
  }

  void precacheImages(BuildContext context) {
    precacheImage(Assets.images.explainerOne.provider(), context);
    precacheImage(Assets.images.explainerTwo.provider(), context);
    precacheImage(Assets.images.explainerThree.provider(), context);
    precacheImage(Assets.images.explainerFour.provider(), context);
    precacheImage(Assets.images.preoBlack.provider(), context);
    precacheImage(Assets.images.groupProfile.provider(), context);
    // precacheImage(Assets.images.profilePic.provider(), context);
    precacheImage(Assets.images.profilePicBorder.provider(), context);
  }
}
