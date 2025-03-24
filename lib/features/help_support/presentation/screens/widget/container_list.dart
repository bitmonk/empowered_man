import 'package:empowered/core/extension/extensions.dart';

class ContainerList extends StatelessWidget {
  const ContainerList({
    required this.title,
    required this.subtitle,
    required this.icon,
    super.key,
    this.trailingIcon,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final Widget icon;
  final Widget? trailingIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onTap: onTap,
      tileColor: AppColors.baseWhite,
      leading: CircleAvatar(
        backgroundColor: AppColors.primary100,
        child: icon,
      ),
      title: Text(
        title,
        style: AppTextStyles.bodyMDsemibold,
      ),
      subtitle: Text(
        subtitle,
        style: AppTextStyles.bodyMDRegular,
      ),
      trailing: trailingIcon != null
          ? IconButton(
              onPressed: onTap,
              icon: trailingIcon!,
            )
          : null,
    );
  }
}
