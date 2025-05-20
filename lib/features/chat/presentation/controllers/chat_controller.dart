import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/data/model/agora_chat_config.dart';
import 'package:empowered/features/chat/data/model/chat_conversation_wrapper.dart';
import 'package:empowered/features/chat/data/source/chat_remote_source.dart';

class ChatController extends GetxController {
  ChatController({required this.remoteSource});

  final ChatRemoteSource remoteSource;

  RxList<String> filterList = ['All', 'Threads', 'Squads'].obs;
  RxInt selectedFilterindex = 0.obs;

  late TextEditingController chatController;
  late ScrollController chatScreenScrollController;

  RxString currentUserId = 'unotech'.obs;

  final String chatListenerId = 'chat_screen';

  RxList<ChatConversationWrapper> allConversations =
      <ChatConversationWrapper>[].obs;
  String? _nextConversationCursor;

  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final Rx<ChatConversation?> selectedConversation =
      Rx<ChatConversation?>(null);
  final int messageQuantity = 10;

  @override
  void onInit() {
    super.onInit();
    chatController = TextEditingController();
    chatScreenScrollController = ScrollController();

    initSDK();
    _addListeners();
    fetchConversations(isInitialLoad: true);
    chatScreenScrollController.addListener(() {
      // When near the top (within 100 pixels)
      if (chatScreenScrollController.position.pixels <=
          chatScreenScrollController.position.minScrollExtent + 100) {
        loadPreviousMessages();
      }
    });
  }

  Rx<TheStates> initializingSdks = TheStates.initial.obs;
  Future<void> initSDK() async {
    initializingSdks.value = TheStates.loading;
    final options = ChatOptions(appKey: AgoraChatConfig.appKey);
    await ChatClient.getInstance.init(options);
    await ChatClient.getInstance.startCallback();

    try {
      await ChatClient.getInstance
          .loginWithToken(currentUserId.value, AgoraChatConfig.unoTechToken);
      initializingSdks.value = TheStates.success;
      await fetchConversations();
    } on ChatError {
      initializingSdks.value = TheStates.error;
    }
  }

  Rx<TheStates> fetchConversationState = TheStates.initial.obs;
  RxnString fetchCoversationError = RxnString();

  Future<void> fetchConversations({bool isInitialLoad = false}) async {
    try {
      if (isInitialLoad) {
        fetchConversationState.value = TheStates.loading;
        _nextConversationCursor = null; // Reset cursor on fresh load
        allConversations.clear();
      } else {
        fetchConversationState.value = TheStates.loadingMore;
        if (_nextConversationCursor == null) {
          return;
        }
      }

      final options = ConversationFetchOptions(
        pageSize: 30,
        cursor: !isInitialLoad ? _nextConversationCursor : null,
      );

      final result = await ChatClient.getInstance.chatManager
          .fetchConversationsByOptions(options: options);

      final userIds = result.data
          .where((convo) => convo.type == ChatConversationType.GroupChat)
          .map((convo) => convo.id)
          .toList();

      final userInfoMap = await ChatClient.getInstance.userInfoManager
          .fetchUserInfoById(userIds);

      final wrappedConversations = <ChatConversationWrapper>[];

      for (final convo in result.data) {
        final userInfo = userInfoMap[convo.id];

        // Await latest message
        ChatMessage? lastMsg;
        try {
          lastMsg = await convo.latestMessage();
        } catch (_) {
          lastMsg = null;
        }

        String? latestMessage;
        DateTime? lastTime;

        if (lastMsg != null) {
          final body = lastMsg.body;

          // Text preview
          if (body is ChatTextMessageBody) {
            latestMessage = body.content;
          } else if (body is ChatImageMessageBody) {
            latestMessage = '[Image]';
          } else if (body is ChatFileMessageBody) {
            latestMessage = '[File]';
          } else if (body is ChatVoiceMessageBody) {
            latestMessage = '[Voice]';
          } else {
            latestMessage = '[${body.runtimeType}]';
          }

          lastTime = DateTime.fromMillisecondsSinceEpoch(lastMsg.serverTime);
        }
        final unreadCount = await convo.unreadCount();
        wrappedConversations.add(
          ChatConversationWrapper(
            conversation: convo,
            userName: userInfo?.nickName ?? convo.id,
            avatarUrl: userInfo?.avatarUrl,
            isOnline: true,
            latestMessage: latestMessage,
            lastChattedTime: lastTime,
            unreadCount: unreadCount,
          ),
        );
      }

      if (!isInitialLoad) {
        allConversations.addAll(wrappedConversations);
      } else {
        allConversations.value = wrappedConversations;
      }

      _nextConversationCursor = result.cursor;
      fetchConversationState.value = TheStates.success;
    } on ChatError catch (e) {
      fetchCoversationError.value =
          'Failed to fetch conversations: ${e.code} - ${e.description}';
      fetchConversationState.value = TheStates.error;
    }
  }

  Future<void> markMessagesAsRead() async {
    try {
      await ChatClient.getInstance.chatManager
          .sendConversationReadAck(selectedConversation.value!.id);

      // Optionally: Update your local conversation unread count to 0
      final index = allConversations.indexWhere(
        (element) => element.conversation.id == selectedConversation.value!.id,
      );

      if (index != -1) {
        final updated = allConversations[index];
        allConversations[index] = ChatConversationWrapper(
          conversation: updated.conversation,
          userName: updated.userName,
          avatarUrl: updated.avatarUrl,
          isOnline: updated.isOnline,
          latestMessage: updated.latestMessage,
          lastChattedTime: updated.lastChattedTime,
        );
        allConversations.refresh(); // Trigger UI update if you're using GetX
      }
    } catch (e) {
      print('Failed to mark messages as read: $e');
    }
  }

  ChatPresence? findPresence(String id, list) {
    for (final p in list) {
      if (p.publisher == id) return p;
    }
    return null;
  }

  // Check if more pages are available
  bool get canLoadMore =>
      _nextConversationCursor != null &&
      fetchConversationState.value != TheStates.loadingMore;
  RxMap<String, List<ChatMessageReaction>> reactionMap =
      <String, List<ChatMessageReaction>>{}.obs;
  Future<void> fetchReactionsForMessages(List<ChatMessage> msgs) async {
    try {
      final messageIds = msgs.map((e) => e.msgId).toList();

      final reactionsResult =
          await ChatClient.getInstance.chatManager.fetchReactionList(
        messageIds: messageIds,
        chatType: ChatType.Chat,
      );

      for (final entry in reactionsResult.entries) {
        final msgId = entry.key;
        final reactions = entry.value;
        if (reactions.isNotEmpty) {
          reactionMap[msgId] = reactions;
        }
      }

      print('✅ Reaction map updated');
    } catch (e) {
      print('❌ Failed to fetch reactions: $e');
    }
  }

  Rx<TheStates> loadingMessageState = TheStates.initial.obs;
  RxnString loadingMessageError = RxnString();
  Future<void> loadMessages() async {
    try {
      reactionMap.clear();
      loadingMessageState.value = TheStates.loading;

      final result =
          await ChatClient.getInstance.chatManager.fetchHistoryMessages(
        conversationId: selectedConversation.value!.id,
        pageSize: messageQuantity,
      );

      final loadedMessages = result.data;

      // Optional: Fetch reactions for messages
      await fetchReactionsForMessages(loadedMessages);

      messages.value = loadedMessages;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollToBottom();
      });
      loadingMessageState.value = TheStates.success;
    } on ChatError catch (e) {
      loadingMessageState.value = TheStates.error;
      loadingMessageError.value = '${e.code} - ${e.description}';
      print('Error fetching messages: ${e.code} - ${e.description}');
    }
  }

  Rx<TheStates> loadingPrevoiusMessageState = TheStates.initial.obs;
  Future<void> loadPreviousMessages() async {
    if (loadingPrevoiusMessageState.value == TheStates.loading) return;
    if (messages.isEmpty) return;

    loadingPrevoiusMessageState.value = TheStates.loading;
    try {
      final oldestMessage = messages.first;

      final result =
          await ChatClient.getInstance.chatManager.fetchHistoryMessages(
        conversationId: selectedConversation.value!.id,
        pageSize: messageQuantity,
        startMsgId: oldestMessage.msgId,
      );
      final newMessages = result.data;
      if (newMessages.isNotEmpty) {
        final currentOffset = chatScreenScrollController.offset;

        // Prepend older messages to the list
        messages.insertAll(0, result.data);
        await fetchReactionsForMessages(newMessages);
        await Future.delayed(
          const Duration(milliseconds: 100),
        ); // Wait for UI update

        // Calculate estimated height of newly inserted messages
        final newContentHeight = _calculateNewContentHeight(newMessages.length);

        // Maintain scroll offset to avoid jump
        chatScreenScrollController.jumpTo(currentOffset + newContentHeight);
      }
      loadingPrevoiusMessageState.value = TheStates.success;
    } catch (e) {
      print('Error loading previous messages: $e');
      loadingPrevoiusMessageState.value = TheStates.error;
    }
  }

  // Approximate height of one message item, adjust according to your widget
  double _calculateNewContentHeight(int messageCount) {
    const messageItemHeight = 60.0;
    return messageCount * messageItemHeight;
  }

  Rx<TheStates> sendingMessageState = TheStates.initial.obs;
  Future<void> sendMessage({
    String? text,
    String? filePath,
    String? audioPath,
    String? fileDisplayName,
    bool isGroup = false,
  }) async {
    if ((text == null || text.trim().isEmpty) &&
        filePath == null &&
        audioPath == null) {
      return;
    }
    final chatType = isGroup ? ChatType.GroupChat : ChatType.Chat;
    final targetId = selectedConversation.value!.id;
    ChatMessage? message;

    if (filePath != null) {
      final extension = filePath.split('.').last.toLowerCase();
      final isImage =
          ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].contains(extension);
      final isVideo = ['mp4', 'mov', 'avi', 'mkv', 'webm'].contains(extension);
      final isDocument = !isImage && !isVideo;

      if (isImage) {
        // 🖼️ Image
        final imgBody = ChatImageMessageBody(
          localPath: filePath,
          displayName: fileDisplayName ?? filePath.split('/').last,
        );
        message = ChatMessage.createSendMessage(
          chatType: chatType,
          to: targetId,
          body: imgBody,
        );
      } else if (isVideo) {
        // 📹 Video
        final vidBody = ChatVideoMessageBody(
          localPath: filePath,
          displayName: fileDisplayName ?? filePath.split('/').last,
        );
        message = ChatMessage.createSendMessage(
          chatType: chatType,
          to: targetId,
          body: vidBody,
        );
      } else if (isDocument) {
        // 📎 File
        final fileBody = ChatFileMessageBody(
          localPath: filePath,
          displayName: fileDisplayName ?? filePath.split('/').last,
        );
        message = ChatMessage.createSendMessage(
          chatType: chatType,
          to: targetId,
          body: fileBody,
        );
      }

      if (message != null && text != null && text.trim().isNotEmpty) {
        message.attributes = {'caption': text.trim()};
      }
    } else if (audioPath != null) {
      // // 🎤 Audio
      // final duration = await _getAudioDuration(audioPath);
      // final voiceBody = ChatVoiceMessageBody(
      //   localPath: audioPath,
      //   duration: duration,
      // );
      // message = ChatMessage.createSendMessage(
      //   chatType: chatType,
      //   to: targetId,
      //   body: voiceBody,
      // );
    } else if (text != null) {
      // 📝 Text
      message = ChatMessage.createTxtSendMessage(
        targetId: targetId,
        content: text.trim(),
        chatType: chatType,
      );
    }

    if (message != null) {
      try {
        print(message.toJson());
        await ChatClient.getInstance.chatManager.sendMessage(message);
        messages.add(message);
        chatController.clear();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollToBottom();
        });
      } catch (e) {
        print('Send message failed: $e');
      }
    }
  }

  Future<void> deleteMessage(ChatMessage message) async {
    // try {
    //   // Deletes from local database (and conversation view)
    //   await ChatClient.getInstance.chatManage.(message.msgId);

    //   // Optionally, remove from your local list
    //   messages.removeWhere((msg) => msg.msgId == message.msgId);

    //   // Trigger UI update if needed
    //   update(); // or call setState(() {}) if you're not using GetX
    // } catch (e) {
    //   print('Error deleting message: $e');
    // }
  }

  Future<void> addReaction(String msgId, String reaction) async {
    try {
      await ChatClient.getInstance.chatManager.addReaction(
        messageId: msgId,
        reaction: reaction,
      );
      print('Reaction added');
    } catch (e) {
      print('Failed to add reaction: $e');
    }
  }

  Future<void> removeReaction(String msgId, String reaction) async {
    try {
      await ChatClient.getInstance.chatManager.removeReaction(
        messageId: msgId,
        reaction: reaction,
      );
      reactionMap.remove(msgId);
      print('Reaction removed');
    } catch (e) {
      print('Failed to remove reaction: $e');
    }
  }

  void _addListeners() {
    ChatClient.getInstance.chatManager.addMessageEvent(
      chatListenerId,
      ChatMessageEvent(
        onSuccess: (msgId, msg) {
          print('Message sent');
          final index = messages.indexWhere((m) => m.msgId == msgId);
          if (index != -1) {
            messages[index] = msg;
            messages.refresh(); // if messages is an RxList
          }
          WidgetsBinding.instance.addPostFrameCallback((_) {
            scrollToBottom();
          });
        },
        onProgress: (msgId, progress) => print(r'Sending progress: $progress'),
        onError: (msgId, msg, error) =>
            print(r'Message failed: ${error.description}'),
      ),
    );

    ChatClient.getInstance.chatManager.addEventHandler(
      chatListenerId,
      ChatEventHandler(
        onMessagesReceived: (msgs) {
          messages.addAll(msgs);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            scrollToBottom();
          });
        },
      ),
    );
  }

  Future<void> selectConversation(ChatConversation convo) async {
    selectedConversation.value = convo;
    markMessagesAsRead();
    await loadMessages();
  }

  Future<void> searchUserAndChat(String targetUserId) async {
    final convo = await ChatClient.getInstance.chatManager.getConversation(
      targetUserId,
    );
    selectConversation(convo!);
  }

  Future<void> createGroupAndChat(
    String groupName,
    List<String> members,
  ) async {
    print('a');
    final options = ChatGroupOptions();
    final group = await ChatClient.getInstance.groupManager.createGroup(
      groupName: groupName,
      desc: r'Group chat: $groupName',
      inviteMembers: ['upasanaa_1234', 'lakshydeep_14'],
      options: options,
    );
    final convo = await ChatClient.getInstance.chatManager.getConversation(
      group.groupId,
      type: ChatConversationType.GroupChat,
    );
    selectConversation(convo!);
    print('a');
  }

  void scrollToBottom() {
    if (chatScreenScrollController.hasClients) {
      chatScreenScrollController.animateTo(
        chatScreenScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void onClose() {
    chatController.dispose();
    chatScreenScrollController.dispose();
    ChatClient.getInstance.chatManager.removeMessageEvent(chatListenerId);
    ChatClient.getInstance.chatManager.removeEventHandler(chatListenerId);
  }

  String getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour < 12 ? 'AM' : 'PM'}";
  }
}
