import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/data/model/user_assessment_model.dart';
import 'package:empowered/features/assesments/presentation/controllers/user_assessment_controller.dart';
import 'package:empowered/features/assesments/presentation/widgets/navigation_buttons.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DimensionScreen extends StatefulWidget {
  // Track current dimension

  const DimensionScreen({
    required this.userAssessmentData,
    required this.totalDimensions,
    super.key,
    this.dimensionIndex = 1,
  });
  final int dimensionIndex;
  final UserAssessmentData userAssessmentData;
  final int totalDimensions;

  @override
  State<DimensionScreen> createState() => _DimensionScreenState();
}

class _DimensionScreenState extends State<DimensionScreen> {
  double selectedScore = 4;
  int? expandedIndex;

  // static const int totalDimensions = 5; // Total number of pages

  // final List<String> levels = [
  //   '[1-3] BODY - FITNESS LEVEL 1: ASLEEP',
  //   '[4-6] TITLE PLACEHOLDER',
  //   '[7-9] TITLE PLACEHOLDER',
  //   '[10-12] BODY - TITLE PLACEHOLDER',
  // ];

  void navigateToDetail(String title) {}
  final controller = Get.find<UserAssessmentController>();

  // void goToNextDimension() {
  //   if (widget.dimensionIndex < widget.totalDimensions) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => DimensionScreen(
  //           dimensionIndex: widget.dimensionIndex + 1,
  //           userAssessmentData: widget.userAssessmentData,
  //           totalDimensions:
  //               widget.userAssessmentData.userAssessment!.questions!.length,
  //         ),
  //       ),
  //     );
  //   } else {
  //     Get.toNamed(AppRoutes.assesmentsResult);
  //   }
  // }
  Future<void> goToNextDimension() async {
    if (widget.dimensionIndex < widget.totalDimensions) {
      // Post the current score before navigation
      await controller.scoreQuestion(
        widget.userAssessmentData.userAssessment!.id.toString(),
        widget.userAssessmentData.userAssessment!
            .questions![widget.dimensionIndex - 1].id
            .toString(),
        selectedScore.toInt().toString(),
      );

      if (controller.scoreQuestionState.value == TheStates.success) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DimensionScreen(
              dimensionIndex: widget.dimensionIndex + 1,
              userAssessmentData: widget.userAssessmentData,
              totalDimensions:
                  widget.userAssessmentData.userAssessment!.questions!.length,
            ),
          ),
        );
      }
    } else {
      // Post the final score before showing results
      await controller.scoreQuestion(
        widget.userAssessmentData.userAssessment!.id.toString(),
        widget.userAssessmentData.userAssessment!
            .questions![widget.dimensionIndex - 1].id
            .toString(),
        selectedScore.toInt().toString(),
      );

      if (controller.scoreQuestionState.value == TheStates.success) {
        Get.toNamed(AppRoutes.assesmentsResult);
      }
    }
  }

  void goToPreviousDimension() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var progressValue = widget.dimensionIndex / widget.totalDimensions;

    return AppScaffold(
      appBar: CustomAppBar(
        heroTag: 'power-app-bar',
        title:
            '${widget.userAssessmentData.userAssessment?.assessment?.name} ${widget.dimensionIndex}/${widget.totalDimensions}',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'power-linear',
                      child: LinearProgressIndicator(
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(20),
                        value: progressValue,
                        color: AppColors.primary500,
                        backgroundColor: AppColors.color324E65,
                      ),
                    ),
                    const VerticalSpacing(24),
                    Text(
                      widget.userAssessmentData.userAssessment!
                              .questions![widget.dimensionIndex - 1].title ??
                          '',
                      // 'DIMENSION #${widget.dimensionIndex}: BODY, SECTION #1: FITNESS',
                      style: AppTextStyles.textHeadingH3,
                    ),
                    // const VerticalSpacing(16),
                    // const Text(
                    //   'The state and condition of being physically sound and healthy, especially as the result of exercise.',
                    //   style: AppTextStyles.textBodyB2,
                    // ),
                    const VerticalSpacing(8),
                    Column(
                      children: [
                        SliderTheme(
                          data: const SliderThemeData(trackHeight: 6),
                          child: Slider(
                            value: selectedScore,
                            min: 1,
                            max: 12,
                            divisions: 11,
                            inactiveColor: AppColors.color324E65,
                            thumbColor: AppColors.white,
                            activeColor: AppColors.primary300,
                            label: selectedScore.toString(),
                            onChanged: (value) {
                              setState(() {
                                selectedScore = value;
                              });
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            13,
                            (index) => Text(
                              (index).toString(),
                              style: AppTextStyles.textBodyB3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpacing(24),
                    Theme(
                      data: ThemeData()
                          .copyWith(dividerColor: Colors.transparent),
                      child: Column(
                        children: [
                          HtmlWidget(
                            widget
                                    .userAssessmentData
                                    .userAssessment!
                                    .questions![widget.dimensionIndex - 1]
                                    .description ??
                                '',
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary300,
                            ),
                            // textStyle: AppTextStyles.textBodyB2,
                          ),
                        ],
                        // children: List.generate(levels.length, (index) {
                        //   return ExpansionTile(
                        //     tilePadding: EdgeInsets.zero,
                        //     expandedAlignment: Alignment.centerLeft,
                        //     expandedCrossAxisAlignment:
                        //         CrossAxisAlignment.start,
                        //     onExpansionChanged: (expanded) {
                        //       setState(() {
                        //         expandedIndex = expanded ? index : null;
                        //       });
                        //     },
                        //     title: Text(
                        //       levels[index],
                        //       style: const TextStyle(
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.w600,
                        //         color: AppColors.primary300,
                        //       ),
                        //     ),
                        //     trailing: expandedIndex == index
                        //         ? const Icon(
                        //             Icons.keyboard_arrow_up,
                        //             color: AppColors.textColor300,
                        //           )
                        //         : const Icon(
                        //             Icons.keyboard_arrow_down,
                        //             color: AppColors.textColor300,
                        //           ),
                        //     children: [
                        //       const Text(
                        //         'Your Body Is Irrelevant To You',
                        //         style: AppTextStyles.textBodyB2,
                        //       ),
                        //       const VerticalSpacing(16),
                        //       Text(
                        //         testPower,
                        //         style: AppTextStyles.textBodyB3,
                        //       ),
                        //     ],
                        //   );
                        // }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Hero(
              tag: 'power-nav',
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: NavigationButtons(
                  onPrevious: goToPreviousDimension,
                  onNext: goToNextDimension,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
