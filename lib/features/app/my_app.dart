import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/core/theme/app_theme.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        precacheImage(Assets.images.splash.provider(), context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppUtils.unfocusKeyboard(context),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appTheme(context),
            getPages: AppRoutes.appPages,
            initialRoute: AppRoutes.splash,
            home: child,
            defaultTransition: Transition.fadeIn,
          );
        },
      ),
    );
  }
}
