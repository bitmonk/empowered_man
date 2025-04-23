import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_bubble_container.dart';
import 'package:empowered/features/journal_chat/data/model/chat_conversation_model.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_emotion_name_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_chat_input_field.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_drawer.dart';

class JournalChatScreen extends StatefulWidget {
  const JournalChatScreen({
    super.key,
    this.isFromGoals = false,
    this.initialEmotionId,
  });
  final bool isFromGoals;
  final int? initialEmotionId;

  @override
  State<JournalChatScreen> createState() => _JournalChatScreenState();
}

class _JournalChatScreenState extends State<JournalChatScreen> {
  final controller = Get.find<JournalChatController>();

  late FocusNode focusNode;
  bool hasStartedJournaling = false;
  bool showWidget = false;
  bool buttonPressed = false;
  String? currentMainQuestionId;
  String? currentFollowUpQuestionId;
  bool _isSendingMessage = false;

  @override
  void initState() {
    super.initState();
   
    _initializeController();
    focusNode = FocusNode();
    Get.find<JournalEmotionNameController>().selectedEmotionId.value =
        widget.initialEmotionId?.toString() ?? '';

    controller.selectedEmotionId.listen((id) {
      if (id != null && id.isNotEmpty) {
        controller.getJournalWithQuestionsAndAnswers(id).then((_) {
          // Ensure we scroll to bottom after data is loaded
          WidgetsBinding.instance.addPostFrameCallback((_) {
            controller.scrollToBottom();
          });
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.scrollToBottom();
    });
  }

  void _initializeController() {
    final selectedEmotionId =
        Get.find<JournalEmotionNameController>().selectedEmotionId.value;
    if (selectedEmotionId != null && selectedEmotionId.isNotEmpty) {
      controller.getJournalWithQuestionsAndAnswers(selectedEmotionId);
    } else if (widget.initialEmotionId != null) {
      controller.getJournalWithQuestionsAndAnswers(
        widget.initialEmotionId.toString(),
      );
    } _firstFollowUpQuestionAnswered();
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

    if (journallist == null ) {
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
                    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $questionId');
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
                    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $questionId');
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

  void  _firstFollowUpQuestionAnswered() {
    final journal =
        controller.journalWithQuestionsAndAnswers.value.data?.journal;
    if (journal == null ||
        journal.followUpQuestions == null ||
        journal.followUpQuestions!.isEmpty) {
      setState(() {
        showWidget = false;
      
      });
      // return false;
    }
    var state = journal?.followUpQuestions![0].answered ?? false;
   
    setState(() {
        showWidget = state;
       
      });
    //return journal.followUpQuestions![0].answered ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppWidgetKey.journalKey,
      drawer: const JournalDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: JournalHeader(
                  title: controller.journalWithQuestionsAndAnswers.value.data!
                          .journal!.emotionName ??
                      '',
                  onDrawerTap: () {
                    AppWidgetKey.journalKey.currentState!.openDrawer();
                  },
                ),
              ),
            ),
            if (widget.initialEmotionId == null)
              const Text('No internet')
            else
              Expanded(
                child: Obx(() {
                  final journal = controller
                      .journalWithQuestionsAndAnswers.value.data?.journal;
                  if (journal == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.isLoading.value) {
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
                      final previousQuestion = journal.mainQuestions![i - 1];
                      shouldShowQuestion = previousQuestion.answered ?? false;
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

                  // Add any sent messages from chatConversationList that aren't already in the items list
                  // if (controller.chatConversationList.isNotEmpty) {
                  //   for (final sentMessage in controller.chatConversationList) {
                  //     if (!items.any(
                  //       (item) =>
                  //           item.type == sentMessage.type &&
                  //           item.message == sentMessage.message &&
                  //           item.isMine == sentMessage.isMine,
                  //     )) {
                  //       items.add(sentMessage);
                  //     }
                  //   }
                  // }
                  return controller.journalChatConversationState.value
                      .showWidget(
                    orElse: () => CustomErrorWidget(
                      onPressed: () {},
                    ),
                    loading: () => const LoadingWidget(),
                    success: () => SingleChildScrollView(
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
                              vertical: 24,
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
                                isYesNoQuestion: messageItem.isYesNoQuestion,
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

                          if (allQuestionsAnswered)
                            if (showWidget)
                              showFollowUpQuestions()
                            else 
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
                                      showWidget = true;
                                     
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
                    ),
                  );
                }),
              ),
            Obx(() {
              final journalCompleted = controller
                      .journalWithQuestionsAndAnswers.value.data?.isCompleted ??
                  false;
              final journal =
                  controller.journalWithQuestionsAndAnswers.value.data?.journal;
              String? mainQuestionId;
              String? followupQuestionId;
              var isYesNoQuestion = false;
              // Check if all main questions are answered
              final allMainQuestionsAnswered =
                  journal?.mainQuestions?.every((q) => q.answered ?? false) ??
                      false;

              if (!allMainQuestionsAnswered) {
                mainQuestionId = _getLastVisibleQuestionId(journal);
                followupQuestionId = null;
              } else {
                followupQuestionId = _getLastVisibleFollowUpQuestionId(journal);
                mainQuestionId = null;
                if (followupQuestionId != null) {
                  final question = journal?.followUpQuestions?.firstWhereOrNull(
                      (q) => q.id?.toString() == followupQuestionId,);
                  isYesNoQuestion = question?.questionType == 'yes_no';
                  print(
                      '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>@@@@@@@@@@@@@@@@@@@@@@@ $isYesNoQuestion',);
                }
              }

              if (journalCompleted == false && isYesNoQuestion == false) {
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
                      final newMessage = MessageItem(
                        type: MessageType.answer,
                        message: controller.chatController.text.trim(),
                        timestamp: DateTime.now().toString(),
                        isMine: true,
                        isLoading: true,
                      );
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
                return const SizedBox(
                  height: 1,
                  width: double.infinity,
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

class MessageItem {
  MessageItem({
    required this.type,
    required this.message,
    required this.isMine,
    this.timestamp,
    this.images,
    this.videos,
    this.voices,
    this.isLoading = false,
    this.isYesNoQuestion = false,
    this.selectedOption,
    this.questionId,
    this.answered = false,
  });
  final MessageType type;
  final String message;
  final String? timestamp;
  final bool isMine;
  final List<String>? images;
  final List<String>? videos;
  final List<String>? voices;
  final bool isLoading;
  final bool isYesNoQuestion;
  final String? selectedOption;
  final String? questionId;
  final bool answered;
}

enum MessageType { question, answer, option }
