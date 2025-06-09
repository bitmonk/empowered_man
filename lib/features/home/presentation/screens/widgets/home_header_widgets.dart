import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:empowered/features/push_notification/presentation/screen/push_notification_screen.dart';

class HomeHeaderWidgets extends StatelessWidget {
  const HomeHeaderWidgets({
    required this.level,
    required this.upcomingLevel,
    required this.userProgressbarPoints,
    required this.totalPointsProgressBar,
    super.key,
    this.hideControls = false,
  });
  final bool hideControls;
  final String level;
  final String upcomingLevel;
  final String userProgressbarPoints;
  final String totalPointsProgressBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!hideControls)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 24,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary500,
                  ),
                  child: ClipOval(
                    child: AppCachedImage(
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorWid: const Icon(Icons.person),
                      imgUrl: Get.find<ProfileController>()
                              .userProfile
                              .value
                              .image ??
                          '',
                    ),
                  ),
                ),
                const HorizontalSpacing(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hi',
                      style: AppTextStyles.textBodyB3,
                    ),
                    const VerticalSpacing(2),
                    Obx(
                      () {
                        final fullName = Get.find<ProfileController>()
                            .userProfile
                            .value
                            .fullName;
                        return Text(
                          (fullName != null && fullName.length > 12)
                              ? fullName.split(' ').first
                              : fullName ?? '',
                          style: AppTextStyles.textBodyB3
                              .copyWith(color: AppColors.white),
                          maxLines: 2,
                        );
                      },
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Assets.images.homeSearch.svg(width: 40),
                ),
                const HorizontalSpacing(8),
                InkWell(
                  onTap: () {
                    Get.to(PushNotificationScreen(true));
                  },
                  child: Assets.images.notification.svg(width: 40),
                ),
                const HorizontalSpacing(8),
                InkWell(
                  onTap: () {
                    AppWidgetKey.mainScaffold.currentState!.openDrawer();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Assets.images.menu.svg(width: 32),
                  ),
                ),
              ],
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              level,
              style: AppTextStyles.textBodyB1,
            ),
            Text(
              upcomingLevel,
              style: AppTextStyles.textBodyB3,
            ),
          ],
        ),
        const VerticalSpacing(8),
        LinearProgressIndicator(
          borderRadius: BorderRadius.circular(20),
          minHeight: 8,
          color: AppColors.colorF5CA41,
          value: _calculateProgressValue(),
        ),
        const VerticalSpacing(4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              userProgressbarPoints,
              style: AppTextStyles.textBodyB3,
            ),
            Text(
              totalPointsProgressBar,
              style: AppTextStyles.textBodyB3,
            ),
          ],
        ),
        const VerticalSpacing(16),
      ],
    );
  }

  double _calculateProgressValue() {
    final points = int.tryParse(userProgressbarPoints) ?? 0;
    final total = int.tryParse(totalPointsProgressBar) ?? 100;
    
    if (total == 0) return 0;
    return points / total;
  }
}
