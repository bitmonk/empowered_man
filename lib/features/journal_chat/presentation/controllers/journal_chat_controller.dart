import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/data/model/chat_conversation_model.dart';
import 'package:empowered/features/journal_chat/data/model/journal_emotion_names_model.dart';
import 'package:empowered/features/journal_chat/data/model/message_item.dart';
import 'package:empowered/features/journal_chat/data/source/journal_chat_remote_source.dart';

class JournalChatController extends GetxController {
  JournalChatController({required this.remoteSource});

  final JournalChatRemoteSource remoteSource;

  late TextEditingController chatController;
  late ScrollController scrollController;
  RxString title = 'Rage'.obs;

  Rx<ChatConversationModel> journalWithQuestionsAndAnswers =
      const ChatConversationModel().obs;
  CancelToken? _cancelToken;

  Rx<TheStates> journalChatConversationState = TheStates.initial.obs;
  Rx<TheStates> sendMessageState = TheStates.initial.obs;
  Rx<EmotionName?> selectedEmotion = Rx<EmotionName?>(null);
  RxList<MessageItem> chatConversationList = RxList<MessageItem>([]);
  RxBool autoScrollEnabled = true.obs;
  RxBool showBeginJournallButton = false.obs;
  Rx<TheStates> updateMessageState = TheStates.initial.obs;

  // Thinking indicator states
  RxBool isShowingThinking = false.obs;
  RxBool isSendingMessage = false.obs;
  Rx<MessageItem?> pendingAnswer = Rx<MessageItem?>(null);
  final Map<String, String> yesNoAnswers = {};

  // Edit mode states
  RxBool isEditMode = false.obs;
  RxnString editingAnswerId = RxnString();

  // Add this to track pending messages
  RxList<MessageItem> pendingMessages = RxList<MessageItem>([]);

  @override
  void onInit() {
    super.onInit();
    chatController = TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);

    journalChatConversationState.listen((state) {
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
  }

  void resetEditMode() {
    isEditMode.value = false;
    editingAnswerId.value = null;
    chatController.clear();
  }

  // Centralized thinking indicator management
  void _showThinking({String? message}) {
    isShowingThinking.value = true;
    isSendingMessage.value = true;

    if (message != null) {
      // Add the user's message to pending messages
      pendingMessages.add(MessageItem(
        type: MessageType.answer,
        message: message,
        timestamp: DateTime.now().toString(),
        isMine: true,
        isLoading: false,
      ));

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

  // Build complete message list including thinking states
  List<MessageItem> buildCompleteMessageList(Journal? journal) {
    if (journal == null || journal.mainQuestions == null) {
      return [];
    }

    var items = <MessageItem>[];
    var foundUnansweredQuestion = false;

    // Process main questions and their follow-ups
    for (var i = 0; i < journal.mainQuestions!.length; i++) {
      final mainQuestion = journal.mainQuestions![i];
      var questionTimestamp = '';

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

      // Add the answer if it exists
      if (mainQuestion.answered == true && mainQuestion.answer != null) {
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

        // Process follow-up questions for answered main questions
        if (mainQuestion.followUpQuestions != null) {
          for (final followUp in mainQuestion.followUpQuestions!) {
            items.add(
              MessageItem(
                type: MessageType.question,
                message: followUp.question ?? '',
                timestamp: DateTime.now().toString(),
                isMine: false,
                isYesNoQuestion: followUp.questionType == 'yes_no',
              ),
            );

            if (followUp.answered == true && followUp.answer != null) {
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

  Future<bool?> getJournalWithQuestionsAndAnswers() async {
    showBeginJournallButton.value = false;

    final result = await remoteSource.getJournalWithQuestionsAndAnswers(
      selectedEmotion.value!.id.toString(),
    );

    var res = result.fold(
      (l) {
        journalChatConversationState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        journalChatConversationState.value = TheStates.success;
        journalWithQuestionsAndAnswers.value = r;
        showBeginJournallButton.value = journalWithQuestionsAndAnswers
                .value.data?.journal?.mainQuestions?[0].answered ==
            false;

        if (!isSendingMessage.value) {
          pendingMessages.clear();
        }

        scrollToBottom();
        return true;
      },
    );
    return res;
  }

  Future<void> handleYesNoSelection(String option, String questionId) async {
    print('Handling yes/no selection: $option for question: $questionId');

    // Show thinking immediately with user's selection
    yesNoAnswers[questionId] = option;
    _showThinking(message: option);

    try {
      final journal = journalWithQuestionsAndAnswers.value.data?.journal;
      final questionIds = getNextQuestionIds(journal);
      final mainQuestionId = questionIds['mainQuestionId'];
      final followupQuestionId = questionIds['followUpQuestionId'];

      await Future.delayed(const Duration(milliseconds: 800));

      await sendMessage(
        journal?.id?.toString() ?? '',
        null,
        option,
        mainQuestionId,
        followupQuestionId,
      );

      await Future.delayed(const Duration(seconds: 1));

      await getJournalWithQuestionsAndAnswers();

      pendingMessages.clear();

      autoScrollEnabled.value = true;
      scrollToBottom();
    } catch (e) {
      print('Error in yes/no selection: $e');
      AppUtils.showErrorSnackbar(message: 'Failed to send response');
      // Clear pending messages on error
      pendingMessages.clear();
    } finally {
      _hideThinking();
    }
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

  Future<void> handleTextMessageSent() async {
    final messageText = chatController.text.trim();
    if (messageText.isEmpty) return;

    print('Handling text message: $messageText');

    _showThinking(message: messageText);

    chatController.clear();

    try {
      final journal = journalWithQuestionsAndAnswers.value.data?.journal;
      final questionIds = getNextQuestionIds(journal);
      final mainQuestionId = questionIds['mainQuestionId'];
      final followupQuestionId = questionIds['followUpQuestionId'];

      // Send the message
      await sendMessage(
        journal?.id?.toString() ?? '',
        null,
        messageText,
        mainQuestionId,
        followupQuestionId,
      );

      await Future.delayed(const Duration(milliseconds: 1000));

      // Refresh the journal to get the updated conversation
      await getJournalWithQuestionsAndAnswers();

      pendingMessages.clear();

      autoScrollEnabled.value = true;
      scrollToBottom();
    } catch (e) {
      print('Error sending message: $e');
      AppUtils.showErrorSnackbar(message: 'Failed to send message');
      // If there's an error, restore the message to the input field and clear pending messages
      chatController.text = messageText;
      pendingMessages.clear();
    } finally {
      _hideThinking();
    }
  }

  Future<void> sendMessage(
    String journalId,
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
        journalId,
        mediaPath,
        _cancelToken,
        mainQuestionId,
        text ?? chatController.text.trim(),
        followupQuestionId,
      );

      result.fold(
        (l) {
          sendMessageState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
          throw Exception(
              l.message); // Throw to trigger error handling in calling method
        },
        (r) async {
          sendMessageState.value = TheStates.success;
        },
      );
    } catch (e) {
      sendMessageState.value = TheStates.error;
      rethrow; // Re-throw to be handled by calling method
    }
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        const extraPadding = 200.0;
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + extraPadding,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  String getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour < 12 ? 'AM' : 'PM'}";
  }

  Future<void> updateMessage(String? text) async {
    updateMessageState.value = TheStates.loading;
    _cancelToken = CancelToken();
    autoScrollEnabled.value = true;

    try {
      final result = await remoteSource.updateJournal(
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
          await getJournalWithQuestionsAndAnswers();
          await Future.delayed(const Duration(milliseconds: 100));
          scrollToBottom();
          updateMessageState.value = TheStates.success;
          resetEditMode();
        },
      );
    } catch (e) {
      updateMessageState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: e.toString());
    }
  }
}

// import 'package:dio/dio.dart';
// import 'package:empowered/core/extension/extensions.dart';
// import 'package:empowered/features/journal_chat/data/model/chat_conversation_model.dart';
// import 'package:empowered/features/journal_chat/data/model/journal_emotion_names_model.dart';
// import 'package:empowered/features/journal_chat/data/model/message_item.dart';
// import 'package:empowered/features/journal_chat/data/source/journal_chat_remote_source.dart';

// class JournalChatController extends GetxController {
//   JournalChatController({required this.remoteSource});
//   final JournalChatRemoteSource remoteSource;
//   // RxList<String> filterList = ['All', 'Threads', 'Squads'].obs;
//   // RxInt selectedFilterindex = 0.obs;
//   late TextEditingController chatController;
//   late ScrollController scrollController;
//   RxString title = 'Rage'.obs;
//   Rx<ChatConversationModel> journalWithQuestionsAndAnswers =
//       const ChatConversationModel().obs;
//   CancelToken? _cancelToken;
//   Rx<TheStates> journalChatConversationState = TheStates.initial.obs;
//   Rx<TheStates> sendMessageState = TheStates.initial.obs;
//   Rx<EmotionName?> selectedEmotion = Rx<EmotionName?>(null);
//   RxList<MessageItem> chatConversationList = RxList<MessageItem>([]);
//   RxBool autoScrollEnabled = true.obs;
//   RxBool showBeginJournallButton = false.obs;
//   Rx<TheStates> updateMessageState = TheStates.initial.obs;

//   // RxList<String> _selectedMediaPaths =  RxList<String>([]);
//   RxBool isEditMode = false.obs;
//   RxnString editingAnswerId = RxnString();

//   @override
//   void onInit() {
//     super.onInit();
//     chatController = TextEditingController();
//     scrollController = ScrollController();
//     scrollController.addListener(_scrollListener);
//     journalChatConversationState.listen((state) {
//       if (state == TheStates.success && autoScrollEnabled.value) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           scrollToBottom();
//         });
//       }
//     });
//   }

//   @override
//   void onClose() {
//     chatController.dispose();
//     scrollController.dispose();
//     super.onClose();
//   }

//   void _scrollListener() {
//     // If we're close to the bottom (within 100 pixels), enable auto-scrolling
//     if (scrollController.hasClients) {
//       final position = scrollController.position;
//       final maxScroll = position.maxScrollExtent;
//       final currentScroll = position.pixels;

//       // Enable auto-scroll if user is at or near bottom
//       if (maxScroll - currentScroll <= 100) {
//         autoScrollEnabled.value = true;
//       } else {
//         // Disable auto-scroll if user manually scrolled up
//         autoScrollEnabled.value = false;
//       }
//     }
//   }

//   void setEditMode(bool isEdit, String answerId) {
//     isEditMode.value = isEdit;
//     editingAnswerId.value = answerId;

//   }

//   void resetEditMode() {
//     isEditMode.value = false;
//     editingAnswerId.value = null;
//     chatController.clear();
//   }

//   Future<bool?> getJournalWithQuestionsAndAnswers() async {
//     // journalChatConversationState.value = TheStates.loading;
//     showBeginJournallButton.value = false;
//     final result = await remoteSource.getJournalWithQuestionsAndAnswers(
//       selectedEmotion.value!.id.toString(),
//     );
//     var res = result.fold(
//       (l) {
//         journalChatConversationState.value = TheStates.error;
//         AppUtils.showErrorSnackbar(message: l.message);
//         return false;
//       },
//       (r) {
//         journalChatConversationState.value = TheStates.success;
//         journalWithQuestionsAndAnswers.value = r;
//         showBeginJournallButton.value = journalWithQuestionsAndAnswers
//                 .value.data?.journal?.mainQuestions?[0].answered ==
//             false;
//         scrollToBottom();
//         return true;
//       },
//     );
//     return res;
//   }

//   Future<void> sendMessage(
//     String journalId,
//     String? mediaPath,
//     String? text,
//     String? mainQuestionId,
//     String? followupQuestionId,
//   ) async {
//     sendMessageState.value = TheStates.loading;
//     _cancelToken = CancelToken();
//     autoScrollEnabled.value = true;

//     try {
//       final result = await remoteSource.sendMessage(
//         journalId,
//         mediaPath,
//         _cancelToken,
//         mainQuestionId,
//         text ?? chatController.text.trim(),
//         followupQuestionId,
//       );
//       await getJournalWithQuestionsAndAnswers();

//       result.fold(
//         (l) {
//           sendMessageState.value = TheStates.error;
//           AppUtils.showErrorSnackbar(message: l.message);
//         },
//         (r) async {
//           chatConversationList
//             ..clear()
//             ..add(
//               MessageItem(
//                 message: chatController.text.trim(),
//                 isMine: true,
//                 timestamp: getCurrentTime(),
//                 type: MessageType.answer,
//               ),
//             );

//           chatController.clear();
//           await getJournalWithQuestionsAndAnswers();
//           await Future.delayed(const Duration(milliseconds: 100));
//           scrollToBottom();

//           sendMessageState.value = TheStates.success;
//         },
//       );
//     } catch (e) {
//       journalChatConversationState.value = TheStates.error;
//       AppUtils.showErrorSnackbar(message: e.toString());
//     }
//   }

//   void scrollToBottom() {
//     if (scrollController.hasClients) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         const extraPadding = 200.0;
//         scrollController.animateTo(
//           scrollController.position.maxScrollExtent + extraPadding,
//           duration: const Duration(milliseconds: 1),
//           curve: Curves.easeOut,
//         );
//       });
//     }
//   }

//   String getCurrentTime() {
//     final now = DateTime.now();
//     return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour < 12 ? 'AM' : 'PM'}";
//   }

//   Future<void> updateMessage(
//     String? text,
//   ) async {
//     updateMessageState.value = TheStates.loading;
//     _cancelToken = CancelToken();
//     autoScrollEnabled.value = true;

//     try {
//       final result = await remoteSource.updateJournal(
//         _cancelToken,
//         editingAnswerId.value!,
//         text ?? chatController.text.trim(),
//       );

//       result.fold(
//         (l) {
//           updateMessageState.value = TheStates.error;
//           AppUtils.showErrorSnackbar(message: l.message);
//         },
//         (r) async {
//           chatConversationList
//             ..clear()
//             ..add(
//               MessageItem(
//                 message: chatController.text.trim(),
//                 isMine: true,
//                 timestamp: getCurrentTime(),
//                 type: MessageType.answer,
//               ),
//             );
//           chatController.clear();
//           await getJournalWithQuestionsAndAnswers();
//           await Future.delayed(const Duration(milliseconds: 100));
//           scrollToBottom();

//           updateMessageState.value = TheStates.success;
//         },
//       );
//     } catch (e) {
//       updateMessageState.value = TheStates.error;
//       AppUtils.showErrorSnackbar(message: e.toString());
//     }
//   }
// }
