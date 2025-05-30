import 'dart:io';

import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/data/model/agora_chat_config.dart';
import 'package:empowered/features/chat/data/model/agora_user_model.dart';
import 'package:empowered/features/chat/data/model/chat_conversation_wrapper.dart';
import 'package:empowered/features/chat/data/source/chat_remote_source.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatController extends GetxController {
  ChatController({required this.remoteSource});

  final ChatRemoteSource remoteSource;

  RxList<String> filterList = ['All', 'Threads', 'Squads'].obs;
  RxInt selectedFilterindex = 0.obs;

  late TextEditingController chatController;
  late ScrollController chatScreenScrollController;

  RxnString currentUserId = RxnString();
  RxnString currentUserToken = RxnString();
// unotech
  final String chatListenerId = 'chat_screen';

  RxList<ChatConversationWrapper> allConversations =
      <ChatConversationWrapper>[].obs;
  String? _nextConversationCursor;

  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final Rxn<ChatConversationWrapper> selectedConversation =
      Rxn<ChatConversationWrapper>();
  final Rxn<ChatConversationType> selectedConversationType =
      Rxn<ChatConversationType>();
  final int messageQuantity = 10;
  final profileController = Get.find<ProfileController>();
  @override
  void onInit() {
    super.onInit();
    chatController = TextEditingController();
    chatScreenScrollController = ScrollController();
    // Get.find<ProfileController>().userProfile.getUserProfile();
    currentUserId.value = profileController.userProfile.value.slug;
    currentUserToken.value = profileController.userProfile.value.agoraUserToken;
    initSDK();
  }

  Rx<TheStates> initializingSdks = TheStates.initial.obs;
  RxnString loginError = RxnString();
  Future<void> initSDK() async {
    print('a');
    if (currentUserId.value == null || currentUserToken.value == null) {
      initializingSdks.value = TheStates.error;
      loginError.value = '${currentUserId.value} Error while logging in';
      return;
    }
    initializingSdks.value = TheStates.loading;
    final options = ChatOptions(appKey: AgoraChatConfig.appKey);
    await ChatClient.getInstance.init(options);
    await ChatClient.getInstance.startCallback();

    try {
      final isLoggedIn = await ChatClient.getInstance.isLoginBefore();
      if (!isLoggedIn) {
        await ChatClient.getInstance.loginWithPassword(
          currentUserId.value!,
          currentUserToken.value!,
        );
      }

      _addListeners();
      fetchConversations(isInitialLoad: true);
      chatScreenScrollController.addListener(() {
        // When near the top (within 100 pixels)
        if (chatScreenScrollController.position.pixels <=
            chatScreenScrollController.position.minScrollExtent + 100) {
          loadPreviousMessages();
        }
      });

      initializingSdks.value = TheStates.success;
      loginError.value = null;
    } on ChatError catch (e) {
      initializingSdks.value = TheStates.error;

      // Ignore "already logged in" error
      if (e.code == 200) {
        loginError.value = null;
        initializingSdks.value = TheStates.success;
      } else {
        loginError.value = '${e.code} - ${e.description}';
      }
    } catch (e) {
      initializingSdks.value = TheStates.error;
      loginError.value = e.toString();
    }
  }

  Rx<TheStates> fetchConversationState = TheStates.initial.obs;
  RxnString fetchCoversationError = RxnString();

  Future<void> fetchConversations({
    bool isInitialLoad = false,
    String? query,
  }) async {
    try {
      if (isInitialLoad) {
        allConversations.clear();
        fetchConversationState.value = TheStates.loading;
        _nextConversationCursor = null; // Reset cursor on fresh load
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
          .where((convo) => convo.type == ChatConversationType.Chat)
          .map((convo) => convo.id)
          .toList();

      final userInfoMap = await ChatClient.getInstance.userInfoManager
          .fetchUserInfoById(userIds);

      final wrappedConversations = <ChatConversationWrapper>[];

      for (final convo in result.data) {
        // Await latest message
        ChatUserInfo? userInfo;
        ChatMessage? lastMsg;
        ChatGroup? group;
        try {
          if (convo.type == ChatConversationType.GroupChat) {
            group = await ChatClient.getInstance.groupManager
                .fetchGroupInfoFromServer(
              convo.id,
            );
          } else {
            userInfo = userInfoMap[convo.id];
          }
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
        var unreadFromOthers = 0;
        final unreadCount = await convo.unreadCount();
        if (unreadCount > 0) {
          try {
            final unreadMessages =
                await ChatClient.getInstance.chatManager.fetchHistoryMessages(
              conversationId: convo.id,
              pageSize: 2,
            );

            unreadFromOthers = unreadMessages.data
                .where((msg) => msg.from != currentUserId.value)
                .length;
          } catch (e) {
            print('Failed to fetch unread messages for convo ${convo.id}: $e');
          }
        }
        wrappedConversations.add(
          ChatConversationWrapper(
            id: convo.id,
            conversation: convo,
            userName:
                group?.name ?? userInfo?.nickName ?? userInfo?.userId ?? '',
            avatarUrl: userInfo?.avatarUrl,
            isOnline: true,
            latestMessage: latestMessage,
            lastChattedTime: lastTime,
            unreadCount: unreadFromOthers,
          ),
        );
      }
      final filteredConversations = query != null && query.isNotEmpty
          ? wrappedConversations
              .where(
                (c) => c.userName
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()),
              )
              .toList()
          : wrappedConversations;
      if (!isInitialLoad) {
        allConversations.addAll(filteredConversations);
      } else {
        allConversations.value = filteredConversations;
      }

      _nextConversationCursor = result.cursor;
      fetchConversationState.value = TheStates.success;
    } on ChatError catch (e) {
      print(e);
      fetchCoversationError.value =
          'Failed to fetch conversations: ${e.code} - ${e.description}';
      fetchConversationState.value = TheStates.error;
    }
  }

  RxList<ChatConversationWrapper> groupList = <ChatConversationWrapper>[].obs;
  // String? _nextConversationCursor;

  Rx<TheStates> fetchGroupListState = TheStates.initial.obs;
  RxnString fetchGroupListError = RxnString();
  Future<void> fetchGroupChats({bool isInitialLoad = false}) async {
    try {
      if (isInitialLoad) {
        groupList.clear();
        fetchGroupListState.value = TheStates.loading;
      } else {
        fetchGroupListState.value = TheStates.loadingMore;
      }

      final joinedGroups =
          await ChatClient.getInstance.groupManager.getJoinedGroups();

      final wrappedGroups = <ChatConversationWrapper>[];

      for (final group in joinedGroups) {
        print(group);
        final conversation =
            await ChatClient.getInstance.chatManager.getConversation(
          group.groupId,
          type: ChatConversationType.GroupChat,
        );

        // Fetch latest message
        ChatMessage? lastMsg;
        try {
          lastMsg = await conversation!.latestMessage();
        } catch (_) {
          lastMsg = null;
        }

        String? latestMessage;
        DateTime? lastTime;

        if (lastMsg != null) {
          final body = lastMsg.body;

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

        var unreadCount = await conversation!.unreadCount();

        wrappedGroups.add(
          ChatConversationWrapper(
            id: group.groupId,
            conversation: conversation,
            userName: group.name ?? 'N/A',
            description: group.description,
            avatarUrl: group.description,
            latestMessage: latestMessage,
            lastChattedTime: lastTime,
            unreadCount: unreadCount,
          ),
        );
      }
      wrappedGroups.sort((a, b) {
        final aTime = a.lastChattedTime?.millisecondsSinceEpoch ?? 0;
        final bTime = b.lastChattedTime?.millisecondsSinceEpoch ?? 0;
        return bTime.compareTo(aTime); // Descending order
      });

      groupList.value = wrappedGroups;
      fetchGroupListState.value = TheStates.success;
    } on ChatError catch (e) {
      fetchGroupListError.value =
          'Failed to fetch group chats: ${e.code} - ${e.description}';
      fetchGroupListState.value = TheStates.error;
    }
  }

  Future<void> updateGroupInfo({
    String? newName,
    String? newDescription,
  }) async {
    var groupId = selectedConversation.value!.id;
    try {
      if (newName != null && newName.isNotEmpty) {
        await ChatClient.getInstance.groupManager.changeGroupName(
          groupId,
          newName,
        );
      }

      if (newDescription != null && newDescription.isNotEmpty) {
        await ChatClient.getInstance.groupManager.changeGroupDescription(
          groupId,
          newDescription,
        );
      }

      print('✅ Group info updated successfully');
    } on ChatError catch (e) {
      print('❌ Failed to update group info: ${e.code} - ${e.description}');
    }
  }

  Future<void> addMembersToGroup({List<String>? members}) async {
    var groupId = selectedConversation.value!.id;
    try {
      await ChatClient.getInstance.groupManager.addMembers(
        groupId,
        members ?? [],
      );

      print('✅ Members added successfully');
    } on ChatError catch (e) {
      print('❌ Failed to add member: ${e.code} - ${e.description}');
    }
  }

  Future<void> removeMemberFromGroup({List<String>? members}) async {
    var groupId = selectedConversation.value!.id;
    try {
      await ChatClient.getInstance.groupManager.removeMembers(
        groupId,
        members ?? [],
      );

      print('✅ Members removed successfully');
    } on ChatError catch (e) {
      print('❌ Failed to remove member: ${e.code} - ${e.description}');
    }
  }

  RxList<String> groupMembers = <String>[].obs;
  String? _nextMemberCursor;
  bool _hasMoreGroupMembers = true;
  final int _pageSize = 50;
  Rx<TheStates> getMemberListState = TheStates.initial.obs;
  RxnString getMemberListError = RxnString();
  Future<void> getMemberList({bool isInitialLoad = false}) async {
    try {
      if (isInitialLoad) {
        getMemberListState.value = TheStates.loading;
        _nextMemberCursor = null;
        _hasMoreGroupMembers = true;
        groupMembers.clear();
      }

      if (!_hasMoreGroupMembers) {
        getMemberListState.value = TheStates.loadingMore;
        print('🚫 No more members to fetch.');
        return;
      }

      final result =
          await ChatClient.getInstance.groupManager.fetchMemberListFromServer(
        selectedConversation.value!.id,
        cursor: _nextMemberCursor,
        pageSize: _pageSize,
      );
      groupMembers.addAll(result.data);

      _nextMemberCursor = result.cursor;
      _hasMoreGroupMembers = result.cursor != null && result.cursor!.isNotEmpty;
      getMemberListState.value = TheStates.success;
      getMemberListError.value = null;
    } on ChatError catch (e) {
      getMemberListState.value = TheStates.error;
      getMemberListError.value = 'Error: ${e.code} - ${e.description}';
    }
  }

  Rx<TheStates> fetchGroupInfoState = TheStates.initial.obs;
  RxnString fetchGroupInfoError = RxnString();
  Rxn<ChatGroup> groupDetails = Rxn<ChatGroup>();
  Future<void> getGroupInfo() async {
    try {
      fetchGroupInfoState.value = TheStates.loading;

      final result =
          await ChatClient.getInstance.groupManager.fetchGroupInfoFromServer(
        selectedConversation.value!.id,
      );
      groupDetails.value = result;

      fetchGroupInfoState.value = TheStates.success;
      fetchGroupInfoError.value = null;
    } on ChatError catch (e) {
      fetchGroupInfoState.value = TheStates.error;
      fetchGroupInfoError.value = 'Error: ${e.code} - ${e.description}';
    }
  }

  void resetGroupMemberState() {
    groupMembers.clear();
    _nextMemberCursor = null;
    _hasMoreGroupMembers = true;
    getMemberListState.value = TheStates.initial;
    getMemberListError.value = null;
  }

  bool get hasMoreGroupMembers => _hasMoreGroupMembers;

  Future<String> _download() async {
    var status = await Permission.storage.isGranted;
    if (!status) await Permission.storage.request();

    var filePath = '';
    if (Platform.isAndroid) {
      var fp = await getExternalStorageDirectory();
      filePath = fp!.path;
    } else if (Platform.isIOS) {
      var fp = await getApplicationSupportDirectory();
      filePath = fp.path;
    }

    // final file = File('$filePath/${DateTime.now().toIso8601String()}.mp4');
    // await file.writeAsBytes(await pdf.save());
    return '$filePath/${DateTime.now().toIso8601String()}.mp4';
  }

  RxMap<String, TheStates> downloadVideoStates = <String, TheStates>{}.obs;
  Future<void> saveDownloadedVideo(String videoId, String localPath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('video_$videoId', localPath);
  }

  Future<bool> downloadVideo({
    required String id,
    required String url,
  }) async {
    print(url);
    downloadVideoStates[url] = TheStates.loading;
    var customPath = await _download();

    final result = await remoteSource.downloadVideo(url: url, path: customPath);

    var res = result.fold(
      (l) {
        downloadVideoStates[url] = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        downloadVideoStates[url] = TheStates.success;
        saveDownloadedVideo(id, customPath);
        AppUtils.showSnackbar(
          message: 'Video successfully downloaded.',
        );
        return true;
      },
    );
    print(res);
    return res;
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
          id: updated.id,
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
    if (msgs.isNotEmpty) return;
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
        type: selectedConversationType.value!,
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
        type: selectedConversationType.value!,
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
  RxnString sendMessageError = RxnString();
  Future<void> sendMessage({
    String? targetID,
    String? text,
    String? filePath,
    String? audioPath,
    int? audioDuration,
    String? fileDisplayName,
  }) async {
    if ((text == null || text.trim().isEmpty) &&
        filePath == null &&
        audioPath == null) {
      return;
    }
    final chatType =
        selectedConversationType.value == ChatConversationType.GroupChat
            ? ChatType.GroupChat
            : ChatType.Chat;
    var targetId = targetID ?? selectedConversation.value!.id;

    ChatMessage? message;

    sendingMessageState.value = TheStates.loading;
    sendMessageError.value = null;
    try {
      if (filePath != null) {
        final extension = filePath.split('.').last.toLowerCase();
        final isImage =
            ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].contains(extension);
        final isVideo =
            ['mp4', 'mov', 'avi', 'mkv', 'webm'].contains(extension);
        final isDocument = !isImage && !isVideo;

        if (isImage) {
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
        final voiceBody = ChatVoiceMessageBody(
          localPath: audioPath,
          duration: audioDuration!,
        );
        message = ChatMessage.createSendMessage(
          chatType: chatType,
          to: targetId,
          body: voiceBody,
        );
      } else if (text != null) {
        message = ChatMessage.createTxtSendMessage(
          targetId: targetId,
          content: text.trim(),
          chatType: chatType,
        );
      }

      if (message != null) {
        await ChatClient.getInstance.chatManager.sendMessage(message);
        messages.add(message);
        chatController.clear();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollToBottom();
        });
      }
      sendingMessageState.value = TheStates.success;
    } catch (e) {
      sendMessageError.value = e.toString();
      sendingMessageState.value = TheStates.error;
    }
  }

  Rxn<ChatMessage> messageToEdit = Rxn<ChatMessage>();
  Future<void> updateMessaage({required String content}) async {
    try {
      final newTextMessage = ChatTextMessageBody(content: content);
      final message = messageToEdit.value;

      if (message == null) return;

      await ChatClient.getInstance.chatManager.modifyMessage(
        messageId: message.msgId,
        msgBody: newTextMessage,
      );

      // Update the local message content
      message.body = newTextMessage;

      // Replace the message in the RxList
      final index = messages.indexWhere((m) => m.msgId == message.msgId);
      if (index != -1) {
        messages[index] = message; // This will trigger UI update
      }

      messageToEdit.value = null;
      chatController.clear();

      print('Message Updated');
    } catch (e) {
      print('Error updating message: $e');
    }
  }

  Rxn<String> messageIdToDelete = Rxn<String>();
  Future<void> deleteMessage({
    ChatConversationType type = ChatConversationType.Chat,
  }) async {
    try {
      final message = messageIdToDelete.value;

      if (message == null) return;

      await ChatClient.getInstance.chatManager.deleteRemoteMessagesWithIds(
        conversationId: selectedConversation.value!.id,
        type: type,
        msgIds: [messageIdToDelete.value!],
      );

      // Update the local message content

      // Replace the message in the RxList
      messages.removeWhere((m) => m.msgId == message);
      messageIdToDelete.value = null;

      print('Message Deleted');
    } catch (e) {
      print('Error deleting message: $e');
    }
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
      'chatListenerId',
      ChatEventHandler(
        onMessagesReceived: (msgs) {
          final groupMessages = messages
              .where(
                (msg) =>
                    msg.chatType == ChatType.GroupChat &&
                    msg.to == selectedConversation.value?.id,
              ) // Make sure you're viewing the same group
              .toList();

          if (groupMessages.isNotEmpty) {
            messages
              ..addAll(groupMessages)
              ..sort((a, b) => a.serverTime.compareTo(b.serverTime))
              ..refresh();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              scrollToBottom();
            });
          }
          for (final msg in messages) {
            print(
              'Received message from: ${msg.from}, to: ${msg.to}, type: ${msg.chatType}',
            );
          }
        },
      ),
    );
  }

  Future<void> selectConversation(ChatConversationWrapper convo) async {
    selectedConversation.value = convo;
    selectedConversationType.value = convo.conversation.type;
    await markMessagesAsRead();
    await loadMessages();
  }

  RxList<AgoraUser> selectedUsers = <AgoraUser>[].obs;
  RxList<AgoraUser> agoraUserList = <AgoraUser>[].obs;
  Rx<TheStates> searchUserState = TheStates.initial.obs;
  RxnString searchUserError = RxnString();
  Future<void> searchUserAndChat({required String query}) async {
    // if (query.length < 3) {
    //   searchUserState.value = TheStates.error;

    // }
    searchUserState.value = TheStates.loading;

    final result = await remoteSource.searchUser(query: query);

    result.fold(
      (l) {
        searchUserState.value = TheStates.error;
        // AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) {
        agoraUserList.assignAll(r.data ?? []);
        searchUserState.value = TheStates.success;
      },
    );
  }

  Future<void> createGroupAndChat({
    required String groupName,
    required String desc,
    List<String>? members,
  }) async {
    final options = ChatGroupOptions();
    final group = await ChatClient.getInstance.groupManager.createGroup(
      groupName: groupName,
      desc: desc,
      inviteMembers: members,
      options: options,
    );
    final convo = await ChatClient.getInstance.chatManager.getConversation(
      group.groupId,
      type: ChatConversationType.GroupChat,
    );
    selectConversation(
      ChatConversationWrapper(id: convo!.id, conversation: convo),
    );
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
