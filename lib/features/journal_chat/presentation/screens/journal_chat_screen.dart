import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/data/model/message_item.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_chat_bubble_container.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_chat_exit_bottomsheet.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_chat_input_field.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class JournalChatScreen extends StatefulWidget {
  const JournalChatScreen({
    super.key,
    this.isFromGoals = false,
  });

  final bool isFromGoals;

  @override
  State<JournalChatScreen> createState() => _JournalChatScreenState();
}

class _JournalChatScreenState extends State<JournalChatScreen> {
  final controller = Get.find<JournalChatController>();
  late FocusNode focusNode;
  bool hasStartedJournaling = false;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
    focusNode = FocusNode();
    focusNode.addListener(_onFocusChange);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.scrollToBottom();
      AppWidgetKey.mainScaffold.currentState?.openEndDrawer();
    });
  }

  void _initializeController() {
    controller.chatController.clear();
    controller
      ..resetEditMode()
      ..getJournalWithQuestionsAndAnswers();
  }

  void _onFocusChange() {
    setState(() {
      _isKeyboardVisible = focusNode.hasFocus;
      if (_isKeyboardVisible) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            final height = MediaQuery.of(context).viewInsets.bottom;
            controller.scrollController.animateTo(
              controller.scrollController.position.maxScrollExtent + height,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        });
      }
    });
  }

  void startJournaling() {
    setState(() {
      hasStartedJournaling = true;
    });
    focusNode.requestFocus();
    controller.scrollToBottom();
  }

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void navigateToLibrary() {
    if (controller.journalWithQuestionsAndAnswers.value.data?.journal !=
        null) {}
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isCompleted =
            controller.journalWithQuestionsAndAnswers.value.data?.isCompleted ??
                false;
        if (!isCompleted && controller.selectedEmotion.value != null) {
          await showModalBottomSheet(
            isScrollControlled: true,
            useRootNavigator: true,
            useSafeArea: true,
            context: context,
            builder: (context) => JournalChatExitBottomsheet(
              message:
                  'You can continue this journal from dashboard or journal library',
              onPressed: () {
                Get.back();
              },
            ),
          );
          return false;
        } else {
          Get.back();
          AppWidgetKey.mainScaffold.currentState?.openEndDrawer();
          return false;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          onTap: () async {
            final isCompleted = controller
                    .journalWithQuestionsAndAnswers.value.data?.isCompleted ??
                false;
            if (!isCompleted && controller.selectedEmotion.value != null) {
              await showModalBottomSheet(
                isScrollControlled: true,
                useRootNavigator: true,
                useSafeArea: true,
                context: context,
                builder: (context) => JournalChatExitBottomsheet(
                  message:
                      'You can continue this journal from dashboard or journal library',
                  onPressed: () {
                    Get.back();
                  },
                ),
              );
            } else {
              Get.back();
            }
          },
          title: controller.selectedEmotion.value?.emotionName ?? '',
        ),
        body: KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            if (isKeyboardVisible) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                controller.scrollToBottom();
              });
            }
            return SafeArea(
              child: Obx(
                () => controller.journalChatConversationState.value.showWidget(
                  orElse: () => const LoadingWidget(),
                  error: () => Center(
                    child: CustomErrorWidget(
                      onPressed: () {
                        controller.getJournalWithQuestionsAndAnswers();
                      },
                    ),
                  ),
                  success: () => Column(
                    children: [
                      if (controller.selectedEmotion.value == null)
                        const CustomErrorWidget(
                          error: 'Not found',
                        )
                      else
                        Expanded(
                          child: controller.journalChatConversationState.value
                              .showWidget(
                            success: () {
                              final journal = controller
                                  .journalWithQuestionsAndAnswers
                                  .value
                                  .data
                                  ?.journal;
                              if (journal == null) {
                                return const Center(
                                  child: LoadingWidget(),
                                );
                              }

                              return Obx(() {
                                // Use controller's buildCompleteMessageList method
                                final items = controller
                                    .buildCompleteMessageList(journal);
                                final questionIds =
                                    controller.getNextQuestionIds(journal);
                                final followupQuestionId =
                                    questionIds['followUpQuestionId'];

                                return SingleChildScrollView(
                                  controller: controller.scrollController,
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
                                          final item = items[index];
                                          final isCurrentYesNoQuestion =
                                              item.isYesNoQuestion &&
                                                  !item.isMine &&
                                                  followupQuestionId != null &&
                                                  index < items.length - 1 &&
                                                  items[index + 1].type !=
                                                      MessageType.answer;

                                          final messageItem = MessageItem(
                                            type: item.type,
                                            message: item.message,
                                            timestamp: item.timestamp,
                                            isMine: item.isMine,
                                            images: item.images,
                                            videos: item.videos,
                                            voices: item.voices,
                                            isLoading: item.isLoading,
                                            isYesNoQuestion:
                                                item.isYesNoQuestion,
                                            selectedOption: item.selectedOption,
                                            answered: item.answered,
                                            isThinking: item.isThinking,
                                            answerId: item.answerId,
                                            questionId: item.questionId,
                                            createdAt: item.createdAt,
                                            updatedAt: item.updatedAt,
                                            isEdited: item.isEdited,
                                          );

                                          Widget messageWidget =
                                              JournalChatBubbleContainer(
                                            isJournal: true,
                                            message: messageItem.message,
                                            isMine: messageItem.isMine,
                                            // timeStamp:
                                            //     messageItem.timestamp ?? '',
                                            onLike: () {},
                                            images: messageItem.images,
                                            videos: messageItem.videos,
                                            voices: messageItem.voices,
                                            isLoading: messageItem.isLoading,
                                            isThinking: messageItem.isThinking,
                                            isYesNoQuestion:
                                                messageItem.isYesNoQuestion,
                                            selectedOption:
                                                messageItem.selectedOption,
                                            onYesNoOptionSelected: (option) {
                                              if (messageItem.isYesNoQuestion &&
                                                  followupQuestionId != null) {
                                                // Use controller's method
                                                controller.handleYesNoSelection(
                                                  option,
                                                  followupQuestionId,
                                                );
                                              }
                                            },
                                            isAnswered:
                                                messageItem.isYesNoQuestion &&
                                                    item.type ==
                                                        MessageType.question &&
                                                    index < items.length - 1 &&
                                                    items[index + 1].type ==
                                                        MessageType.answer,
                                            answerId: messageItem.isMine
                                                ? messageItem.answerId
                                                : null,
                                            questionId: item.questionId,
                                            createdAt: messageItem.createdAt,
                                            updatedAt: messageItem.updatedAt,
                                            isEdited: messageItem.isEdited,
                                            onEditTap: () {
                                              if (messageItem.isYesNoQuestion &&
                                                  messageItem.answerId !=
                                                      null) {
                                                String? questionId;

                                                for (var i = index - 1;
                                                    i >= 0;
                                                    i--) {
                                                  if (items[i].type ==
                                                          MessageType
                                                              .question &&
                                                      items[i]
                                                          .isYesNoQuestion &&
                                                      items[i].questionId !=
                                                          null) {
                                                    questionId =
                                                        items[i].questionId;
                                                    break;
                                                  }
                                                }

                                                if (questionId != null) {
                                                  controller.setYesNoEditMode(
                                                    true,
                                                    messageItem.answerId!,
                                                    messageItem
                                                            .selectedOption ??
                                                        '',
                                                    questionId,
                                                  );
                                                }
                                              } else {
                                                // For regular text messages, enter text edit mode
                                                controller.chatController.text =
                                                    messageItem.message;
                                                if (messageItem.answerId !=
                                                    null) {
                                                  controller.setEditMode(
                                                    true,
                                                    messageItem.answerId!,
                                                  );
                                                }
                                              }
                                            },
                                            onYesNoEdit:
                                                (option, answerId, questionId) {
                                              controller.updateYesNoAnswer(
                                                option,
                                                answerId,
                                                questionId,
                                              );
                                            },
                                          );

                                          if (item.type ==
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
                                      if (controller
                                          .showBeginJournallButton.value)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 32,
                                            left: 40,
                                            right: 40,
                                          ),
                                          child: AppOutlinedButton(
                                            text: 'Begin Journaling',
                                            onPressed: () {
                                              startJournaling();
                                              setState(() {
                                                controller
                                                    .showBeginJournallButton
                                                    .value = false;
                                              });
                                            },
                                          ),
                                        ),
                                      const SizedBox(height: 60),
                                      const SizedBox(
                                        height: 1,
                                        width: double.infinity,
                                        key: ValueKey('scroll-bottom-anchor'),
                                      ),
                                    ],
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                      if (controller.selectedEmotion.value != null)
                        Obx(() {
                          final journalCompleted = controller
                                  .journalWithQuestionsAndAnswers
                                  .value
                                  .data
                                  ?.isCompleted ??
                              false;
                          final journal = controller
                              .journalWithQuestionsAndAnswers
                              .value
                              .data
                              ?.journal;
                          final questionIds =
                              controller.getNextQuestionIds(journal);
                          final mainQuestionId = questionIds['mainQuestionId'];
                          final followupQuestionId =
                              questionIds['followUpQuestionId'];
                          final isYesNoQuestion = controller
                              .isYesNoQuestionType(journal, followupQuestionId);
                          if (journalCompleted) {
                            if (controller.isJustCompleted.value) {
                              return JournalThankYouWidget(
                                onContinuePressed:
                                    controller.navigateToJournalLibrary,
                                buttonTitle: 'Go to Journal Library',
                              );
                            }
                            // else if (controller.wasAlreadyCompleted.value) {
                            //   return JournalAlreadyCompletedWidget(
                            //     onContinuePressed:
                            //         controller.navigateToJournalLibrary,
                            //   );
                            // }
                          }
                          if (!controller.showBeginJournallButton.value) {
                            if ((journalCompleted == false &&
                                    isYesNoQuestion == false) ||
                                controller.isEditMode.value) {
                              return JournalChatInputField(
                                focusNode: focusNode,
                                journalId: journal?.id?.toString() ?? '',
                                mainQuestionId: mainQuestionId,
                                followupQuestionId: followupQuestionId,
                                isDisabled: controller.isShowingThinking.value,
                                onMessageSent: () async {
                                  await controller.handleTextMessageSent();
                                },
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          } else {
                            return const SizedBox.shrink();
                          }
                        }),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class JournalThankYouWidget extends StatelessWidget {
  const JournalThankYouWidget({
    required this.onContinuePressed,
    required this.buttonTitle,
    super.key,
  });

  final VoidCallback onContinuePressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.bgContainer,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.celebration,
            color: AppColors.appGreen,
            size: 56,
          ),
          const SizedBox(height: 20),
          Text(
            'Thank You!',
            style: AppTextStyles.bodyLGMedium.copyWith(
              color: AppColors.textColor100,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Thank you for completing your journal!',
            style: AppTextStyles.bodyLGMedium.copyWith(
              color: AppColors.textColor100,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your thoughts and reflections have been saved. Take a moment to appreciate your journey of self-discovery.',
            textAlign: TextAlign.center,
            style: AppTextStyles.textBodyB2.copyWith(
              color: AppColors.textColor200,
            ),
          ),
          const SizedBox(height: 24),
          AppOutlinedButton(
            text: buttonTitle,
            onPressed: onContinuePressed,
          ),
        ],
      ),
    );
  }
}

// class JournalAlreadyCompletedWidget extends StatelessWidget {
//   const JournalAlreadyCompletedWidget({
//     required this.onContinuePressed,
//     super.key,
//   });

//   final VoidCallback onContinuePressed;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: AppColors.bgContainer,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Icon(
//             Icons.check_circle_outline,
//             color: AppColors.appGreen,
//             size: 48,
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Journal Entry Completed',
//             style: AppTextStyles.bodyLGMedium.copyWith(
//               color: AppColors.textColor100,
//             ),
//           ),
//           const SizedBox(height: 12),
//           Text(
//             'This journal has been completed. You can view it in your journal library.',
//             textAlign: TextAlign.center,
//             style: AppTextStyles.textBodyB2.copyWith(
//               color: AppColors.textColor200,
//             ),
//           ),
//           const SizedBox(height: 20),
//           AppOutlinedButton(
//             text: 'Go to Journal Library',
//             onPressed: onContinuePressed,
//           ),
//         ],
//       ),
//     );
//   }
//}
