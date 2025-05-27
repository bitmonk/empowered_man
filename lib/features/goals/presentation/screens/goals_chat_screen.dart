import 'package:empowered/features/journal_chat/data/model/message_item.dart';

import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_chat_controller.dart';
import 'package:empowered/features/goals/presentation/screens/widgets/goals_chat_input_field.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_chat_bubble_container.dart';

class GoalsChatScreen extends StatefulWidget {
  const GoalsChatScreen({
    super.key,
    required this.goalDetailId,
    required this.goalId,
  });

  final String goalDetailId;
  final String goalId;

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

  void _onBeginGoalsPressed() {
    focusNode.requestFocus();
    controller.showBeginJournalButton.value = false;
  }

  void _onEditMessage(String answerId, String currentText) {
    controller.enableEditMode(answerId, currentText);
    focusNode.requestFocus();
  }

  void _onRefresh() {
    controller.getGoalsChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: controller.title.value.isNotEmpty
            ? controller.title.value
            : 'Goals Chat',
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _onRefresh,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Chat messages area
            Expanded(
              child: Obx(() {
                return controller.getGoalsChatState.value.showWidget(
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
                );
              }),
            ),

            // Input field
            _buildInputSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildChatContent() {
    return Obx(() {
      final items = controller.chatConversationList;

      if (items.isEmpty && !controller.showBeginJournalButton.value) {
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
              // Chat messages
              if (items.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final chat = items[index];

                    if (chat.hide == true) {
                      return const SizedBox.shrink();
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: _buildMessageBubble(chat),
                    );
                  },
                ),

              // Begin journal button
              if (controller.showBeginJournalButton.value)
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

              // Bottom spacing
              const SizedBox(height: 80),

              // Scroll anchor
              const SizedBox(
                height: 1,
                width: double.infinity,
                key: ValueKey('scroll-bottom-anchor'),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildMessageBubble(MessageItem chat) {
    if (chat.isThinking == true) {
      return _buildThinkingIndicator();
    }

    return JournalChatBubbleContainer(
      message: chat.message ?? '',
      isMine: chat.isMine ?? false,
      timeStamp: chat.timestamp ?? '',
      onLike: () {
        // Handle like functionality if needed
      },
      onEditTap: chat.isMine == true && chat.answerId != null
          ? () => _onEditMessage(chat.answerId!, chat.message ?? '')
          : null,
    );
  }

  Widget _buildThinkingIndicator() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Thinking...',
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: Colors.grey[300]!,
            width: 0.5,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Obx(() {
          final goal = controller.goalsChatModel.value.data?.userGoal;
          return GoalsChatInputField(
            focusNode: focusNode,
            goalId: goal?.id.toString() ?? widget.goalId,
            enabled: controller.canSendMessage,
            isEditMode: controller.isEditMode.value,
            onSend: controller.isEditMode.value
                ? (text) => controller.updateGoalsAnswer(text)
                : (text) => controller.sendGoalsMessage(text: text),
            onCancel: controller.isEditMode.value
                ? () => controller.resetEditMode()
                : null,
          );
        }),
      ),
    );
  }
}
