import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        fontFamily: FontFamily.poppins,
        brightness: Brightness.light,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColors.neutral900,
              displayColor: AppColors.neutral900,
            ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryDark,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: const RoundedRectangleBorder(),
            backgroundColor: AppColors.primaryDark,
            foregroundColor: AppColors.colorWhite,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: AppColors.primaryDark,
            foregroundColor: AppColors.colorWhite,
            padding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            foregroundColor: WidgetStatePropertyAll(AppColors.primaryDark),
          ),
        ),
        scaffoldBackgroundColor: AppColors.bgDark,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.bgDark,
          foregroundColor: AppColors.bgDark,
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        fontFamily: FontFamily.poppins,
        brightness: Brightness.dark,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColors.neutral900,
              displayColor: AppColors.neutral900,
            ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryDark,
          brightness: Brightness.dark,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: const RoundedRectangleBorder(),
            backgroundColor: AppColors.primaryDark,
            foregroundColor: AppColors.colorWhite,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: AppColors.primaryDark,
            foregroundColor: AppColors.colorWhite,
            padding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            foregroundColor: WidgetStatePropertyAll(AppColors.colorWhite),
          ),
        ),
        scaffoldBackgroundColor: AppColors.fbf8f8,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: AppColors.primaryDark,
        ),
      );
}
