import 'dart:async';

import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/data/model/reflection_question_answer_model.dart';
import 'package:empowered/features/home/data/source/reflection_journal_chat_remote_source.dart';
import 'package:empowered/features/home/presentation/screens/reflection_library_screen.dart';
import 'package:empowered/features/journal_chat/data/model/message_item.dart';

class ReflectionJournalChatController extends GetxController {
  ReflectionJournalChatController({required this.remoteSource});
  ReflectionJournalChatRemoteSource remoteSource;

  Rx<ReflectionQuestionAnswerModel> reflectionQuestionAnswerResponse =
      const ReflectionQuestionAnswerModel().obs;
  Rx<TheStates> reflectionQuestionAnswerResponseState = TheStates.initial.obs;
  Rx<TheStates> sendMessageState = TheStates.initial.obs;
  Rx<TheStates> updateMessageState = TheStates.initial.obs;

  CancelToken? _cancelToken;
  RxBool autoScrollEnabled = true.obs;
  late TextEditingController chatController;
  late ScrollController scrollController;
  RxList<MessageItem> chatConversationList = RxList<MessageItem>([]);
  // Thinking indicator states
  RxBool isShowingThinking = false.obs;
  RxBool isSendingMessage = false.obs;
  Rx<MessageItem?> pendingAnswer = Rx<MessageItem?>(null);
  final Map<String, String> yesNoAnswers = {};
  Timer? _scrollTimer;

  // Edit mode states
  RxBool isEditMode = false.obs;
  RxnString editingAnswerId = RxnString();
  RxBool isYesNoEditMode = false.obs;
  RxnString editingYesNoAnswerId = RxnString();
  RxnString editingYesNoQuestionId = RxnString();
  RxnString currentYesNoAnswer = RxnString();
  RxBool isJustCompleted = false.obs;
  RxBool wasAlreadyCompleted = false.obs;

  RxList<MessageItem> pendingMessages = RxList<MessageItem>([]);

  @override
  void onInit() {
    super.onInit();
    chatController = TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    ever(reflectionQuestionAnswerResponse,
        (ReflectionQuestionAnswerModel conversation) {
      if (conversation.data?.isCompleted == true && !isJustCompleted.value) {
        wasAlreadyCompleted.value = true;
      }
    });
    reflectionQuestionAnswerResponseState.listen((state) {
      if (state == TheStates.success && autoScrollEnabled.value) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollToBottom();
        });
      }
    });
  }

  @override
  void onClose() {
    chatController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void _debouncedScrollToBottom({int delay = 100}) {
    _scrollTimer?.cancel();
    _scrollTimer = Timer(Duration(milliseconds: delay), () {
      scrollToBottom();
    });
  }

  void _scrollListener() {
    if (scrollController.hasClients) {
      final position = scrollController.position;
      final maxScroll = position.maxScrollExtent;
      final currentScroll = position.pixels;

      if (maxScroll - currentScroll <= 100) {
        autoScrollEnabled.value = true;
      } else {
        autoScrollEnabled.value = false;
      }
    }
  }

  void setEditMode(bool isEdit, String answerId) {
    isEditMode.value = isEdit;
    editingAnswerId.value = answerId;
    isYesNoEditMode.value = false;
    editingYesNoAnswerId.value = null;
    editingYesNoQuestionId.value = null;
    currentYesNoAnswer.value = null;
  }

  void setYesNoEditMode(
    bool isEdit,
    String answerId,
    String currentAnswer,
    String questionId,
  ) {
    isYesNoEditMode.value = isEdit;
    editingYesNoAnswerId.value = answerId;
    editingYesNoQuestionId.value = questionId;
    currentYesNoAnswer.value = currentAnswer;
    isEditMode.value = false;
    editingAnswerId.value = null;
    chatController.clear();
  }

  void resetEditMode() {
    isEditMode.value = false;
    editingAnswerId.value = null;
    isYesNoEditMode.value = false;
    editingYesNoAnswerId.value = null;
    editingYesNoQuestionId.value = null;
    currentYesNoAnswer.value = null;
    chatController.clear();
  }

  void _showThinking({String? message}) {
    isShowingThinking.value = true;
    isSendingMessage.value = true;

    if (message != null) {
      print('Adding pending message: $message'); // Debug log

      // Add the user's message to pending messages
      pendingMessages.add(
        MessageItem(
          type: MessageType.answer,
          message: message,
          timestamp: DateTime.now().toString(),
          isMine: true,
        ),
      );

      update();
    }

    // Force UI update and scroll
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToBottom();
    });
  }

  void _hideThinking() {
    isShowingThinking.value = false;
    isSendingMessage.value = false;
    pendingAnswer.value = null;
  }

  Future<void> updateYesNoAnswer(
    String option,
    String answerId,
    String questionId,
  ) async {
    // if (editingAnswerId.value == null) return;
    updateMessageState.value = TheStates.loading;
    _cancelToken = CancelToken();
    autoScrollEnabled.value = true;

    try {
      final result = await remoteSource.updateMessage(
        _cancelToken,
        answerId,
        option,
      );

      result.fold(
        (l) {
          updateMessageState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) async {
          chatController.clear();
          resetEditMode();

          var period = DateTime.now().hour < 12 ? 'am' : 'pm';
          await getReflectionWithQuestionAnswers(period);
          update();
          await Future.delayed(const Duration(milliseconds: 100));

          _debouncedScrollToBottom(delay: 200);
          updateMessageState.value = TheStates.success;
        },
      );
    } catch (e) {
      updateMessageState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: e.toString());
      resetEditMode();
    }
  }

  String getLatestTimestampFromQuestion(MainQuestion question) {
    var latestTimestamp =
        question.answer?.createdAt.toString() ?? DateTime.now().toString();

    // Check follow-up questions for more recent timestamps
    if (question.followUpQuestions != null) {
      for (final followUp in question.followUpQuestions!) {
        if (followUp.answered == true && followUp.answer?.createdAt != null) {
          final followUpTime =
              DateTime.parse(followUp.answer!.createdAt!.toString());
          final currentLatest = DateTime.parse(latestTimestamp);

          if (followUpTime.isAfter(currentLatest)) {
            latestTimestamp = followUp.answer!.createdAt!.toString();
          }
        }
      }
    }

    return latestTimestamp;
  }

  List<MessageItem> buildCompleteMessageList(Reflection? reflection) {
    if (reflection == null || reflection.mainQuestions == null) {
      return [];
    }

    var items = <MessageItem>[];
    var foundUnansweredQuestion = false;

    // Process main questions and their follow-ups
    for (var i = 0; i < reflection.mainQuestions!.length; i++) {
      final mainQuestion = reflection.mainQuestions![i];
      var questionTimestamp = '';
      if (i == 0) {
        if (mainQuestion.answered == true &&
            mainQuestion.answer?.createdAt != null) {
          questionTimestamp = mainQuestion.answer!.createdAt!.toString();
        } else {
          questionTimestamp = DateTime.now().toString();
        }
      } else {
        final previousQuestion = reflection.mainQuestions![i - 1];
        questionTimestamp = getLatestTimestampFromQuestion(previousQuestion);
      }
      // if (i > 0) {
      //   final previousQuestion = reflection.mainQuestions![i - 1];
      //   if (previousQuestion.answer?.createdAt != null) {
      //     questionTimestamp =
      //         previousQuestion.answer?.createdAt.toString() ?? '';
      //   }
      // }

      // Add main question
      items.add(
        MessageItem(
          type: MessageType.question,
          message: mainQuestion.question!,
          timestamp: questionTimestamp,
          isMine: false,
          questionId: mainQuestion.id?.toString(),
          createdAt: questionTimestamp,
        ),
      );

      // Add the answer if it exists
      if (mainQuestion.answered == true && mainQuestion.answer != null) {
        items.add(
          MessageItem(
            type: MessageType.answer,
            message: mainQuestion.answer?.text ?? '',
            timestamp: mainQuestion.answer?.createdAt.toString() ??
                DateTime.now().toString(),
            isMine: true,
            images: mainQuestion.answer?.media?.images,
            videos: mainQuestion.answer?.media?.videos,
            voices: mainQuestion.answer?.media?.voices,
            answerId: mainQuestion.answer?.id.toString(),
            createdAt: mainQuestion.answer?.createdAt.toString() ??
                DateTime.now().toString(),
            updatedAt: mainQuestion.answer?.updatedAt.toString() ?? '',
          ),
        );

        // Process follow-up questions for answered main questions
        if (mainQuestion.followUpQuestions != null) {
          for (var j = 0; j < mainQuestion.followUpQuestions!.length; j++) {
            final followUp = mainQuestion.followUpQuestions![j];

            String followUpQuestionTimestamp;
            if (j == 0) {
              followUpQuestionTimestamp =
                  mainQuestion.answer?.createdAt.toString() ??
                      DateTime.now().toString();
            } else {
              final previousFollowUp = mainQuestion.followUpQuestions![j - 1];
              followUpQuestionTimestamp =
                  previousFollowUp.answer?.createdAt.toString() ??
                      mainQuestion.answer?.createdAt.toString() ??
                      DateTime.now().toString();
            }
            items.add(
              MessageItem(
                type: MessageType.question,
                message: followUp.question ?? '',
                timestamp: DateTime.now().toString(),
                isMine: false,
                isYesNoQuestion: followUp.questionType == 'yes_no',
                selectedOption: followUp.answered == true &&
                        followUp.questionType == 'yes_no'
                    ? followUp.answer?.text
                    : null,
                questionId: followUp.id?.toString(),
                createdAt: followUpQuestionTimestamp,
              ),
            );

            if (followUp.answered == true && followUp.answer != null) {
              items.add(
                MessageItem(
                  type: MessageType.answer,
                  message: followUp.answer?.text ?? '',
                  timestamp: followUp.answer?.createdAt.toString() ??
                      DateTime.now().toString(),
                  isMine: true,
                  images: followUp.answer?.media?.images,
                  videos: followUp.answer?.media?.videos,
                  voices: followUp.answer?.media?.voices,
                  answerId: followUp.answer?.id?.toString(),
                  isYesNoQuestion: followUp.questionType == 'yes_no',
                  selectedOption: followUp.questionType == 'yes_no'
                      ? followUp.answer?.text
                      : null,
                  questionId: followUp.id?.toString(),
                  createdAt: followUp.answer?.createdAt.toString() ??
                      DateTime.now().toString(),
                  updatedAt: followUp.answer?.updatedAt.toString() ?? '',
                ),
              );
            } else {
              // Found an unanswered follow-up question
              foundUnansweredQuestion = true;
              break;
            }
          }
        }
      } else {
        // Found an unanswered main question
        foundUnansweredQuestion = true;
      }

      // Stop processing if we found an unanswered question
      if (foundUnansweredQuestion) {
        break;
      }
    }

    if (pendingMessages.isNotEmpty) {
      items.addAll(pendingMessages);
    }

    // Add thinking indicator only if we're showing thinking
    if (isShowingThinking.value) {
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

  Future<bool?> getReflectionWithQuestionAnswers(String reflectionType) async {
    //  reflectionQuestionAnswerResponseState.value = TheStates.loading;
    final result = await remoteSource.getReflectionWithQuestionAnswers(
      reflectionType: reflectionType,
    );
    var res = result.fold(
      (l) {
        reflectionQuestionAnswerResponseState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        reflectionQuestionAnswerResponseState.value = TheStates.success;
        final previouslyCompleted =
            reflectionQuestionAnswerResponse.value.data?.isCompleted ?? false;
        reflectionQuestionAnswerResponse.value = r;
        final currentlyCompleted = r.data?.isCompleted ?? false;
        if (!isJustCompleted.value) {
          if (currentlyCompleted && !previouslyCompleted) {
            // Journal just got completed
            isJustCompleted.value = true;
            wasAlreadyCompleted.value = false;
          } else if (currentlyCompleted && previouslyCompleted) {
            // Journal was already completed
            isJustCompleted.value = false;
            wasAlreadyCompleted.value = true;
          } else {
            // Journal is not completed
            isJustCompleted.value = false;
            wasAlreadyCompleted.value = false;
          }
        }
        // if (!isSendingMessage.value) {
        //   pendingMessages.clear();
        // }
        if (autoScrollEnabled.value && !isSendingMessage.value) {
          _debouncedScrollToBottom();
        }
        return true;
      },
    );
    return res;
  }

  Future<void> handleYesNoSelection(String option, String questionId) async {
    yesNoAnswers[questionId] = option;
    _showThinking(message: option);

    try {
      final reflection =
          reflectionQuestionAnswerResponse.value.data?.reflection;
      final questionIds = getNextQuestionIds(reflection);
      final mainQuestionId = questionIds['mainQuestionId'];
      final followupQuestionId = questionIds['followUpQuestionId'];

      await Future.delayed(const Duration(milliseconds: 800));

      await sendMessage(
        reflection?.id?.toString() ?? '',
        null,
        option,
        mainQuestionId,
        followupQuestionId,
      );

      // await Future.delayed(const Duration(seconds: 1));
      //
      _hideThinking();
      var period = DateTime.now().hour < 12 ? 'am' : 'pm';
      await getReflectionWithQuestionAnswers(period);
      pendingMessages.clear();
      autoScrollEnabled.value = true;
      _debouncedScrollToBottom(delay: 300);
    } catch (e) {
      print('Error in yes/no selection: $e');
      AppUtils.showErrorSnackbar(message: 'Failed to send response');
      // Clear pending messages on error
      pendingMessages.clear();
    }
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

  Future<void> handleTextMessageSent() async {
    final messageText = chatController.text.trim();
    if (messageText.isEmpty) return;

    _showThinking(message: messageText);

    chatController.clear();

    try {
      final reflection =
          reflectionQuestionAnswerResponse.value.data?.reflection;
      final questionIds = getNextQuestionIds(reflection);
      final mainQuestionId = questionIds['mainQuestionId'];
      final followupQuestionId = questionIds['followUpQuestionId'];

      // Send the message
      await sendMessage(
        reflection?.id?.toString() ?? '',
        null,
        messageText,
        mainQuestionId,
        followupQuestionId,
      );

      pendingMessages.clear();
      _hideThinking();

      var period = DateTime.now().hour < 12 ? 'am' : 'pm';
      await getReflectionWithQuestionAnswers(period);

      autoScrollEnabled.value = true;
      _debouncedScrollToBottom(delay: 300);
    } catch (e) {
      print('Error sending message: $e');
      AppUtils.showErrorSnackbar(message: 'Failed to send message');
      chatController.text = messageText;
      pendingMessages.clear();
    } finally {
      _hideThinking();
    }
  }

  Future<void> sendMessage(
    String reflectionId,
    String? mediaPath,
    String? text,
    String? mainQuestionId,
    String? followupQuestionId,
  ) async {
    sendMessageState.value = TheStates.loading;
    _cancelToken = CancelToken();
    autoScrollEnabled.value = true;

    try {
      final result = await remoteSource.sendMessage(
        reflectionId,
        mediaPath,
        _cancelToken,
        mainQuestionId,
        text ?? chatController.text.trim(),
        followupQuestionId,
      );
      // await getReflectionWithQuestionAnswers(period);
      result.fold(
        (l) {
          sendMessageState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
          _hideThinking();
        },
        (r) async {
          // chatConversationList
          //   ..clear()
          //   ..add(
          //     MessageItem(
          //       message: chatController.text.trim(),
          //       isMine: true,
          //       timestamp: getCurrentTime(),
          //       type: MessageType.answer,
          //     ),
          //   );

          // chatController.clear();
          // await Future.delayed(const Duration(milliseconds: 100));
          // scrollToBottom();

          sendMessageState.value = TheStates.success;
        },
      );
    } catch (e) {
      sendMessageState.value = TheStates.error;
      rethrow;
    }
  }

  void scrollToBottom() {
    if (scrollController.hasClients && autoScrollEnabled.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          final maxScroll = scrollController.position.maxScrollExtent;
          const extraPadding = 100.0; // Reduced padding

          scrollController.animateTo(
            maxScroll + extraPadding,
            duration: const Duration(milliseconds: 200), // Faster animation
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  String getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour < 12 ? 'AM' : 'PM'}";
  }

  Future<void> updateMessage(
    String? text,
  ) async {
    if (editingAnswerId.value == null) return;
    updateMessageState.value = TheStates.loading;
    _cancelToken = CancelToken();
    autoScrollEnabled.value = true;

    try {
      final result = await remoteSource.updateMessage(
        _cancelToken,
        editingAnswerId.value!,
        text ?? chatController.text.trim(),
      );

      result.fold(
        (l) {
          updateMessageState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) async {
          chatController.clear();
          var period = DateTime.now().hour < 12 ? 'am' : 'pm';

          await getReflectionWithQuestionAnswers(period);
          await Future.delayed(const Duration(milliseconds: 100));
          _debouncedScrollToBottom(delay: 200);

          updateMessageState.value = TheStates.success;
          resetEditMode();
        },
      );
    } catch (e) {
      updateMessageState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: e.toString());
    }
  }

  void navigateToJournalLibrary() {
    isJustCompleted.value = false;
    wasAlreadyCompleted.value = false;
    Get.to(const ReflectionLibraryScreen());
  }
}
