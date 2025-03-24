import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/core/extension/string_extension.dart';
import 'package:empowered/core/preferences/preferences.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                    var sharedPreferences =
                        await SharedPreferences.getInstance();
                    final isFirstRun = sharedPreferences
                            .getBool(SharedPreferencesKey.isFirstRun) ??
                        true;
                    if (isFirstRun) {
                      sharedPreferences.setBool(
                        SharedPreferencesKey.isFirstRun,
                        false,
                      );
                      await Get.find<Preferences>().removeAll();
                      Get.offNamed(AppRoutes.onboarding);
                      return;
                    }
                    await Future.delayed(const Duration(seconds: 2));
                    final accessToken = await Get.find<Preferences>()
                        .getString(PreferenceKeys.accessToken);

                    Future.delayed(
                      Durations.long2,
                      () => accessToken.isNullOrEmpty()
                          ? Get.offNamed(AppRoutes.landingScreen)
                          : Get.offNamed(AppRoutes.main),
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

class SharedPreferencesKey {
  static const String isFirstRun = 'isFirstRun';
}
