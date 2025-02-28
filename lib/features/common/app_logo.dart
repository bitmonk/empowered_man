import 'package:empowered/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width = 82});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'app-logo',
      child: Assets.images.appLogo.image(width: width),
    );
  }
}
