import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/gen/assets.gen.dart';

class JournalLibraryPopUp extends StatelessWidget {
  const JournalLibraryPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 50),
      icon: SizedBox(
        height: 33,
        width: 33,
        child: Assets.images.circleThreeDot.svg(),
      ), // Uses the three-dot icon
      color: AppColors.bgBorder, // Background color matching the UI
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: (value) {
        switch (value) {
          case 'download':
            // Handle download action
            break;
          case 'delete':
            // Handle delete action
            break;
          case 'share':
            // Handle share action
            break;
          case 'see_journal':
            // Handle share action
            break;
        }
      },
      itemBuilder: (context) => [
        _buildPopupMenuItem('Share', Assets.images.sharePop.path, 'share'),
        _buildPopupMenuItem(
          'Download',
          Assets.images.download.path,
          'download',
        ),
        _buildPopupMenuItem(
          'See Journal',
          Assets.images.note.path,
          'see_journal',
        ),
        _buildPopupMenuItem('Delete', Assets.images.deletePop.path, 'delete'),
      ],
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(
    String text,
    String icon,
    String value,
  ) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 20,
            color: AppColors.textColor50,
          ),
          const HorizontalSpacing(6),
          Text(text, style: AppTextStyles.textBodyB2),
        ],
      ),
    );
  }
}
