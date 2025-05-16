import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_bubble_container.dart';
import 'package:empowered/features/journal_chat/data/model/chat_conversation_model.dart';
import 'package:empowered/features/journal_chat/data/model/message_item.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_chat_exit_bottomsheet.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_chat_input_field.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class JournalChatScreen extends StatefulWidget {
  const JournalChatScreen({
    super.key,
    this.isFromGoals = false,
    // this.initialEmotionId,
  });
  final bool isFromGoals;
  //final int? initialEmotionId;

  @override
  State<JournalChatScreen> createState() => _JournalChatScreenState();
}

class _JournalChatScreenState extends State<JournalChatScreen> {
  final controller = Get.find<JournalChatController>();

  late FocusNode focusNode;
  bool hasStartedJournaling = false;

  // bool buttonPressed = false;
  // String? currentMainQuestionId;
  // String? currentFollowUpQuestionId;
  bool _isSendingMessage = false;
  bool _isKeyboardVisible = false;
  Map<String, String> _yesNoAnswers = {};

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
    controller.getJournalWithQuestionsAndAnswers();
  }

 void _onFocusChange() {
  setState(() {
    _isKeyboardVisible = focusNode.hasFocus;
    if (_isKeyboardVisible) {
      // Calculate the scroll position to move content above keyboard
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

  List<MessageItem> buildCompleteMessageList(Journal? journal) {
    if (journal == null || journal.mainQuestions == null) {
      return [];
    }

    var items = <MessageItem>[];
    bool stopAddingQuestions = false;

    // Process main questions and their follow-ups one at a time
    for (var i = 0; i < journal.mainQuestions!.length; i++) {
      final mainQuestion = journal.mainQuestions![i];
      var questionTimestamp = '';

      // Set timestamp for questions after the first one
      if (i > 0) {
        final previousQuestion = journal.mainQuestions![i - 1];
        if (previousQuestion.answer?.createdAt != null) {
          questionTimestamp = previousQuestion.answer?.createdAt ?? '';
        }
      }

      // Add main question
      items.add(
        MessageItem(
          type: MessageType.question,
          message: mainQuestion.question!,
          timestamp: i == 0 ? DateTime.now().toString() : questionTimestamp,
          isMine: false,
        ),
      );

      // If this main question is not answered, stop here - don't show next questions
      if (mainQuestion.answered != true) {
        stopAddingQuestions = true;
        break;
      }

      // Add the answer since this question is answered
      items.add(
        MessageItem(
          type: MessageType.answer,
          message: mainQuestion.answer?.text ?? '',
          timestamp:
              mainQuestion.answer?.createdAt ?? DateTime.now().toString(),
          isMine: true,
          images: mainQuestion.answer?.media?.images,
          videos: mainQuestion.answer?.media?.videos,
          voices: mainQuestion.answer?.media?.voices,
        ),
      );

      // Process follow-up questions for this main question only if not stopped
      if (!stopAddingQuestions && mainQuestion.followUpQuestions != null) {
        for (var followUp in mainQuestion.followUpQuestions!) {
          // Add follow-up question
          items.add(
            MessageItem(
              type: MessageType.question,
              message: followUp.question ?? '',
              timestamp: DateTime.now().toString(),
              isMine: false,
              isYesNoQuestion: followUp.questionType == 'yes_no',
            ),
          );

          // If this follow-up is not answered, stop here
          if (followUp.answered != true) {
            stopAddingQuestions = true;
            break;
          }

          // Add follow-up answer
          items.add(
            MessageItem(
              type: MessageType.answer,
              message: followUp.answer?.text ?? '',
              timestamp:
                  followUp.answer?.createdAt ?? DateTime.now().toString(),
              isMine: true,
              images: followUp.answer?.media?.images,
              videos: followUp.answer?.media?.videos,
              voices: followUp.answer?.media?.voices,
            ),
          );
        }
      }

      // If we've encountered an unanswered question, stop processing further main questions
      if (stopAddingQuestions) {
        break;
      }
    }

    return items;
  }

  Map<String, String?> getNextQuestionIds(Journal? journal) {
    if (journal == null || journal.mainQuestions == null) {
      return {'mainQuestionId': null, 'followUpQuestionId': null};
    }

    // Look through main questions in order
    for (final mainQuestion in journal.mainQuestions!) {
      // If the main question is not answered yet, return its ID
      if (mainQuestion.answered != true) {
        return {
          'mainQuestionId': mainQuestion.id?.toString(),
          'followUpQuestionId': null
        };
      }

      // If main question is answered, check its follow-up questions
      if (mainQuestion.followUpQuestions != null) {
        for (final followUpQuestion in mainQuestion.followUpQuestions!) {
          if (followUpQuestion.answered != true) {
            return {
              'mainQuestionId': null,
              'followUpQuestionId': followUpQuestion.id?.toString()
            };
          }
        }
      }

      // At this point, the current main question and all its follow-ups are answered
      // The loop will continue to the next main question
    }

    // All questions (main and follow-up) are answered
    return {'mainQuestionId': null, 'followUpQuestionId': null};
  }

  Future<void> _handleYesNoSelection(String option, String questionId) async {
    setState(() {
      _yesNoAnswers[questionId] = option;
      _isSendingMessage = true;
    });

    try {
      final journal =
          controller.journalWithQuestionsAndAnswers.value.data?.journal;

      // Get the main question ID and follow-up question ID
      final questionIds = getNextQuestionIds(journal);
      final mainQuestionId = questionIds['mainQuestionId'];
      final followupQuestionId = questionIds['followUpQuestionId'];

      // Send the yes/no selection as a message
      await controller.sendMessage(
        journal?.id?.toString() ?? '',
        null, // mediaPath
        option, // Send "Yes" or "No" as the message text
        mainQuestionId,
        followupQuestionId,
      );

      // Update the journal to reflect the new answer
      await controller.getJournalWithQuestionsAndAnswers();

      // Automatically scroll to bottom after sending message
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.autoScrollEnabled.value = true;
        controller.scrollToBottom();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isSendingMessage = false;
        });
      }
    }
  }

  /// Checks if a question is a yes/no type
  bool isYesNoQuestionType(Journal? journal, String? followUpQuestionId) {
    if (journal == null ||
        journal.mainQuestions == null ||
        followUpQuestionId == null) {
      return false;
    }

    // Search through all main questions and their follow-ups to find the specific question
    for (final mainQuestion in journal.mainQuestions!) {
      if (mainQuestion.followUpQuestions != null) {
        final followUpQuestion = mainQuestion.followUpQuestions!
            .firstWhereOrNull((q) => q.id?.toString() == followUpQuestionId);

        if (followUpQuestion != null) {
          return followUpQuestion.questionType == 'yes_no';
        }
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Existing WillPopScope logic
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
              controller: controller,
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
            // Existing AppBar onTap logic
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
                  controller: controller,
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
          builder: (context,isKeyboardVisible ) {
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
            
                              // Get the complete message list
                              final items = buildCompleteMessageList(journal);
                              final questionIds = getNextQuestionIds(journal);
                              final followupQuestionId =
                                  questionIds['followUpQuestionId'];
                              return SingleChildScrollView(
                                controller: controller.scrollController,
                               
                                child: Column(
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      keyboardDismissBehavior:
                                          ScrollViewKeyboardDismissBehavior.onDrag,
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
                                          isLoading: _isSendingMessage &&
                                              item.isMine &&
                                              item.type == MessageType.answer,
                                          isYesNoQuestion: item.isYesNoQuestion,
                                          selectedOption: item.selectedOption,
                                          answered: item.answered,
                                        );
            
                                        // Create the base message widget
                                        Widget messageWidget = ChatBubbleContainer(
                                          isJournal: true,
                                          message: messageItem.message,
                                          isMine: messageItem.isMine,
                                          timeStamp: messageItem.timestamp ?? '',
                                          onLike: () {},
                                          images: messageItem.images,
                                          videos: messageItem.videos,
                                          voices: messageItem.voices,
                                          isLoading: messageItem.isLoading,
                                          isYesNoQuestion:
                                              messageItem.isYesNoQuestion,
                                          selectedOption:
                                              messageItem.selectedOption,
                                          onYesNoOptionSelected: (option) {
                                            if (messageItem.isYesNoQuestion &&
                                                followupQuestionId != null) {
                                              _handleYesNoSelection(
                                                  option, followupQuestionId);
                                            }
                                          },
                                          isAnswered: messageItem.isYesNoQuestion &&
                                              item.type == MessageType.question &&
                                              index < items.length - 1 &&
                                              items[index + 1].type ==
                                                  MessageType.answer,
                                        );
            
                                        // Add spacing between questions and their answers
                                        if (item.type == MessageType.question &&
                                            index < items.length - 1) {
                                          final nextItem = items[index + 1];
                                          if (nextItem.type == MessageType.answer) {
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
                                    if (controller.showBeginJournallButton.value)
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
                                              controller.showBeginJournallButton
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
                              .journalWithQuestionsAndAnswers.value.data?.journal;
            
                          // Get the next question IDs to be answered
                          final questionIds = getNextQuestionIds(journal);
                          final mainQuestionId = questionIds['mainQuestionId'];
                          final followupQuestionId =
                              questionIds['followUpQuestionId'];
            
                          // Check if the follow-up question is a yes/no type
                          final isYesNoQuestion =
                              isYesNoQuestionType(journal, followupQuestionId);
            
                          if (!controller.showBeginJournallButton.value) {
                            if (journalCompleted == false &&
                                isYesNoQuestion == false) {
                              return JournalChatInputField(
                                focusNode: focusNode,
                                journalId: journal?.id?.toString() ?? '',
                                mainQuestionId: mainQuestionId,
                                followupQuestionId: followupQuestionId,
                                onMessageSent: () async {
                                  setState(() {
                                    _isSendingMessage = true;
                                  });
                                  // Force scroll to bottom whenever a message is sent
                                  WidgetsBinding.instance.addPostFrameCallback((_) {
                                    controller.autoScrollEnabled.value = true;
                                    controller.scrollToBottom();
                                  });
                                  try {
                                    // Add your message locally first to show with loading indicator
                                    await controller.sendMessage(
                                      journal?.id?.toString() ?? '',
                                      null, // mediaPath
                                      controller.chatController.text.trim(),
                                      mainQuestionId,
                                      followupQuestionId,
                                    );
            
                                    // Update the journal to reflect the new answer
                                    await controller
                                        .getJournalWithQuestionsAndAnswers();
            
                                    // Refresh UI to display next question if applicable
                                    setState(() {});
                                  } finally {
                                    if (mounted) {
                                      setState(() {
                                        _isSendingMessage = false;
                                      });
                                    }
                                  }
                                },
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          } else {
                            return const SizedBox.shrink();
                          }
                        })
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
