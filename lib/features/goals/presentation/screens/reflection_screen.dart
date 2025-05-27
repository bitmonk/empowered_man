import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/data/model/reflection_model.dart';
import 'package:empowered/features/goals/presentation/controllers/reflection_controller.dart';
import 'package:empowered/features/goals/presentation/screens/goals_chat_screen.dart';

class ReflectionScreen extends StatefulWidget {
  const ReflectionScreen({
    super.key,
    this.userGoalId,
    this.goalDetailId,
    this.goalId,
  });
  final String? userGoalId;
  final String? goalDetailId;
  final String? goalId;

  @override
  State<ReflectionScreen> createState() => _ReflectionScreenState();
}

class _ReflectionScreenState extends State<ReflectionScreen> {
  late ReflectionController reflectionController;

  @override
  void initState() {
    super.initState();
    reflectionController = Get.find<ReflectionController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadReflections();
    });
  }

  void _loadReflections() {
    if (widget.userGoalId != null && widget.userGoalId!.isNotEmpty) {
      print('Loading reflections for userGoalId: ${widget.userGoalId}');
      reflectionController.getReflections(userGoalId: widget.userGoalId);
    } else {
      print('Error: userGoalId is null or empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.bgMedium,
      appBar: CustomAppBar(
        backgroundColor: AppColors.bgMedium,
        title: 'Reflection',
        onTap: () {
          reflectionController.cancelRequest();
          Get.back();
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                _loadReflections();
              },
              child: Obx(() {
                // Handle different states
                if (reflectionController.getReflectionState.value ==
                    TheStates.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (reflectionController.getReflectionState.value ==
                    TheStates.error) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Error loading reflections',
                          style: AppTextStyles.textBodyB1.copyWith(
                            color: AppColors.textColor100,
                          ),
                        ),
                        const VerticalSpacing(16),
                        Text(
                          reflectionController.getReflectionError.value ??
                              'Unknown error',
                          style: AppTextStyles.textBodyB2.copyWith(
                            color: AppColors.textColor200,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const VerticalSpacing(24),
                        ElevatedButton(
                          onPressed: _loadReflections,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                // Success state - display reflections
                final questions = reflectionController
                        .reflections.value.data?.reflection?.questions ??
                    [];

                if (questions.isEmpty) {
                  return const Center(
                    child: Text(
                      'No reflection questions available',
                      style: AppTextStyles.textBodyB1,
                    ),
                  );
                }

                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display each question and its answers
                      ...questions
                          .map((question) => _buildQuestionWidget(question)),
                    ],
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // JournalChatInitializer.destroy();
                      // JournalChatInitializer.initialize();
                      // Get.find<JournalChatController>().title.value =
                      //     'Mind Tent';
                      // var chatConversationList = [].obs;
                      Get.to(
                        () => GoalsChatScreen(
                          goalDetailId: widget.goalDetailId ?? '',
                          goalId: widget.goalId ?? '',
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: AppColors.primary500,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Text(
                        'Edit',
                        style: AppTextStyles.textBodyB1,
                      ),
                    ),
                  ),
                ),
                const HorizontalSpacing(20),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: AppColors.primary500,
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: AppTextStyles.textBodyB1.copyWith(
                          color: AppColors.primary500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const BottomSpacing(),
        ],
      ),
    );
  }

  Widget _buildQuestionWidget(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Question Title/Text
        if (question.questionText != null && question.questionText!.isNotEmpty)
          Text(
            question.questionText!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor100,
            ),
          ),
        const VerticalSpacing(24),

        // Display answers if available
        if (question.answer != null && question.answer!.isNotEmpty) ...[
          ...question.answer!.map((answer) => _buildAnswerWidget(answer)),
        ] else if (question.answered == false) ...[
          // Show placeholder if not answered
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.bgContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.textColor200,
              ),
            ),
            child: Text(
              'This question has not been answered yet.',
              style: AppTextStyles.textBodyB2.copyWith(
                color: AppColors.textColor50,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],

        const VerticalSpacing(32),
      ],
    );
  }

  Widget _buildAnswerWidget(Answer answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: answer.achieved == true
                ? AppColors.success100
                : AppColors.bgBorderVLight,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: answer.achieved == true
                  ? AppColors.success500
                  : AppColors.textColor50,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (answer.text != null && answer.text!.isNotEmpty) ...[
                Text(
                  answer.text!,
                  style: AppTextStyles.textBodyB2.copyWith(
                    color: AppColors.textColor100,
                  ),
                ),
                const VerticalSpacing(8),
              ],

              // Achievement status indicator
              // Row(
              //   children: [
              //     Icon(
              //       answer.achieved == true
              //           ? Icons.check_circle
              //           : Icons.radio_button_unchecked,
              //       size: 16,
              //       color: answer.achieved == true
              //           ? AppColors.success500
              //           : AppColors.bgContainer,
              //     ),
              //     const HorizontalSpacing(8),
              //     // Text(
              //     //   answer.achieved == true ? 'Achieved' : 'In Progress',
              //     //   style: AppTextStyles.captionMedium.copyWith(
              //     //     color: answer.achieved == true
              //     //         ? AppColors.success500
              //     //         : AppColors.textColor300,
              //     //     fontWeight: FontWeight.w500,
              //     //   ),
              //     // ),
              //   ],
              // ),
            ],
          ),
        ),
        const VerticalSpacing(12),
      ],
    );
  }
}
