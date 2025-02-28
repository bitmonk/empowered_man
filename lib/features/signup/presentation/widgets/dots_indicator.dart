import 'package:empowered/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {

  const DotsIndicator({
    required this.itemCount, required this.currentIndex, super.key,
    this.activeColor = AppColors.textColor50,
    this.inactiveColor = AppColors.color3E4953,
  });
  final int itemCount; // Total number of dots
  final int currentIndex; // Index of the highlighted dot
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 20,
          height: 4,
          decoration: BoxDecoration(
            color: currentIndex == index ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }
}
