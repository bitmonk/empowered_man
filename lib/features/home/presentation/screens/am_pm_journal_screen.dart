import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_bubble_container.dart';
import 'package:empowered/features/home/data/model/reflection_question_answer_model.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_journal_chat_controller.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_library_bindings.dart';
import 'package:empowered/features/home/presentation/screens/reflection_library_screen.dart';
import 'package:empowered/features/home/presentation/screens/widgets/am_pm_chat_input_field.dart';
import 'package:empowered/features/home/presentation/screens/widgets/custom_rich_text_input.dart';
import 'package:empowered/features/journal_chat/data/model/message_item.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_chat_exit_bottomsheet.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class AmPmJournalScreen extends StatefulWidget {
  const AmPmJournalScreen({required this.reflectionType, super.key});
  final String? reflectionType;
  @override
  State<AmPmJournalScreen> createState() => _AmPmJournalScreenState();
}

class _AmPmJournalScreenState extends State<AmPmJournalScreen> {
  late FocusNode focusNode;
  final controller = Get.find<ReflectionJournalChatController>();
  bool _isSendingMessage = false;
  bool _isShowingThinking = false; // Add this to track thinking state
  bool _isKeyboardVisible = false;
  final Map<String, String> _yesNoAnswers = {};
  MessageItem? _pendingAnswer;

  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
    controller.getReflectionWithQuestionAnswers(widget.reflectionType ?? '');
    focusNode.addListener(_onFocusChange);
    ReflectionEmotionNameInitializer.destroy();
    ReflectionEmotionNameInitializer.initialize();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.scrollToBottom();
    });
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

  // List<MessageItem> buildCompleteMessageList(Reflection? reflection) {
  //   if (reflection == null || reflection.mainQuestions == null) {
  //     return [];
  //   }

  //   var items = <MessageItem>[];
  //   var stopAddingQuestions = false;

  //   // First, process all answered questions and their answers
  //   for (var i = 0; i < reflection.mainQuestions!.length; i++) {
  //     final mainQuestion = reflection.mainQuestions![i];
  //     var questionTimestamp = '';

  //     if (i > 0) {
  //       final previousQuestion = reflection.mainQuestions![i - 1];
  //       if (previousQuestion.answer?.createdAt != null) {
  //         questionTimestamp =
  //             previousQuestion.answer?.createdAt.toString() ?? '';
  //       }
  //     }

  //     // Always add the main question if it's already answered
  //     // (don't filter based on _isShowingThinking for answered questions)
  //     if (mainQuestion.answered == true) {
  //       items.add(
  //         MessageItem(
  //           type: MessageType.question,
  //           message: mainQuestion.question!,
  //           timestamp: i == 0 ? DateTime.now().toString() : questionTimestamp,
  //           isMine: false,
  //         ),
  //       );
  //     } else if (!_isShowingThinking) {
  //       // Only add unanswered questions when not in thinking state
  //       items.add(
  //         MessageItem(
  //           type: MessageType.question,
  //           message: mainQuestion.question!,
  //           timestamp: i == 0 ? DateTime.now().toString() : questionTimestamp,
  //           isMine: false,
  //         ),
  //       );
  //     }

  //     // If this question isn't answered, stop after adding it (unless we're in thinking state)
  //     if (mainQuestion.answered != true) {
  //       stopAddingQuestions = true;
  //       break;
  //     }

  //     // Add the answer for this question
  //     items.add(
  //       MessageItem(
  //         type: MessageType.answer,
  //         message: mainQuestion.answer?.text ?? '',
  //         timestamp: mainQuestion.answer?.createdAt.toString() ??
  //             DateTime.now().toString(),
  //         isMine: true,
  //         answerId: mainQuestion.answer?.id.toString(),
  //       ),
  //     );

  //     // Process follow-up questions if any
  //     if (!stopAddingQuestions && mainQuestion.followUpQuestions != null) {
  //       for (var followUp in mainQuestion.followUpQuestions!) {
  //         // Always add follow-up questions if they're already answered
  //         if (followUp.answered == true) {
  //           items.add(
  //             MessageItem(
  //               type: MessageType.question,
  //               message: followUp.question ?? '',
  //               timestamp: DateTime.now().toString(),
  //               isMine: false,
  //               isYesNoQuestion: followUp.questionType == 'yes_no',
  //             ),
  //           );
  //         } else if (!_isShowingThinking) {
  //           // Only add unanswered follow-up questions when not in thinking state
  //           items.add(
  //             MessageItem(
  //               type: MessageType.question,
  //               message: followUp.question ?? '',
  //               timestamp: DateTime.now().toString(),
  //               isMine: false,
  //               isYesNoQuestion: followUp.questionType == 'yes_no',
  //             ),
  //           );
  //         }

  //         // If this follow-up is not answered, stop here
  //         if (followUp.answered != true) {
  //           stopAddingQuestions = true;
  //           break;
  //         }

  //         // Add follow-up answer
  //         items.add(
  //           MessageItem(
  //             type: MessageType.answer,
  //             message: followUp.answer?.text ?? '',
  //             timestamp: followUp.answer?.createdAt.toString() ??
  //                 DateTime.now().toString(),
  //             isMine: true,
  //             answerId: followUp.answer?.id?.toString(),
  //           ),
  //         );
  //       }
  //     }

  //     if (stopAddingQuestions) {
  //       break;
  //     }
  //   }

  //   // Add pending answer if available
  //   if (_isSendingMessage && _pendingAnswer != null) {
  //     items.add(_pendingAnswer!);
  //   }

  //   // Always add thinking indicator if we're in thinking state
  //   // This ensures it appears for both yes/no and regular questions
  //   if (_isShowingThinking) {
  //     items.add(
  //       MessageItem(
  //         type: MessageType.question,
  //         message: '', // Empty message for thinking indicator
  //         timestamp: DateTime.now().toString(),
  //         isMine: false,
  //         isThinking: true,
  //       ),
  //     );
  //   }

  //   return items;
  // }
  List<MessageItem> buildCompleteMessageList(Reflection? reflection) {
    if (reflection == null || reflection.mainQuestions == null) {
      return [];
    }

    var items = <MessageItem>[];
    var stopAddingQuestions = false;

    // First, process all answered questions and their answers
    for (var i = 0; i < reflection.mainQuestions!.length; i++) {
      final mainQuestion = reflection.mainQuestions![i];
      var questionTimestamp = '';

      if (i > 0) {
        final previousQuestion = reflection.mainQuestions![i - 1];
        if (previousQuestion.answer?.createdAt != null) {
          questionTimestamp =
              previousQuestion.answer?.createdAt.toString() ?? '';
        }
      }

      // Always add the main question if it's already answered
      if (mainQuestion.answered == true) {
        items.add(
          MessageItem(
            type: MessageType.question,
            message: mainQuestion.question!,
            timestamp: i == 0 ? DateTime.now().toString() : questionTimestamp,
            isMine: false,
          ),
        );
      } else if (!_isShowingThinking) {
        // Only add unanswered questions when not in thinking state
        items.add(
          MessageItem(
            type: MessageType.question,
            message: mainQuestion.question!,
            timestamp: i == 0 ? DateTime.now().toString() : questionTimestamp,
            isMine: false,
          ),
        );
      }

      // If this question isn't answered, stop after adding it (unless we're in thinking state)
      if (mainQuestion.answered != true) {
        stopAddingQuestions = true;
        break;
      }

      // Add the answer for this question
      items.add(
        MessageItem(
          type: MessageType.answer,
          message: mainQuestion.answer?.text ?? '',
          timestamp: mainQuestion.answer?.createdAt.toString() ??
              DateTime.now().toString(),
          isMine: true,
          answerId: mainQuestion.answer?.id.toString(),
        ),
      );

      // Process follow-up questions if any
      if (!stopAddingQuestions && mainQuestion.followUpQuestions != null) {
        for (final followUp in mainQuestion.followUpQuestions!) {
          // Always add follow-up questions if they're already answered
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
          } else if (!_isShowingThinking) {
            // Only add unanswered follow-up questions when not in thinking state
            items.add(
              MessageItem(
                type: MessageType.question,
                message: followUp.question ?? '',
                timestamp: DateTime.now().toString(),
                isMine: false,
                isYesNoQuestion: followUp.questionType == 'yes_no',
              ),
            );
          }

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
              timestamp: followUp.answer?.createdAt.toString() ??
                  DateTime.now().toString(),
              isMine: true,
              answerId: followUp.answer?.id?.toString(),
            ),
          );
        }
      }

      if (stopAddingQuestions) {
        break;
      }
    }

    // Add pending answer if available
    if (_isSendingMessage && _pendingAnswer != null) {
      items.add(_pendingAnswer!);
    }

    // Always add thinking indicator at the end if we're in thinking state
    if (_isShowingThinking) {
      items.add(
        MessageItem(
          type: MessageType.question,
          message: '', // Empty message for thinking indicator
          timestamp: DateTime.now().toString(),
          isMine: false,
          isThinking: true,
        ),
      );
    }

    return items;
  }

  Map<String, String?> getNextQuestionIds(Reflection? reflection) {
    if (reflection == null || reflection.mainQuestions == null) {
      return {'mainQuestionId': null, 'followUpQuestionId': null};
    }

    for (final mainQuestion in reflection.mainQuestions!) {
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
      final reflection =
          controller.reflectionQuestionAnswerResponse.value.data?.reflection;
      final questionIds = getNextQuestionIds(reflection);
      final mainQuestionId = questionIds['mainQuestionId'];
      final followupQuestionId = questionIds['followUpQuestionId'];

      // Ensure the thinking indicator displays for a minimum time
      // to provide better user experience
      await Future.delayed(const Duration(seconds: 2));

      await controller.sendMessage(
        reflection?.id?.toString() ?? '',
        null,
        option,
        mainQuestionId,
        followupQuestionId,
      );

      await controller
          .getReflectionWithQuestionAnswers(widget.reflectionType ?? '');

      // Add a small delay to ensure the thinking animation is visible
      await Future.delayed(const Duration(milliseconds: 500));

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          controller.autoScrollEnabled.value = true;
          controller.scrollToBottom();
        }
      });
    } catch (e) {
      print('Error in yes/no selection: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isSendingMessage = false;
          _isShowingThinking = false;
          _pendingAnswer = null;
        });
      }
    }
  }

  bool isYesNoQuestionType(Reflection? reflection, String? followUpQuestionId) {
    if (reflection == null ||
        reflection.mainQuestions == null ||
        followUpQuestionId == null) {
      return false;
    }

    for (final mainQuestion in reflection.mainQuestions!) {
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
        final isCompleted = controller
                .reflectionQuestionAnswerResponse.value.data?.isCompleted ??
            false;

        if (!isCompleted) {
          await showModalBottomSheet(
            isScrollControlled: true,
            useRootNavigator: true,
            useSafeArea: true,
            context: context,
            builder: (context) => ReflectionExitBottomsheet(
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
          AppWidgetKey.mainScaffold.currentState?.openDrawer();
          return false;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          onTap: () async {
            final isCompleted = controller
                    .reflectionQuestionAnswerResponse.value.data?.isCompleted ??
                false;

            if (!isCompleted) {
              await showModalBottomSheet(
                isScrollControlled: true,
                useRootNavigator: true,
                useSafeArea: true,
                context: context,
                builder: (context) => ReflectionExitBottomsheet(
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
          title: widget.reflectionType == 'am' ? 'AM Journal' : 'PM Journal',
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {
                  Get.to(const ReflectionLibraryScreen());
                  // AppWidgetKey.mainScaffold.currentState!.openDrawer();
                },
                child: Assets.images.menu.svg(width: 32),
              ),
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
              child: Obx(
                () => controller.reflectionQuestionAnswerResponseState.value
                    .showWidget(
                  orElse: () => const LoadingWidget(),
                  error: () => Center(
                    child: CustomErrorWidget(
                      onPressed: () {},
                    ),
                  ),
                  success: () {
                    final reflection = controller
                        .reflectionQuestionAnswerResponse
                        .value
                        .data
                        ?.reflection;
                    if (reflection == null) {
                      return const Center(
                        child: LoadingWidget(),
                      );
                    }
                    final items = buildCompleteMessageList(reflection);
                    final questionIds = getNextQuestionIds(reflection);
                    final followupQuestionId =
                        questionIds['followUpQuestionId'];
                    return Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
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
                                    final messageItem = MessageItem(
                                      type: item.type,
                                      message: item.message,
                                      timestamp: item.timestamp,
                                      isMine: item.isMine,
                                      isThinking: item.isThinking,
                                      isYesNoQuestion: item.isYesNoQuestion,
                                      isLoading: item.isLoading,
                                      selectedOption: item.selectedOption,
                                      answered: item.answered,
                                      answerId: item.answerId,
                                    );

                                    // Create the base message widget
                                    Widget messageWidget =
                                        ChatBubbleContainer(
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
                                      isThinking: messageItem.isThinking,
                                      isAnswered: messageItem
                                              .isYesNoQuestion &&
                                          item.type == MessageType.question &&
                                          index < items.length - 1 &&
                                          items[index + 1].type ==
                                              MessageType.answer,
                                      onYesNoOptionSelected: (option) {
                                        if (messageItem.isYesNoQuestion &&
                                            followupQuestionId != null) {
                                          _handleYesNoSelection(
                                            option,
                                            followupQuestionId,
                                          );
                                        }
                                      },
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

                                    // Add spacing between questions and their answers
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
                                const SizedBox(height: 60),
                                const SizedBox(
                                  height: 1,
                                  width: double.infinity,
                                  key: ValueKey('scroll-bottom-anchor'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Obx(() {
                          final reflection = controller
                              .reflectionQuestionAnswerResponse
                              .value
                              .data
                              ?.reflection;
                          final questionIds = getNextQuestionIds(reflection);
                          final mainQuestionId = questionIds['mainQuestionId'];
                          final followupQuestionId =
                              questionIds['followUpQuestionId'];
                          final isYesNoQuestion = isYesNoQuestionType(
                            reflection,
                            followupQuestionId,
                          );
                          if (isYesNoQuestion == false) {
                            return AmPmChatInputField(
                              focusNode: focusNode,
                              reflectionId: reflection?.id?.toString() ?? '',
                              mainQuestionId: mainQuestionId,
                              followupQuestionId: followupQuestionId,
                              isDisabled: _isShowingThinking,
                              onMessageSent: () async {
                                final message =
                                    controller.chatController.text.trim();
                                if (message.isEmpty) return;
                                setState(() {
                                  _isSendingMessage = true;
                                  _isShowingThinking = true;
                                  _pendingAnswer = MessageItem(
                                    type: MessageType.answer,
                                    message: message,
                                    timestamp: DateTime.now().toString(),
                                    isMine: true,
                                    isLoading: true,
                                  );
                                });
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  if (mounted) {
                                    setState(() {});
                                    controller.scrollToBottom();
                                  }
                                });
                                try {
                                  await Future.delayed(
                                    const Duration(seconds: 3),
                                  );
                                  // Get the updated reflection data after the message is sent/updated
                                  await controller
                                      .getReflectionWithQuestionAnswers(
                                    widget.reflectionType ?? '',
                                  );
                                  await Future.delayed(
                                      const Duration(milliseconds: 500),);

                                  // Scroll to show the new question
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    if (mounted) {
                                      controller.autoScrollEnabled.value = true;
                                      controller.scrollToBottom();
                                    }
                                  });
                                } catch (e) {
                                  print('Error sending message: $e');
                                } finally {
                                  if (mounted) {
                                    setState(() {
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
                        }),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
