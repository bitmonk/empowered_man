import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/presentation/assesments_screen.dart';
import 'package:empowered/features/assesments/presentation/controllers/get_assessment_controller.dart';
import 'package:empowered/features/assesments/presentation/controllers/user_assessment_controller.dart';
import 'package:empowered/features/assesments/presentation/widgets/navigation_buttons.dart';

class AssesmentResult extends StatelessWidget {
  const AssesmentResult({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserAssessmentController>();

    return AppScaffold(
      appBar: CustomAppBar(
        heroTag: 'power-app-bar',
        title:
            '${controller.userAssessmentModel.value.data?.userAssessment?.assessment?.name} Results',
        onTap: () async {
          Get
            ..find<GetAssessmentController>().getAssessment()
            ..to(() => const AssessmentsScreen());
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
                                  const Text(
                                    "You're inside of prosperity!!",
                                    style: TextStyle(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Assets.images.increaseArrow.svg(width: 10),
                                const HorizontalSpacing(6),
                                const Text(
                                  '+12.5%',
                                  style: TextStyle(
                                    color: Color(0xff5CE0A0),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const VerticalSpacing(12),
                            const Text(
                              'Score Overview\n0-48 = Scarcity\n49-80 = Abundance\n81-96 = Prosperity',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.textColor300,
                                fontSize: 16,
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
                      // List of Scores
                      // Column(
                      //   children: List.generate(5, (index) {
                      //     return ThemedContainer(
                      //       margin: const EdgeInsets.only(bottom: 24),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           const Text(
                      //             '9',
                      //             style: TextStyle(
                      //               color: AppColors.primary400,
                      //               fontSize: 24,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //           const HorizontalSpacing(16),
                      //           Expanded(
                      //             child: Text(
                      //               '${controller.userAssessmentModel.value.data!.userAssessment!.questions?[index].title} score ${controller.scoreQuestionModel.value.data?.questionScore ?? '0'}',
                      //               textAlign: TextAlign.left,
                      //               style: const TextStyle(
                      //                 color: AppColors.textColor300,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   }),
                      // ),
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
                    Navigator.popUntil(
                      context,
                      (route) =>
                          route.settings.name == AppRoutes.assesmentsScreen,
                    );
                  },
                  onNext: () async {
                    var getAssessmentController =
                        Get.find<GetAssessmentController>();
                    await getAssessmentController.getAssessment();
                    Navigator.popUntil(
                      context,
                      (route) =>
                          route.settings.name == AppRoutes.assesmentsScreen,
                    );
                  },
                ),
              ),
            ),
          ],
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
