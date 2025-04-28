import 'package:empowered/core/extension/extensions.dart';
import 'package:flutter/services.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({
    required this.onPrevious,
    required this.onNext,
    super.key,
    this.previousText,
    this.nextText,
  });
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final String? previousText;
  final String? nextText;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.bgDark,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Previous Button
          Expanded(
            child: GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                onPrevious.call();
              },
              child: Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (previousText == null)
                      const Icon(Icons.arrow_back, color: AppColors.primary500)
                          .paddingOnly(right: 6),
                    Text(
                      previousText ?? 'Previous',
                      style: AppTextStyles.textBodyB1
                          .copyWith(color: AppColors.primary500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const HorizontalSpacing(20),
          // Next Button
          Expanded(
            child: GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                onNext.call();
              },
              child: Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      nextText ?? 'Next',
                      style: AppTextStyles.textBodyB1,
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward,
                      color: AppColors.textColor50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
