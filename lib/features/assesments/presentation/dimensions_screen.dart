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
    this.title,
    super.key,
    this.dimensionIndex = 1,
  });
  final int dimensionIndex;
  final UserAssessmentData userAssessmentData;
  final int totalDimensions;
  final String? title;

  @override
  State<DimensionScreen> createState() => _DimensionScreenState();
}

class _DimensionScreenState extends State<DimensionScreen> {
  double selectedScore = 0;
  int? expandedIndex;
  bool isLoading = false;
  void navigateToDetail(String title) {}
  final controller = Get.find<UserAssessmentController>();

  Future<void> goToNextDimension() async {
    if (widget.dimensionIndex < widget.totalDimensions) {
      // Post the current score before navigation
      setState(() => isLoading = true);
      try {
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
                title: widget.title,
              ),
            ),
          );
        }
      } finally {
        setState(() => isLoading = false);
      }
    } else {
      // Show confirmation dialog before final submission
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppColors.bgBorder,
          title: const Text(
            'Submit Assessment',
            style: AppTextStyles.textHeadingH3,
          ),
          content: const Text(
            'Are you sure you want to submit your answers?',
            style: AppTextStyles.textBodyB2,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text(
                'No',
                style: TextStyle(color: AppColors.textColor50),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      );

      if (confirmed ?? false) {
        setState(() => isLoading = true);
        try {
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
        } finally {
          setState(() => isLoading = false);
        }
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
                      widget.title ?? '',
                      style: AppTextStyles.textHeadingH3,
                    ),
                    const VerticalSpacing(8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          SliderTheme(
                            data: const SliderThemeData(
                              trackHeight: 6,
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                              overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                            ),
                            child: Slider(
                              value: selectedScore,
                              max: 12,
                              divisions: 12,
                              inactiveColor: AppColors.color324E65,
                              thumbColor: AppColors.white,
                              activeColor: AppColors.primary300,
                              label: selectedScore.toInt().toString(),
                              onChanged: (value) {
                                setState(() {
                                  selectedScore = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                13,
                                (index) => Expanded(
                                  child: Text(
                                    index.toString(),
                                    style: AppTextStyles.textBodyB3,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                  isLoading: isLoading,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
