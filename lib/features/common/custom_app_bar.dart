import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.color,
    this.onTap,
    this.hideLeading = false,
    this.scrolledUnderElevation,
    this.actions,
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: AppColors.textColor50,
    ),
    this.backgroundColor = AppColors.bgDark,
    this.systemOverlayStyle,
    this.heroTag,
  });

  final String? title;
  final String? heroTag;
  final Color? color;
  final Color backgroundColor;
  final void Function()? onTap;
  final double? scrolledUnderElevation;
  final List<Widget>? actions;
  final TextStyle textStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool hideLeading;

  @override
  Widget build(BuildContext context) {
    Widget appBar = AppBar(
      systemOverlayStyle: systemOverlayStyle,
      foregroundColor: color,
      backgroundColor: backgroundColor,
      scrolledUnderElevation: scrolledUnderElevation,
      automaticallyImplyLeading: false,
      leading: hideLeading
          ? null
          : Padding(
              padding: const EdgeInsets.only(left: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  if (onTap != null) {
                    onTap?.call();
                  } else {
                    Get.back();
                  }
                },
                child: Align(
                  child: Assets.images.backarrow.svg(
                    width: 24,
                    colorFilter: textStyle.color == AppColors.textColor50
                        ? const ColorFilter.mode(
                            AppColors.colorWhite,
                            BlendMode.srcIn,
                          )
                        : null,
                  ),
                ),
              ),
            ),
      title: title != null
          ? Text(
              title!,
              style: textStyle,
            )
          : null,
      titleSpacing: 0,
      centerTitle: true,
      actions: actions,
    );

    return heroTag != null ? Hero(tag: heroTag!, child: appBar) : appBar;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
