import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_bubble_container.dart';
import 'package:empowered/features/journal_chat/data/model/chat_conversation_model.dart';
import 'package:empowered/features/journal_chat/data/model/message_item.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_chat_exit_bottomsheet.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_chat_input_field.dart';

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

  bool buttonPressed = false;
  String? currentMainQuestionId;
  String? currentFollowUpQuestionId;
  bool _isSendingMessage = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
    focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.scrollToBottom();
      AppWidgetKey.mainScaffold.currentState?.openEndDrawer();
    });
  }

  void _initializeController() {
    controller.chatController.clear();
    controller.getJournalWithQuestionsAndAnswers();
  }

  void startJournaling() {
    setState(() {
      hasStartedJournaling = true;
    });
    focusNode.requestFocus();
    controller.scrollToBottom();
  }

  Widget showFollowUpQuestions() {
    var shouldShowQuestion = true;
    final journallist =
        controller.journalWithQuestionsAndAnswers.value.data?.journal;
    var items = <MessageItem>[];

    if (journallist == null) {
      return const SizedBox();
    }

    for (var i = 0; i < (journallist.followUpQuestions?.length ?? 0); i++) {
      final question = journallist.followUpQuestions?[i];
      var questionTimestamp = '';
      if (i > 0) {
        final previousQuestion = journallist.followUpQuestions![i - 1];
        shouldShowQuestion = previousQuestion.answered ?? false;

        if (shouldShowQuestion && previousQuestion.answer?.createdAt != null) {
          questionTimestamp = previousQuestion.answer?.createdAt ?? '';
        }
      }
      if (shouldShowQuestion) {
        items.add(
          MessageItem(
            type: MessageType.question,
            message: question?.question ?? '',
            timestamp: i == 0 ? DateTime.now().toString() : questionTimestamp,
            // timestamp: questionTimestamp,
            isMine: false,
            isYesNoQuestion: question?.questionType == 'yes_no',
            questionId: question?.id.toString(),
            answered: question?.answered ?? false,
          ),
        );
        if (question?.answered == true) {
          items.add(
            MessageItem(
              type: MessageType.answer,
              message: question?.answer?.text ?? '',
              timestamp:
                  question?.answer?.createdAt ?? DateTime.now().toString(),
              isMine: true,
              images: question?.answer?.media?.images,
              videos: question?.answer?.media?.videos,
              voices: question?.answer?.media?.voices,
            ),
          );
        }
      }
    }

    return Column(
      children: [
        ListView.builder(
          // controller: controller.scrollController,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

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
              isYesNoQuestion: messageItem.isYesNoQuestion,
              isAnswered: messageItem.answered,
              selectedOption:
                  messageItem.selectedOption, // Pass selected option
              onYesNoOptionSelected: (option) {
                // Handle Yes/No selection
                if (messageItem.isYesNoQuestion) {
                  String questionId;
                  MainQuestion? mainQuestion;
                  // Find in main questions
                  try {
                    mainQuestion = journallist.mainQuestions?.firstWhere(
                      (q) => q.question == messageItem.message,
                    );
                  } catch (e) {
                    // No element found
                    mainQuestion = null;
                  }

                  // If not in main questions, check follow-up questions
                  if (mainQuestion != null) {
                    questionId = mainQuestion.id?.toString() ?? '';
                    // print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $questionId');
                  } else {
                    FollowUpQuestion? followUpQuestion;
                    try {
                      followUpQuestion =
                          journallist.followUpQuestions?.firstWhere(
                        (q) => q.question == messageItem.message,
                      );
                    } catch (e) {
                      // No element found
                      followUpQuestion = null;
                    }
                    questionId = followUpQuestion?.id?.toString() ?? '';
                    // print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $questionId');
                  }

                  if (questionId.isNotEmpty) {
                    controller.sendMessage(
                      journallist.id.toString(),
                      null, // mediaPath
                      option.toLowerCase(), // "yes" or "no"

                      null,
                      item.questionId,
                    );
                  }
                }
              },
            );
            if (item.type == MessageType.question && index < items.length - 1) {
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
      ],
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  String? _getLastVisibleQuestionId(Journal? journal) {
    if (journal == null) return null;

    // Check if we're in follow-up questions
    if (journal.mainQuestions?.every((q) => q.answered ?? false) ?? false) {
      return null;
    }

    // Find last visible main question
    for (var i = journal.mainQuestions!.length - 1; i >= 0; i--) {
      final question = journal.mainQuestions![i];
      if (i == 0 || (journal.mainQuestions![i - 1].answered ?? false)) {
        return question.id.toString();
      }
    }

    return null;
  }

  String? _getLastVisibleFollowUpQuestionId(Journal? journal) {
    for (var i = journal!.followUpQuestions!.length - 1; i >= 0; i--) {
      final question = journal.followUpQuestions![i];
      if (i == 0 || (journal.followUpQuestions![i - 1].answered ?? false)) {
        return question.id.toString();
      }
    }
    return null;
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
        body: SafeArea(
          child: Obx(
            () => Column(
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
                            .journalWithQuestionsAndAnswers.value.data?.journal;
                        if (journal == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        var items = <MessageItem>[];
                        var shouldShowQuestion = true;

                        // Check if all main questions are answered
                        var allQuestionsAnswered = journal.mainQuestions
                                ?.every((q) => q.answered ?? false) ??
                            false;

                        for (var i = 0;
                            i < (journal.mainQuestions?.length ?? 0);
                            i++) {
                          final mainQuestion = journal.mainQuestions![i];
                          var questionTimestamp = '';
                          // Check if question should be shown
                          if (i > 0) {
                            final previousQuestion =
                                journal.mainQuestions![i - 1];
                            shouldShowQuestion =
                                previousQuestion.answered ?? false;
                            if (shouldShowQuestion &&
                                previousQuestion.answer?.createdAt != null) {
                              questionTimestamp =
                                  previousQuestion.answer?.createdAt ?? '';
                            }
                          }

                          if (shouldShowQuestion) {
                            // Add main question
                            items.add(
                              MessageItem(
                                type: MessageType.question,
                                message: mainQuestion.question!,
                                timestamp: i == 0
                                    ? DateTime.now().toString()
                                    : questionTimestamp,
                                isMine: false,
                              ),
                            );

                            // Add answer if exists
                            if (mainQuestion.answered == true) {
                              items.add(
                                MessageItem(
                                  type: MessageType.answer,
                                  message: mainQuestion.answer?.text ?? '',
                                  timestamp: mainQuestion.answer?.createdAt ??
                                      DateTime.now().toString(),
                                  isMine: true,
                                  images: mainQuestion.answer?.media?.images,
                                  videos: mainQuestion.answer?.media?.videos,
                                  voices: mainQuestion.answer?.media?.voices,
                                ),
                              );
                            }
                          }
                        }

                        final firstFollowUpAnswered =
                            journal.followUpQuestions?.isNotEmpty == true &&
                                (journal.followUpQuestions![0].answered ??
                                    false);
                        return SingleChildScrollView(
                          controller: controller.scrollController,
                          child: Column(
                            children: [
                              ListView.builder(
                                // reverse: true,
                                shrinkWrap: true,
                                // controller: controller.scrollController,
                                physics: const NeverScrollableScrollPhysics(),
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                itemCount: items.length,
                                // itemCount: items.length,
                                itemBuilder: (context, index) {
                                  final item = items[index];
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

                                    if (index == 0) {
                                      final timestamp = items.length == 1
                                          ? DateTime.now().toString()
                                          : nextItem.timestamp;
                                      messageWidget = ChatBubbleContainer(
                                        isJournal: true,
                                        message: item.message,
                                        isMine: item.isMine,
                                        timeStamp: timestamp ?? '',
                                        onLike: () {},
                                        images: item.images,
                                        videos: item.videos,
                                        voices: item.voices,
                                        // onYesNoOptionSelected: (option) {},
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
                              if (allQuestionsAnswered && firstFollowUpAnswered)
                                // Show follow-up questions
                                showFollowUpQuestions(),
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
                    String? mainQuestionId;
                    String? followupQuestionId;
                    var isYesNoQuestion = false;

                    // Check if all main questions are answered
                    final allMainQuestionsAnswered = journal?.mainQuestions
                            ?.every((q) => q.answered ?? false) ??
                        false;

                    if (!allMainQuestionsAnswered) {
                      mainQuestionId = _getLastVisibleQuestionId(journal);
                      followupQuestionId = null;
                    } else {
                      followupQuestionId =
                          _getLastVisibleFollowUpQuestionId(journal);
                      mainQuestionId = null;
                      if (followupQuestionId != null) {
                        final question =
                            journal?.followUpQuestions?.firstWhereOrNull(
                          (q) => q.id?.toString() == followupQuestionId,
                        );
                        isYesNoQuestion = question?.questionType == 'yes_no';
                      }
                    }
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
                  }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
