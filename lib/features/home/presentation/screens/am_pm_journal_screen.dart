import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_journal_chat_controller.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_library_bindings.dart';
import 'package:empowered/features/home/presentation/screens/reflection_library_screen.dart';
import 'package:empowered/features/home/presentation/screens/widgets/am_pm_chat_input_field.dart';
import 'package:empowered/features/home/presentation/screens/widgets/reflection_chat_bubble.dart';
import 'package:empowered/features/journal_chat/data/model/message_item.dart';
import 'package:empowered/features/journal_chat/presentation/screens/journal_chat_screen.dart';
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

  bool _isKeyboardVisible = false;

  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
    controller.chatController.clear();
    controller.resetEditMode();
    controller.getReflectionWithQuestionAnswers(widget.reflectionType ?? '');
    focusNode.addListener(_onFocusChange);
    ReflectionEmotionNameInitializer.destroy();
    ReflectionEmotionNameInitializer.initialize();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.scrollToBottom();
      AppWidgetKey.mainScaffold.currentState?.openEndDrawer();
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

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange);
    super.dispose();
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
                controller.getReflectionWithQuestionAnswers(
                    widget.reflectionType ?? '');

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
                    controller.getReflectionWithQuestionAnswers(
                        widget.reflectionType ?? '');

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
                      onPressed: () {
                        controller.getReflectionWithQuestionAnswers(
                          widget.reflectionType ?? '',
                        );
                      },
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

                    return Column(
                      children: [
                        Expanded(
                          child: controller
                              .reflectionQuestionAnswerResponseState.value
                              .showWidget(
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
                              return Obx(
                                () {
                                  final items = controller
                                      .buildCompleteMessageList(reflection);
                                  final questionIds =
                                      controller.getNextQuestionIds(reflection);
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
                                            final messageItem = MessageItem(
                                              type: item.type,
                                              message: item.message,
                                              timestamp: item.timestamp,
                                              isMine: item.isMine,
                                              isThinking: item.isThinking,
                                              isYesNoQuestion:
                                                  item.isYesNoQuestion,
                                              isLoading: item.isLoading,
                                              selectedOption:
                                                  item.selectedOption,
                                              answered: item.answered,
                                              answerId: item.answerId,
                                              questionId: item.questionId,
                                              createdAt: item.createdAt,
                                              updatedAt: item.updatedAt,
                                              isEdited: item.isEdited,
                                            );

                                            // Create the base message widget
                                            Widget messageWidget =
                                                ReflectionChatBubbleContainer(
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
                                              isYesNoQuestion:
                                                  messageItem.isYesNoQuestion,
                                              selectedOption:
                                                  messageItem.selectedOption,
                                              isThinking:
                                                  messageItem.isThinking,
                                              isAnswered: messageItem
                                                      .isYesNoQuestion &&
                                                  item.type ==
                                                      MessageType.question &&
                                                  index < items.length - 1 &&
                                                  items[index + 1].type ==
                                                      MessageType.answer,
                                              onYesNoOptionSelected: (option) {
                                                if (messageItem
                                                        .isYesNoQuestion &&
                                                    followupQuestionId !=
                                                        null) {
                                                  controller
                                                      .handleYesNoSelection(
                                                    option,
                                                    followupQuestionId,
                                                  );
                                                }
                                              },
                                              questionId: item.questionId,
                                              answerId: messageItem.isMine
                                                  ? messageItem.answerId
                                                  : null,
                                              createdAt: messageItem.createdAt,
                                              updatedAt: messageItem.updatedAt,
                                              isEdited: messageItem.isEdited,
                                              onEditTap: () {
                                                if (messageItem
                                                        .isYesNoQuestion &&
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
                                                  controller
                                                          .chatController.text =
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
                                              onYesNoEdit: (option, answerId,
                                                  questionId) {
                                                controller.updateYesNoAnswer(
                                                  option,
                                                  answerId,
                                                  questionId,
                                                );
                                              },
                                            );

                                            // Add spacing between questions and their answers
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
                              );
                            },
                          ),
                        ),
                        Obx(() {
                          final reflectionCompleted = controller
                                  .reflectionQuestionAnswerResponse
                                  .value
                                  .data
                                  ?.isCompleted ??
                              false;
                          final reflection = controller
                              .reflectionQuestionAnswerResponse
                              .value
                              .data
                              ?.reflection;
                          final questionIds =
                              controller.getNextQuestionIds(reflection);
                          final mainQuestionId = questionIds['mainQuestionId'];
                          final followupQuestionId =
                              questionIds['followUpQuestionId'];
                          final isYesNoQuestion =
                              controller.isYesNoQuestionType(
                            reflection,
                            followupQuestionId,
                          );
                          if (reflectionCompleted) {
                            if (controller.isJustCompleted.value) {
                              return JournalThankYouWidget(
                                onContinuePressed:
                                    controller.navigateToJournalLibrary,
                                buttonTitle: 'Go to Reflection Library',
                              );
                            }
                          }
                          if ((reflectionCompleted == false &&
                                  isYesNoQuestion == false) ||
                              controller.isEditMode.value) {
                            return AmPmChatInputField(
                              focusNode: focusNode,
                              reflectionId: reflection?.id?.toString() ?? '',
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
