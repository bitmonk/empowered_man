import 'package:empowered/core/extension/extensions.dart';

class ColoredPaddedCotainer extends StatelessWidget {
  const ColoredPaddedCotainer({
    required this.title,
    super.key,
    this.color = AppColors.textColor50,
    this.textStyle = AppTextStyles.bodyMDMedium,
    this.onTap,
    this.width,
    this.borderColor = AppColors.textColor50,
    this.borderRadius = 50.0,
    this.horizontalPadding = 20,
    this.verticalPadding,
  });
  final Color color;
  final String title;
  final TextStyle textStyle;
  final void Function()? onTap;
  final double? width;
  final Color borderColor;
  final double borderRadius;
  final double horizontalPadding;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          width: width,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding ?? 0,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            color: color,
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
          ),
          child: Center(child: Text(title, style: textStyle)),
        ),
      ),
    );
  }
}
