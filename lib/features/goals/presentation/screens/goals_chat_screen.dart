import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_chat_controller.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_controller.dart';
import 'package:empowered/features/goals/presentation/screens/widgets/goals_chat_bubble_container.dart';
import 'package:empowered/features/goals/presentation/screens/widgets/goals_chat_input_field.dart';
import 'package:empowered/features/journal_chat/data/model/message_item.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

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

  bool _isChatCompleted() {
    final questions = controller.goalsChatModel.value.data?.questions;
    if (questions == null || questions.isEmpty) {
      return false;
    }

    // Check if all questions are answered
    return questions.every((question) => question.answered == true);
  }

  void _onRefresh() {
    controller.getGoalsChat();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        Get.find<GoalsController>().getGoals();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CustomAppBar(
          title: widget.title ?? controller.title.value,
          onTap: () {
            Get.back();
            Get.find<GoalsController>().getGoals();
          },
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _onRefresh,
            ),
          ],
        ),
        body: KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            if (isKeyboardVisible) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                controller.scrollToBottom();
              });
            }
            return SafeArea(
              child: Obx(() {
                return controller.getGoalsChatState.value.showWidget(
                  // loading: () => const Center(
                  //   child: LoadingWidget(),
                  // ),
                  error: () => Center(
                    child: CustomErrorWidget(
                      error: 'Failed to load chat',
                      onPressed: _onRefresh,
                    ),
                  ),
                  success: () => Column(
                    children: [
                      Expanded(
                        child: controller.getGoalsChatState.value.showWidget(
                          success: () {
                            final goals = controller.goalsChatModel.value.data;
                            if (goals == null) {
                              return const Center(
                                child: LoadingWidget(),
                              );
                            }
                            return Obx(() {
                              final items =
                                  controller.buildCompleteMessageList(goals);
                              final questionIds =
                                  controller.getNextQuestionIds(goals);
                              if (items.isEmpty &&
                                  !controller.showBeginJournallButton.value) {
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
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        keyboardDismissBehavior:
                                            ScrollViewKeyboardDismissBehavior
                                                .onDrag,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                        ),
                                        itemCount: items.length,
                                        itemBuilder: (context, index) {
                                          final chat = items[index];

                                          if (chat.hide == true) {
                                            return const SizedBox.shrink();
                                          }
                                          final messageItem = MessageItem(
                                            type: chat.type,
                                            message: chat.message,
                                            timestamp: chat.timestamp,
                                            isMine: chat.isMine,
                                            isLoading: chat.isLoading,
                                            selectedOption: chat.selectedOption,
                                            answered: chat.answered,
                                            isThinking: chat.isThinking,
                                            answerId: chat.answerId,
                                            questionId: chat.questionId,
                                            createdAt: chat.createdAt,
                                            updatedAt: chat.updatedAt,
                                            isEdited: chat.isEdited,
                                          );
                                          Widget messageWidget =
                                              GoalsChatBubbleContainer(
                                            isJournal: true,
                                            message: messageItem.message,
                                            isMine: messageItem.isMine,
                                            onLike: () {},
                                            isLoading: messageItem.isLoading,
                                            isThinking: messageItem.isThinking,

                                            // isAnswered:
                                            //     messageItem.isYesNoQuestion &&
                                            //         item.type ==
                                            //             MessageType.question &&
                                            //         index < items.length - 1 &&
                                            //         items[index + 1].type ==
                                            //             MessageType.answer,
                                            answerId: messageItem.isMine
                                                ? messageItem.answerId
                                                : null,
                                            questionId: chat.questionId,
                                            createdAt: messageItem.createdAt,
                                            updatedAt: messageItem.updatedAt,
                                            isEdited: messageItem.isEdited,
                                            onEditTap: () {
                                              controller.chatController.text =
                                                  messageItem.message;
                                              if (messageItem.answerId !=
                                                  null) {
                                                controller.setEditMode(
                                                  true,
                                                  messageItem.answerId!,
                                                );
                                              }
                                            },
                                          );
                                          if (chat.type ==
                                                  MessageType.question &&
                                              index < items.length - 1) {
                                            final nextItem = items[index + 1];
                                            if (nextItem.type ==
                                                MessageType.answer) {
                                              messageWidget = Column(
                                                children: [
                                                  messageWidget,
                                                  const SizedBox(height: 8),
                                                ],
                                              );
                                            }
                                          }

                                          return messageWidget;
                                        },
                                      ),
                                      if (!controller
                                          .showBeginJournallButton.value)
                                        const SizedBox.shrink()
                                      else
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 32,
                                            left: 40,
                                            right: 40,
                                          ),
                                          child: AppOutlinedButton(
                                            text: 'Begin Goals',
                                            onPressed: () {
                                              setState(() {
                                                controller
                                                    .showBeginJournallButton
                                                    .value = false;
                                              });
                                            },
                                          ),
                                        ),
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
                          },
                        ),
                      ),
                      // In your _GoalsChatScreenState build method, replace the bottom Obx widget with this:

                      Obx(() {
                        final goal =
                            controller.goalsChatModel.value.data?.userGoal;
                        final isChatCompleted = _isChatCompleted();

                        if (controller.isEditMode.value ||
                            (!isChatCompleted &&
                                !controller.showBeginJournallButton.value)) {
                          return GoalsChatInputField(
                            focusNode: focusNode,
                            goalId: goal?.id.toString() ?? widget.goalId,
                            isEditMode: controller.isEditMode.value,
                            isDisabled: controller.isShowingThinking.value,
                            onMessageSent: () async {
                              if (controller.isEditMode.value) {
                                // Handle edit mode
                                await controller.updateMessage(null);
                              } else {
                                // Handle normal message sending
                                await controller.handleTextMessageSent();
                              }
                            },
                            onCancel: controller.isEditMode.value
                                ? () => controller.resetEditMode()
                                : null,
                          );
                        } else if (!_isChatCompleted()) {
                          return const SizedBox.shrink();
                        } else {
                          return Padding(
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
                          );
                        }

                        // Don't show anything if chat is completed and not in edit mode
                        // return const SizedBox.shrink();
                      }),
                    ],
                  ),
                  orElse: () => const Center(
                    child: LoadingWidget(),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
