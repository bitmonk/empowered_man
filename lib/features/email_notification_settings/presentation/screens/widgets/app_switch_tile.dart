import 'package:empowered/core/extension/extensions.dart';

class AppSwitchTile extends StatelessWidget {
  const AppSwitchTile({
    required this.title,
    required this.value,
    super.key,
    this.onChanged,
    this.textStyle = AppTextStyles.bodyLGMedium,
    this.subtitle,
  });

  final void Function(bool)? onChanged;
  final String title;
  final bool value;
  final TextStyle textStyle;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      contentPadding: EdgeInsets.zero,
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: AppTextStyles.bodyMDRegular,
            )
          : null,
      title: Text(
        title,
        style: textStyle,
      ),
      value: value,
      activeColor: AppColors.primary500,
      onChanged: onChanged,
    );
  }
}
