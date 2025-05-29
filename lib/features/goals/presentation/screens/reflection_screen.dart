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
reflectionController.userGoalId!.value = widget.userGoalId;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadReflections();
    });
  }

  void _loadReflections() {
    if (widget.userGoalId != null && widget.userGoalId!.isNotEmpty) {
      print('Loading reflections for userGoalId: ${widget.userGoalId}');
      reflectionController.getReflections();
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
                          // title: reflectionController.reflections.value.data?.reflection.,
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Question bubble (aligned to left)
        Row(
          children: [
            Flexible(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                ),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.bgContainer,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(20),
                  ),
                  border: Border.all(
                    color: AppColors.textColor200.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (question.questionText != null && question.questionText!.isNotEmpty)
                      Text(
                        question.questionText!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor100,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        
        const VerticalSpacing(12),
        
        // Answer bubbles (aligned to right)
        if (question.answer != null && question.answer!.isNotEmpty) ...[
          ...question.answer!.map((answer) => Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: AppColors.primary500,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (answer.text != null && answer.text!.isNotEmpty)
                        Text(
                          answer.text!,
                          style: AppTextStyles.textBodyB2.copyWith(
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),),
        ] else if (question.answered == false) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.textColor200.withOpacity(0.3),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(4),
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
              ),
            ],
          ),
        ],
        
        const VerticalSpacing(24),
      ],
    );
  }


}