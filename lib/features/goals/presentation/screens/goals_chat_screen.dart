import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_chat_controller.dart';
import 'package:empowered/features/goals/presentation/screens/widgets/goals_chat_bubble_container.dart';
import 'package:empowered/features/goals/presentation/screens/widgets/goals_chat_input_field.dart';

class GoalsChatScreen extends StatefulWidget {
  const GoalsChatScreen({
    required this.goalDetailId,
    required this.goalId,
    this.title,
    super.key,
  });

  final String goalDetailId;
  final String goalId;
  final String? title;

  @override
  State<GoalsChatScreen> createState() => _GoalsChatScreenState();
}

class _GoalsChatScreenState extends State<GoalsChatScreen>
    with WidgetsBindingObserver {
  late GoalsChatController controller;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    controller = Get.find<GoalsChatController>();
    controller.resetEditMode();
    // Initialize controller with IDs
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.initializeWithIds(widget.goalId, widget.goalDetailId);
    });

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      controller.getGoalsChat();
    }
  }

  void _onEditMessage(String answerId, String currentText) {
    controller.setEditMode(true, answerId, initialText: currentText);

    focusNode.requestFocus();
  }

  void _onBeginGoalsPressed() {
    focusNode.requestFocus();
    controller.showBeginJournallButton.value = false;
  }

  void _onRefresh() {
    controller.getGoalsChat();
  }

  /// Check if the chat is completed (all questions are answered)
  bool _isChatCompleted() {
    final questions = controller.goalsChatModel.value.data?.questions;
    if (questions == null || questions.isEmpty) {
      return false;
    }

    // Check if all questions are answered
    return questions.every((question) => question.answered == true);
  }

  Widget _buildInputField() {
    // Show input field if in edit mode OR if chat is not completed
    if (controller.isEditMode.value || !_isChatCompleted()) {
      final goal = controller.goalsChatModel.value.data?.userGoal;
      return GoalsChatInputField(
        focusNode: focusNode,
        goalId: goal?.id.toString() ?? widget.goalId,
        isEditMode: controller.isEditMode.value,
        onMessageSent: () async {
          // Handle message sent
        },
        onCancel: controller.isEditMode.value
            ? () => controller.resetEditMode()
            : null,
      );
    }

    // Hide input field only if chat is completed AND not in edit mode
    return const SizedBox.shrink();
  }

  Widget _buildChatMessages(List<dynamic> items) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final chat = items[index];

        if (chat.hide == true) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: GoalsChatBubbleContainer(
            message: chat.message,
            isMine: chat.isMine,
            createdAt: chat.timestamp ?? '',
            isThinking: chat.isThinking,
            // timeStamp: chat.timestamp ?? '',
            onLike: () {
              // Handle like functionality if needed
            },
            onEditTap: chat.isMine == true && chat.answerId != null
                ? () => _onEditMessage(chat.answerId!, chat.message)
                : null,
          ),
        );
      },
    );
  }

  Widget _buildChatContent() {
    final items = controller.buildCompleteMessageList(
      controller.goalsChatModel.value.data,
    );

    if (items.isEmpty && !controller.showBeginJournallButton.value) {
      return const Center(
        child: Text(
          'No messages yet. Start the conversation!',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await controller.getGoalsChat();
      },
      child: SingleChildScrollView(
        controller: controller.scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            _buildChatMessages(items),
            if (!controller.showBeginJournallButton.value)
              const SizedBox.shrink()
            else
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 32,
                ),
                child: AppOutlinedButton(
                  text: 'Begin Goals',
                  onPressed: _onBeginGoalsPressed,
                ),
              ),
            if (!_isChatCompleted())
              const SizedBox.shrink()
            else
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 32,
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.green.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Great! You've completed all the goal questions.",
                          style: TextStyle(
                            color: Colors.green[700],
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 80),
            const SizedBox(
              height: 1,
              width: double.infinity,
              key: ValueKey('scroll-bottom-anchor'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: widget.title ?? controller.title.value,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _onRefresh,
          ),
        ],
      ),
      body: Obx(
        () => SafeArea(
          child: Column(
            children: [
              Expanded(
                child: controller.getGoalsChatState.value.showWidget(
                  loading: () => const Center(
                    child: LoadingWidget(),
                  ),
                  error: () => Center(
                    child: CustomErrorWidget(
                      error: 'Failed to load chat',
                      onPressed: _onRefresh,
                    ),
                  ),
                  success: () => _buildChatContent(),
                  orElse: () => const Center(
                    child: LoadingWidget(),
                  ),
                ),
              ),
              _buildInputField(),
            ],
          ),
        ),
      ),
    );
  }
}
