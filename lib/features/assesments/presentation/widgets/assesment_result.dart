import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/presentation/assesments_screen.dart';
import 'package:empowered/features/assesments/presentation/controllers/user_assessment_controller.dart';
import 'package:empowered/features/assesments/presentation/widgets/average_percentage.dart';
import 'package:empowered/features/assesments/presentation/widgets/navigation_buttons.dart';

class AssesmentResult extends StatelessWidget {
  const AssesmentResult({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserAssessmentController>();
    Future<void> navigateToAssessmentScreen() async {
      controller.getAssessment();
      Get.offUntil(
        GetPageRoute(
          page: () => const AssessmentsScreen(),
        ),
        (route) => route.settings.name == AppRoutes.assesmentsScreen,
      );
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        await navigateToAssessmentScreen();
      },
      child: AppScaffold(
        appBar: CustomAppBar(
          heroTag: 'power-app-bar',
          title:
              '${controller.userAssessmentModel.value.data?.userAssessment?.assessment?.name} Results',
          onTap: () async {
            await navigateToAssessmentScreen();
          },
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Progress Indicator
                        LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(20),
                          minHeight: 6,
                          value: 1,
                          color: AppColors.primary500,
                          backgroundColor: AppColors.color324E65,
                        ),
                        const VerticalSpacing(24),

                        // Score Card
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.bgMedium,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.primary600,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 40,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary500.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Your Score',
                                      style: TextStyle(
                                        color: AppColors.colorB5BBC0,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const VerticalSpacing(16),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary500,
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Text(
                                        '${controller.scoreQuestionModel.value.data!.totalObtainedScore} / ${controller.scoreQuestionModel.value.data!.totalScore}',
                                        style: const TextStyle(
                                          color: AppColors.textColor50,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    const VerticalSpacing(16),
                                    Text(
                                      "You're inside of ${controller.scoreQuestionModel.value.data?.scoreOverview}!!",
                                      style: const TextStyle(
                                        color: AppColors.textColor50,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalSpacing(16),
                              const Text(
                                'Congratulations!',
                                style: TextStyle(
                                  color: AppColors.textColor50,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const VerticalSpacing(12),
                              if (controller.scoreQuestionModel.value.data
                                      ?.totalGrowth ==
                                  0)
                                AveragePercentage(
                                  w1Value: 0,
                                  w4Value: 0,
                                  percentage: controller.scoreQuestionModel
                                      .value.data?.totalGrowth
                                      ?.toDouble(),
                                ),
                              if (controller.scoreQuestionModel.value.data
                                      ?.totalGrowth ==
                                  0)
                                const VerticalSpacing(12),
                              const Text(
                                'Score Overview',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.textColor300,
                                  fontSize: 16,
                                ),
                              ),
                              ...?controller.scoreQuestionModel.value.data
                                  ?.scoreOverviewList
                                  ?.map(
                                (e) => Text(
                                  e,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: AppColors.textColor300,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const VerticalSpacing(22),
                            ],
                          ),
                        ),
                        const VerticalSpacing(24),
                        Column(
                          children: _buildQuestionScoresList(controller),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Hero(
                tag: 'power-nav',
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: NavigationButtons(
                    previousText: 'Download PDF',
                    nextText: 'Complete',
                    onPrevious: () {
                      // navigateToAssessmentScreen();
                    },
                    onNext: () async {
                      navigateToAssessmentScreen();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildQuestionScoresList(UserAssessmentController controller) {
    final questions = controller.scoreQuestionModel.value.data?.questions;

    // If questions is null or empty, return an empty list
    if (questions == null || questions.isEmpty) {
      return [
        const ThemedContainer(
          child: Text(
            'No questions available',
            style: TextStyle(color: AppColors.textColor300),
          ),
        ),
      ];
    }

    // Build the list of question score items
    return List.generate(questions.length, (index) {
      final question = questions[index];
      final score = question.answer?.score;

      return ThemedContainer(
        margin: const EdgeInsets.only(bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$score',
              style: const TextStyle(
                color: AppColors.primary400,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const HorizontalSpacing(16),
            Expanded(
              child: Text(
                question.title ?? 'Unknown question',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: AppColors.textColor300,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
