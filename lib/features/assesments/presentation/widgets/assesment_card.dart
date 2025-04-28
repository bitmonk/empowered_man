import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/presentation/assesment_trailer.dart';
import 'package:empowered/features/assesments/presentation/widgets/assesment_graph.dart';

class AssessmentCard extends StatefulWidget {
  const AssessmentCard({
    required this.title,
    required this.score,
    required this.iconPath,
    required this.onTap,
    super.key,
  });

  final String title;
  final String score;
  final String iconPath;
  final VoidCallback onTap;

  @override
  State<AssessmentCard> createState() => _AssessmentCardState();
}

class _AssessmentCardState extends State<AssessmentCard> {
  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);

  @override
  void dispose() {
    _isExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isExpanded,
      builder: (context, isExpanded, child) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          padding: const EdgeInsets.symmetric(vertical: 8),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: AppColors.primary500.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.primary600,
            ),
          ),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            showTrailingIcon: false,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onExpansionChanged: (expanded) {
              _isExpanded.value = expanded;
            },
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset(
                        widget.iconPath,
                        width: 32,
                      ),
                      const HorizontalSpacing(12),
                      Text(
                        widget.title,
                        style: const TextStyle(
                          color: AppColors.textColor50,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      AppOutlinedButton(
                        height: 36,
                        width: 110,
                        text: 'Start Now',
                        textStyle: AppTextStyles.textBodyB3,
                        onPressed: () {
                          Get.to(() => const AssesmentTrailer());
                        },
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: AppDivider(
                    color: AppColors.primary600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Text(
                        'Current Score',
                        style: AppTextStyles.textBodyB2,
                      ),
                      const HorizontalSpacing(4),
                      Text(
                        widget.score,
                        style: AppTextStyles.textBodyB2
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      RotatedBox(
                        quarterTurns: isExpanded ? 3 : 0,
                        child: Assets.images.arrowDown.svg(
                          width: 18,
                          colorFilter: const ColorFilter.mode(
                            AppColors.textColor50,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            children: const [AssessmentGraph()],
          ),
        );
      },
    );
  }
}
