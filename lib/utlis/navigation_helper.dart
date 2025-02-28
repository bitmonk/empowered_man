import 'package:empowered/utlis/app_widget_key.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class NavigationHelper {
  static Future<void> navigateWithFadeTransition(
      BuildContext context, Widget destination,
      {int? index,}) async {
    if (index != null) {
      AppWidgetKey.bottomBarController.jumpToTab(index);
    }
    await pushWithNavBar(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destination,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
}
