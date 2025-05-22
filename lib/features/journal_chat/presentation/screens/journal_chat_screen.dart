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
  bool _isSendingMessage = false;
  bool _isKeyboardVisible = false;
  final Map<String, String> _yesNoAnswers = {};
  MessageItem? _pendingAnswer;
  bool _isShowingThinking = false;
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
    var stopAddingQuestions = false;
    var shouldShowThinking = false;
    var hasUnansweredQuestion = false;

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
      if (mainQuestion.answered == true) {
        items.add(
          MessageItem(
            type: MessageType.question,
            message: mainQuestion.question!,
            timestamp: i == 0 ? DateTime.now().toString() : questionTimestamp,
            isMine: false,
          ),
        );
      } else {
        // Add unanswered main question
        items.add(
          MessageItem(
            type: MessageType.question,
            message: mainQuestion.question!,
            timestamp: i == 0 ? DateTime.now().toString() : questionTimestamp,
            isMine: false,
          ),
        );

        hasUnansweredQuestion = true;
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
          answerId: mainQuestion.answer?.id.toString(),
        ),
      );

      // Process follow-up questions for this main question
      if (!stopAddingQuestions && mainQuestion.followUpQuestions != null) {
        for (final followUp in mainQuestion.followUpQuestions!) {
          // Add follow-up question
          if (followUp.answered == true) {
            items.add(
              MessageItem(
                type: MessageType.question,
                message: followUp.question ?? '',
                timestamp: DateTime.now().toString(),
                isMine: false,
                isYesNoQuestion: followUp.questionType == 'yes_no',
              ),
            );
          } else {
            // Add unanswered follow-up question
            items.add(
              MessageItem(
                type: MessageType.question,
                message: followUp.question ?? '',
                timestamp: DateTime.now().toString(),
                isMine: false,
                isYesNoQuestion: followUp.questionType == 'yes_no',
              ),
            );

            hasUnansweredQuestion = true;
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
              answerId: followUp.answer?.id?.toString(),
            ),
          );
        }
      }

      if (stopAddingQuestions) {
        break;
      }
    }

    if (_isSendingMessage && _pendingAnswer != null && hasUnansweredQuestion) {
      items.add(_pendingAnswer!);
    }

    if (_isShowingThinking && hasUnansweredQuestion) {
      items.add(
        MessageItem(
          type: MessageType.question,
          message: '',
          timestamp: DateTime.now().toString(),
          isMine: false,
          isThinking: true,
        ),
      );
    }

    return items;
  }

  void navigateToLibrary() {
    if (controller.journalWithQuestionsAndAnswers.value.data?.journal !=
        null) {}
    Get.back();
  }

  Map<String, String?> getNextQuestionIds(Journal? journal) {
    if (journal == null || journal.mainQuestions == null) {
      return {'mainQuestionId': null, 'followUpQuestionId': null};
    }

    for (final mainQuestion in journal.mainQuestions!) {
      if (mainQuestion.answered != true) {
        return {
          'mainQuestionId': mainQuestion.id?.toString(),
          'followUpQuestionId': null,
        };
      }

      if (mainQuestion.followUpQuestions != null) {
        for (final followUpQuestion in mainQuestion.followUpQuestions!) {
          if (followUpQuestion.answered != true) {
            return {
              'mainQuestionId': null,
              'followUpQuestionId': followUpQuestion.id?.toString(),
            };
          }
        }
      }
    }

    return {'mainQuestionId': null, 'followUpQuestionId': null};
  }

  Future<void> _handleYesNoSelection(String option, String questionId) async {
  // Set thinking state immediately
  setState(() {
    print('Setting thinking indicator to true for yes/no');
    _yesNoAnswers[questionId] = option;
    _isSendingMessage = true;
    _isShowingThinking = true;
    _pendingAnswer = MessageItem(
      type: MessageType.answer,
      message: option,
      timestamp: DateTime.now().toString(),
      isMine: true,
      isLoading: true,
    );
  });

  // Force an immediate rebuild to show thinking indicator
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (mounted) {
      setState(() {}); // Force rebuild explicitly
      controller.scrollToBottom();
    }
  });

  try {
    final journal =
        controller.journalWithQuestionsAndAnswers.value.data?.journal;
    final questionIds = getNextQuestionIds(journal);
    final mainQuestionId = questionIds['mainQuestionId'];
    final followupQuestionId = questionIds['followUpQuestionId'];

    // Ensure the thinking indicator has time to display
    await Future.delayed(const Duration(seconds: 1));

    await controller.sendMessage(
      journal?.id?.toString() ?? '',
      null,
      option,
      mainQuestionId,
      followupQuestionId,
    );

    setState(() {
      _isSendingMessage = false;
      _isShowingThinking = false;
      _pendingAnswer = null;
    });

    // Add delay to show thinking animation
    await Future.delayed(const Duration(seconds: 2));
    await controller.getJournalWithQuestionsAndAnswers();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        controller.autoScrollEnabled.value = true;
        controller.scrollToBottom();
      }
    });
  } catch (e) {
    print('Error in yes/no selection: $e');
    // Clear states on error too
    if (mounted) {
      setState(() {
        _isSendingMessage = false;
        _isShowingThinking = false;
        _pendingAnswer = null;
      });
    }
  }
}

  // void _handleJournalCompletion() {
  //   if (!_hasShownCompletionMessage) {
  //     _hasShownCompletionMessage = true;

  //     Container(
  //       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
  //       decoration: BoxDecoration(
  //         color: Theme.of(context).cardColor,
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black.withOpacity(0.1),
  //             blurRadius: 5,
  //             offset: const Offset(0, -3),
  //           ),
  //         ],
  //       ),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text(
  //             'Journal Completed!',
  //             style: Theme.of(context).textTheme.titleMedium?.copyWith(
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //           ),
  //           const SizedBox(height: 4),
  //           Text(
  //             'Redirecting to journal library...',
  //             style: Theme.of(context).textTheme.bodyMedium,
  //           ),
  //         ],
  //       ),
  //     );

  //     Future.delayed(const Duration(seconds: 5), () {
  //       if (mounted) {
  //         Get.to(const JournalLibrary());
  //       }
  //     });
  //   }
  // }

  bool isYesNoQuestionType(Journal? journal, String? followUpQuestionId) {
    if (journal == null ||
        journal.mainQuestions == null ||
        followUpQuestionId == null) {
      return false;
    }

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

              // controller: controller,
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
                  // controller: controller,
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

                              // Get the complete message list (this will include thinking indicator if active)
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
                                        // if (item.type == MessageType.thinking) {
                                        //   return ChatBubbleContainer(
                                        //     isJournal: true,
                                        //     message: '',
                                        //     isMine: false,
                                        //     timeStamp: item.timestamp ?? '',
                                        //     isThinking: true,
                                        //     onLike: () {},
                                        //   );
                                        // }
                                        final messageItem = MessageItem(
                                          type: item.type,
                                          message: item.message,
                                          timestamp: item.timestamp,
                                          isMine: item.isMine,
                                          images: item.images,
                                          videos: item.videos,
                                          voices: item.voices,
                                          isLoading: item.isLoading,
                                          isYesNoQuestion: item.isYesNoQuestion,
                                          selectedOption: item.selectedOption,
                                          answered: item.answered,
                                          isThinking: item.isThinking,
                                          answerId: item.answerId,
                                        );

                                        Widget messageWidget =
                                            ChatBubbleContainer(
                                          isJournal: true,
                                          message: messageItem.message,
                                          isMine: messageItem.isMine,
                                          timeStamp:
                                              messageItem.timestamp ?? '',
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
                                              _handleYesNoSelection(
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
                                          onEditTap: () {
                                            controller.chatController.text =
                                                messageItem.message;
                                            if (messageItem.answerId != null) {
                                              controller.setEditMode(
                                                true,
                                                messageItem.answerId!,
                                              );
                                            }
                                            Navigator.pop(context);
                                          },
                                        );

                                        if (item.type == MessageType.question &&
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
                                              controller.showBeginJournallButton
                                                  .value = false;
                                            });
                                          },
                                        ),
                                      ),
                                    // if (showCompletionMessage)
                                    //   JournalCompletedWidget(
                                    //     onContinuePressed: () {
                                    //       navigateToLibrary();
                                    //     },
                                    //   ),
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
                              .journalWithQuestionsAndAnswers
                              .value
                              .data
                              ?.journal;

                          final questionIds = getNextQuestionIds(journal);
                          final mainQuestionId = questionIds['mainQuestionId'];
                          final followupQuestionId =
                              questionIds['followUpQuestionId'];

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
                                isDisabled: _isShowingThinking,
                                onMessageSent: () async {
                                  // Set thinking state immediately
                                  if (controller.chatController.text.isEmpty)
                                    return;
                                  setState(() {
                                    print(
                                      'Setting thinking indicator to true for text input',
                                    );
                                    _isSendingMessage = true;
                                    _isShowingThinking = true;
                                    _pendingAnswer = MessageItem(
                                      type: MessageType.answer,
                                      message:
                                          controller.chatController.text.trim(),
                                      timestamp: DateTime.now().toString(),
                                      isMine: true,
                                      isLoading: true,
                                    );
                                  });

                                  // Force immediate rebuild and scroll
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    if (mounted) {
                                      setState(() {});
                                      controller.autoScrollEnabled.value = true;
                                      controller.scrollToBottom();
                                    }
                                  });

                                  try {
                                    // Add delay to show thinking animation
                                    await Future.delayed(
                                      const Duration(seconds: 3),
                                    );

                                    await controller
                                        .getJournalWithQuestionsAndAnswers();
                                    await Future.delayed(
                                      const Duration(milliseconds: 500),
                                    );
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      if (mounted) {
                                        controller.autoScrollEnabled.value =
                                            true;
                                        controller.scrollToBottom();
                                      }
                                    });
                                  } catch (e) {
                                    print('Error sending message: $e');
                                  } finally {
                                    if (mounted) {
                                      setState(() {
                                        print(
                                          'Setting thinking indicator to false for text input',
                                        );
                                        _isSendingMessage = false;
                                        _isShowingThinking = false;
                                        _pendingAnswer = null;
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
            );
          },
        ),
      ),
    );
  }
}

class JournalCompletedWidget extends StatelessWidget {
  const JournalCompletedWidget({
    required this.onContinuePressed,
    super.key,
  });
  final VoidCallback onContinuePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
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
            Icons.check_circle_outline,
            color: AppColors.appGreen,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            'Journal Entry Completed',
            style: AppTextStyles.bodyLGMedium.copyWith(
              color: AppColors.textColor100,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'You have completed all questions in this journal. Your responses have been saved successfully.',
            textAlign: TextAlign.center,
            style: AppTextStyles.textBodyB2.copyWith(
              color: AppColors.textColor200,
            ),
          ),
          const SizedBox(height: 24),
          AppOutlinedButton(
            text: 'Continue to Library',
            onPressed: onContinuePressed,
          ),
        ],
      ),
    );
  }
}
