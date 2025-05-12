import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/presentation/controllers/user_assessment_controller.dart';
import 'package:empowered/features/assesments/presentation/dimensions_screen.dart';
import 'package:flutter/services.dart';

class AssesmentTrailer extends StatefulWidget {
  const AssesmentTrailer({
    super.key,
    this.id,
    this.title,
  });
  final String? id;
  final String? title;

  @override
  State<AssesmentTrailer> createState() => _AssesmentTrailerState();
}

class _AssesmentTrailerState extends State<AssesmentTrailer> {
  final controller = Get.find<UserAssessmentController>();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: const CustomAppBar(
          heroTag: 'power-app-bar',
          title: 'Introduction',
        ),
        body: Obx(
          () => SafeArea(
            child: controller.userAssessmentState.value.showWidget(
              loading: () => const LoadingWidget(),
              error: () => const CustomErrorWidget(),
              success: () => Column(
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
                              value: 0.1,
                              color: AppColors.primary500,
                              backgroundColor: AppColors.color324E65,
                            ),
                          ),
                          const VerticalSpacing(24),
                          const Text(
                            'How to score yourself',
                            style: AppTextStyles.textHeadingH3,
                          ),
                          const VerticalSpacing(16),
                          const Text(
                            'The total score per dimension is 24 points, and inside each dimension, '
                            'there are 2 critical sections. For each section, there are 4 Levels to assess yourself with:',
                            style: AppTextStyles.textBodyB2,
                          ),
                          const VerticalSpacing(16),
                          const Text(
                            '• Asleep (1, 2, 3)\n'
                            '• Awake (4, 5, 6)\n'
                            '• Active (7, 8, 9)\n'
                            '• Accelerated (10, 11, 12)',
                            style: AppTextStyles.textBodyB1,
                          ),
                          const VerticalSpacing(16),
                          const Text(
                            'You will carefully read the description of these 4 Levels, then Score Yourself with the '
                            'Number that best represents your current life as it stands today.',
                            style: AppTextStyles.textBodyB2,
                          ),
                          const VerticalSpacing(16),
                          const Text(
                            'The purpose of the 3 numbers inside each of the 4 Levels is to give you room to select '
                            'what is the most accurate for you, and where you are trending.',
                            style: AppTextStyles.textBodyB2,
                          ),
                          const VerticalSpacing(16),
                          const Text(
                            'Remember, this is meant to expose where there are Gaps to be filled inside your Core4 '
                            '(Body, Being, Balance & Business), and Where You Can Accelerate Your Results.',
                            style: AppTextStyles.textBodyB2,
                          ),
                          const VerticalSpacing(16),
                          const Text(
                            'So do yourself a favor and be brutally honest with yourself – with the good, the bad, and the ugly.',
                            style: AppTextStyles.textBodyB2,
                          ),
                          const VerticalSpacing(24),
                          Text(
                            'Let’s begin.',
                            style: AppTextStyles.textBodyB2
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // if (userAssessmentData!.userAssessment!.isCompleted == true)
                  //   const SizedBox()
                  // else
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: GestureDetector(
                      onTap: () async {
                        HapticFeedback.lightImpact();
                        Get.to(
                          () => DimensionScreen(
                            userAssessmentData:
                                controller.userAssessmentModel.value.data!,
                            totalDimensions: controller
                                    .userAssessmentModel
                                    .value
                                    .data
                                    ?.userAssessment
                                    ?.questions
                                    ?.length ??
                                0,
                            title: widget.title,
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary500,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Next',
                              style: AppTextStyles.textBodyB1,
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward,
                              color: AppColors.textColor50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),);
  }
}
