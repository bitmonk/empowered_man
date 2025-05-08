import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/data/model/get_assessment_model.dart';
import 'package:empowered/features/assesments/presentation/controllers/user_assessment_controller.dart';
import 'package:empowered/features/assesments/presentation/widgets/assesment_graph.dart';
import 'package:empowered/features/assesments/presentation/widgets/assesment_trailer.dart';

class AssessmentCard extends StatefulWidget {
  const AssessmentCard({
    required this.title,
    required this.score,
    required this.iconPath,
    required this.onTap,
    required this.status,
    required this.id,
    required this.scoreHistory,
    required this.totalScore,
    // required this.isCompleted,
    super.key,
  });

  final String title;
  final String score;
  final String iconPath;
  final VoidCallback onTap;
  final String status;
  final String id;
  final List<ScoreHistory>? scoreHistory;
  final String totalScore;
  // final bool isCompleted;

  @override
  State<AssessmentCard> createState() => _AssessmentCardState();
}

class _AssessmentCardState extends State<AssessmentCard> {
  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);

  final controller = Get.find<UserAssessmentController>();
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
                      AppCachedImage(
                        imgUrl: widget.iconPath,
                        width: 28,
                        height: 28,
                        errorWid: const Icon(
                          Icons.image_not_supported,
                          size: 20,
                          color: AppColors.primary500,
                        ),
                        // color: AppColors.primary500,
                      ),
                      const HorizontalSpacing(12),
                      Expanded(
                        child: Text(
                          widget.title,
                          maxLines: 2,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.textColor50,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      AppOutlinedButton(
                        height: 36,
                        width: 110,
                        text: widget.status,
                        textStyle: AppTextStyles.textBodyB3,
                        onPressed: () async {
                          controller.startAssessment(widget.id);

                          var totalDimensions = controller.userAssessmentModel
                              .value.data?.userAssessment?.questions?.length;

                          if (widget.status != 'Completed') {
                            await Get.to(
                              () => AssesmentTrailer(
                                id: widget.id,
                                userAssessmentData:
                                    controller.userAssessmentModel.value.data,
                                totalDimensions: totalDimensions ?? 0,
                                title: widget.title,
                              ),
                            );
                          }
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
            children: [
              AssessmentGraph(
                scoreHistory: widget.scoreHistory ?? [],
                totalScore: widget.totalScore,
              ),
            ],
          ),
        );
      },
    );
  }
}
