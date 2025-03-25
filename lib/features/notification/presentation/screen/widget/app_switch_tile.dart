import 'package:empowered/common/material_2_switch.dart';
import 'package:empowered/core/extension/extensions.dart';

class AppSwitchTile extends StatelessWidget {
  const AppSwitchTile({
    required this.title,
    required this.value,
    super.key,
    this.onChanged,
    this.textStyle,
    this.subtitle,
  });

  final void Function(bool)? onChanged;
  final String title;
  final bool value;
  final TextStyle? textStyle;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return M2SwitchListTile(
      activeTrackColor: AppColors.primary400,
      inactiveTrackColor: AppColors.toggleInactiveTrack,
      dense: true,
      contentPadding: EdgeInsets.zero,
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style:
                  AppTextStyles.titleSm.copyWith(color: AppColors.textColor100),
            )
          : null,
      title: Text(
        title,
        style: AppTextStyles.titleSm.copyWith(color: AppColors.textColor100),
      ),
      value: value,
      activeColor: AppColors.primary500,
      onChanged: onChanged,
    );
  }
}
