import 'package:empowered/core/extension/extensions.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    required this.title,
    required this.body,
    required this.createdAt,
    super.key,
  });
  final String? title;
  final String? body;
  final String? createdAt;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            const VerticalSpacing(12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Assets.images.notificationProfile.image(width: 32),
                // const HorizontalSpacing(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title ?? '',
                        style: AppTextStyles.bodyLGMedium
                            .copyWith(color: AppColors.textColor200),
                      ),
                      const VerticalSpacing(4),
                      Text(
                        body ?? '',
                        style: AppTextStyles.bodySmRegular
                            .copyWith(color: AppColors.textColor300),
                      ),
                      Text(
                        createdAt ?? '',
                        style: AppTextStyles.bodySmRegular
                            .copyWith(color: AppColors.textColor300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const VerticalSpacing(24),
            const AppDivider(),
          ],
        ),
      ),
    );
  }
}
