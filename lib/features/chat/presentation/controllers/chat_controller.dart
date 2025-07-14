import 'dart:async';
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
  final String presenceListenerId = 'presence_listener';

  RxList<ChatConversationWrapper> allConversations =
      <ChatConversationWrapper>[].obs;
  String? _nextConversationCursor;

  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final Rxn<ChatConversationWrapper> selectedConversation =
      Rxn<ChatConversationWrapper>();
  final Rxn<ChatConversationType> selectedConversationType =
      Rxn<ChatConversationType>();
  final int messageQuantity = 10;
  final int threadMessageQuantity = 3;
  final profileController = Get.find<ProfileController>();
// online status
  RxMap<String, bool> userOnlineStatus = <String, bool>{}.obs;
  RxMap<String, ChatPresence> userPresenceMap = <String, ChatPresence>{}.obs;
  RxMap<String, DateTime> lastSeenMap = <String, DateTime>{}.obs;
  Rxn<ChatMessage> replyToMessage = Rxn<ChatMessage>();

  // Timer for periodic presence updates
  Timer? _presenceTimer;
  final Duration _presenceUpdateInterval = const Duration(minutes: 2);
  // Store messages for shortcut chat display
  RxMap<String, List<ChatMessage>> shortcutMessages =
      <String, List<ChatMessage>>{}.obs;
  // Store TextEditingControllers for each conversation's shortcut input field
  RxMap<String, TextEditingController> shortcutInputControllers =
      <String, TextEditingController>{}.obs;

  @override
  void onInit() {
    super.onInit();
    chatController = TextEditingController();
    chatScreenScrollController = ScrollController();
    _initialize();
  }

  Future<void> _initialize() async {
    await _waitForProfile();
    currentUserId.value = profileController.userProfile.value.slug;
    currentUserToken.value = profileController.userProfile.value.agoraUserToken;

    await initSDK();
  }

  Future<void> _waitForProfile() async {
    const maxRetries = 3;
    var retries = 0;

    while (profileController.userProfileState.value != TheStates.success &&
        retries < maxRetries) {
      print('ChatController: Waiting for profile (Attempt ${retries + 1})');
      await profileController.getUserProfile();
      if (profileController.userProfileState.value != TheStates.success) {
        await Future.delayed(const Duration(seconds: 1));
        retries++;
      }
    }

    if (profileController.userProfileState.value != TheStates.success) {
      print(
        'ChatController: Failed to fetch profile after $maxRetries attempts',
      );
      initializingSdks.value = TheStates.error;
      loginError.value = 'Failed to fetch user profile';
    }
  }

  Rx<TheStates> initializingSdks = TheStates.initial.obs;
  RxnString loginError = RxnString();

  Future<void> initSDK() async {
    print('ChatController: Initializing Agora Chat SDK...');
    if (currentUserId.value == null || currentUserToken.value == null) {
      initializingSdks.value = TheStates.error;
      loginError.value =
          'User ID or token is missing: ID=${currentUserId.value}, Token=${currentUserToken.value}';
      print('ChatController: $loginError.value');
      return;
    }

    initializingSdks.value = TheStates.loading;
    try {
      final options = ChatOptions(appKey: AgoraChatConfig.appKey);
      await ChatClient.getInstance.init(options);
      await ChatClient.getInstance.startCallback();

      final isLoggedIn = await ChatClient.getInstance.isLoginBefore();
      if (!isLoggedIn) {
        await ChatClient.getInstance.loginWithPassword(
          currentUserId.value!,
          currentUserToken.value!,
        );
        print(
          '💡💡💡💡💡ChatController: Logged in to Agora Chat SDK with user: ${currentUserId.value}',
        );
      } else {
        print('ChatController: Already logged in to Agora Chat SDK');
      }

      ChatClient.getInstance.chatManager.removeMessageEvent(chatListenerId);
      ChatClient.getInstance.chatManager.removeEventHandler(chatListenerId);
      _addListeners();
      _addPresenceListeners();

      await _initializePresenceTracking();

      fetchConversations(isInitialLoad: true);
      chatScreenScrollController.addListener(() {
        if (chatScreenScrollController.position.pixels <=
            chatScreenScrollController.position.minScrollExtent + 100) {
          loadPreviousMessages();
        }
      });

      initializingSdks.value = TheStates.success;
      loginError.value = null;
    } on ChatError catch (e) {
      initializingSdks.value = TheStates.error;
      if (e.code == 200) {
        initializingSdks.value = TheStates.success;
        loginError.value = null;
        print('ChatController: Agora Chat SDK already logged in');
        await _initializePresenceTracking();
      } else {
        loginError.value = 'Agora SDK Error: ${e.code} - ${e.description}';
        print('ChatController: $loginError.value');
      }
    } catch (e) {
      initializingSdks.value = TheStates.error;
      loginError.value = 'Unexpected error: $e';
      print('ChatController: $loginError.value');
    }
  }

  Future<void> _initializePresenceTracking() async {
    try {
      print('🔄 Initializing presence tracking...');

      // Remove any existing presence listeners first
      ChatClient.getInstance.presenceManager
          .removeEventHandler(presenceListenerId);

      // Add presence listeners BEFORE publishing presence
      _addPresenceListeners();

      // Check if presence service is available
      try {
        // Try a simple operation to check if presence is enabled
        await ChatClient.getInstance.presenceManager
            .fetchPresenceStatus(members: []);
      } catch (e) {
        if (e.toString().contains('NotOpenServiceException')) {
          print('❌ Presence service is not enabled for this app');
          print('💡 Please enable presence service in Agora Console');
          return;
        }
      }

      // Publish your own presence as online with minimal data
      await ChatClient.getInstance.presenceManager
          .publishPresence('1'); // Use '1' instead of 'Online'
      print('✅ Published own presence');

      // Start with a small delay before fetching presence
      await Future.delayed(const Duration(milliseconds: 1000));

      // Fetch presence for existing conversations in smaller batches
      await _updatePresenceForAllUsers();

      // Start periodic presence updates with longer intervals
      _startPresenceTimer();

      print('✅ Presence tracking initialized successfully');
    } catch (e) {
      print('❌ Failed to initialize presence tracking: $e');
      // Don't throw the error, just log it and continue
    }
  }

  // Add presence event listeners
  void _addPresenceListeners() {
    ChatClient.getInstance.presenceManager.addEventHandler(
      presenceListenerId,
      ChatPresenceEventHandler(
        onPresenceStatusChanged: (presences) {
          _updatePresenceStatus(presences);
        },
      ),
    );
  }

  void _updatePresenceStatus(List<ChatPresence> presences) {
    for (final presence in presences) {
      final userId = presence.publisher;

      // Enhanced online status detection
      var isOnline = false;

      // Check if user has any status details
      if (presence.statusDetails != null &&
          presence.statusDetails!.isNotEmpty) {
        // Check for online status in any device
        isOnline = presence.statusDetails!.values.any((status) {
          final statusStr = status.toString().toLowerCase();
          return statusStr.contains('online') || statusStr == '1';
        });
      }

      // Fallback: Check if lastTime is recent (within last 5 minutes)
      if (!isOnline && presence.lastTime > 0) {
        final lastActiveTime =
            DateTime.fromMillisecondsSinceEpoch(presence.lastTime);
        final timeDiff = DateTime.now().difference(lastActiveTime);
        isOnline = timeDiff.inMinutes <=
            5; // Consider online if active within 5 minutes
      }

      // Update online status
      userOnlineStatus[userId] = isOnline;
      userPresenceMap[userId] = presence;

      // Update last seen if user is offline
      if (!isOnline && presence.lastTime > 0) {
        lastSeenMap[userId] =
            DateTime.fromMillisecondsSinceEpoch(presence.lastTime);
      }

      // Debug: Print all status details
      // if (presence.statusDetails != null) {
      //   print('📊 Status details for $userId: ${presence.statusDetails}');
      // }
    }

    _refreshConversationsWithPresence();
  }

  // Refresh conversations with updated presence
  void _refreshConversationsWithPresence() {
    final updatedConversations = <ChatConversationWrapper>[];

    for (final convo in allConversations) {
      final isOnline = convo.conversation.type == ChatConversationType.Chat
          ? userOnlineStatus[convo.id] ?? false
          : true; // Groups are always considered "online"

      updatedConversations.add(
        ChatConversationWrapper(
          id: convo.id,
          conversation: convo.conversation,
          userName: convo.userName,
          avatarUrl: convo.avatarUrl,
          isOnline: isOnline,
          latestMessage: convo.latestMessage,
          lastChattedTime: convo.lastChattedTime,
          unreadCount: convo.unreadCount,
          description: convo.description,
        ),
      );
    }

    allConversations.assignAll(updatedConversations);
  }

  // Start periodic presence timer
  void _startPresenceTimer() {
    _presenceTimer?.cancel();
    _presenceTimer = Timer.periodic(_presenceUpdateInterval, (timer) {
      _updatePresenceForAllUsers();
    });
  }

  // Update presence for all conversation users
  Future<void> _updatePresenceForAllUsers() async {
    try {
      final userIds = allConversations
          .where(
            (convo) => convo.conversation.type == ChatConversationType.Chat,
          )
          .map((convo) => convo.id)
          .toList();

      if (userIds.isEmpty) return;

      // Fetch presence for all users
      final presences = await ChatClient.getInstance.presenceManager
          .fetchPresenceStatus(members: userIds);

      if (presences.isNotEmpty) {
        _updatePresenceStatus(presences);
      }
    } catch (e) {
      print('❌ Failed to update presence: $e');
    }
  }

  Future<void> subscribeToUserPresence(List<String> userIds) async {
    if (userIds.isEmpty) return;

    try {
      // Filter out current user ID and duplicates
      final filteredUserIds = userIds
          .where((id) => id != currentUserId.value)
          .toSet() // Remove duplicates
          .toList();

      if (filteredUserIds.isEmpty) {
        print('⚠️ No valid users to subscribe to after filtering');
        return;
      }

      print('📡 Subscribing to presence for ${filteredUserIds.length} users');

      // Use smaller batch sizes to avoid parameter length exceeded error
      const batchSize = 20; // Reduced from 50 to 20

      for (var i = 0; i < filteredUserIds.length; i += batchSize) {
        final batch = filteredUserIds.skip(i).take(batchSize).toList();
        print(
          '📦 Processing batch ${(i ~/ batchSize) + 1}: ${batch.length} users',
        );

        try {
          await ChatClient.getInstance.presenceManager.subscribe(
            members: batch,
            expiry: 24 * 60 * 60, // Reduced to 1 day instead of 7 days
          );

          // Longer delay between batches to avoid rate limiting
          if (i + batchSize < filteredUserIds.length) {
            await Future.delayed(const Duration(milliseconds: 500));
          }

          print('✅ Batch ${(i ~/ batchSize) + 1} subscribed successfully');
        } catch (batchError) {
          print(
            '❌ Failed to subscribe batch ${(i ~/ batchSize) + 1}: $batchError',
          );

          // If subscription fails, try direct fetch instead
          try {
            final presences = await ChatClient.getInstance.presenceManager
                .fetchPresenceStatus(members: batch);
            if (presences.isNotEmpty) {
              _updatePresenceStatus(presences);
              print('⚡ Fallback fetch successful for batch');
            }
          } catch (fallbackError) {
            print('❌ Fallback also failed for batch: $fallbackError');
          }

          continue; // Continue with next batch
        }
      }

      print(
        '✅ Presence subscription completed for ${filteredUserIds.length} users',
      );
    } catch (e) {
      print('❌ Failed to subscribe to presence: $e');
    }
  }

  // Get formatted last seen text
  String getLastSeenText(String userId) {
    if (userOnlineStatus[userId] == true) {
      return 'Online';
    }

    final lastSeen = lastSeenMap[userId];
    if (lastSeen == null) return 'Last seen unknown';

    final now = DateTime.now();
    final difference = now.difference(lastSeen);

    if (difference.inMinutes < 1) {
      return 'Last seen just now';
    } else if (difference.inMinutes < 60) {
      return 'Last seen ${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return 'Last seen ${difference.inHours}h ago';
    } else {
      return 'Last seen ${difference.inDays}d ago';
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
      if (userIds.isNotEmpty) {
        await subscribeToUserPresence(userIds);
      }
      final wrappedConversations = <ChatConversationWrapper>[];

      for (final convo in result.data) {
        ChatUserInfo? userInfo;
        ChatMessage? lastMsg;
        ChatGroup? group;

        try {
          if (convo.type == ChatConversationType.GroupChat) {
            group = await ChatClient.getInstance.groupManager
                .fetchGroupInfoFromServer(convo.id);
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

        var userName = '';
        if (convo.type == ChatConversationType.GroupChat) {
          userName = group?.name ?? 'Unknown Group';
        } else {
          var nickName = userInfo?.nickName;
          var userId = userInfo?.userId;
          var conversationId = convo.id;

          if (nickName != null && nickName.trim().isNotEmpty) {
            userName = nickName.trim();
          } else if (userId != null && userId.trim().isNotEmpty) {
            userName = userId.trim();
          } else if (conversationId.trim().isNotEmpty) {
            userName = conversationId.trim();
          } else {
            userName = 'Unknown User';
          }
        }

        print(
          'Debug: convo.id=${convo.id}, userName=$userName, '
          'nickName=${userInfo?.nickName}, userId=${userInfo?.userId},avatarUrl = ${userInfo?.avatarUrl}',
        );
        var isOnline = false;
        if (convo.type == ChatConversationType.Chat) {
          isOnline = userOnlineStatus[convo.id] ?? false;
        } else {
          isOnline = true; // Groups are always considered "online"
        }

        wrappedConversations.add(
          ChatConversationWrapper(
            id: convo.id,
            conversation: convo,
            userName: userName,
            avatarUrl: userInfo?.avatarUrl,
            isOnline: isOnline,
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
      scrollToBottom();
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
        print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${group.toJson()}');
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

      await getGroupInfo();
      await fetchGroupChats(isInitialLoad: true);
      print('✅ Group info updated successfully');
    } on ChatError catch (e) {
      AppUtils.showErrorSnackbar(
        message: 'Failed to update group info: You must be the group owner.',
      );
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
      await getGroupInfo();
      await fetchGroupChats(isInitialLoad: true);
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

      await getGroupInfo();
      AppUtils.showSnackbar(
        message: 'Member removed successfully.',
      );
      await fetchGroupChats(isInitialLoad: true);
    } on ChatError catch (e) {
      AppUtils.showErrorSnackbar(
        message: 'Failed to remove member: ${e.description}',
      );
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
    if (msgs.isEmpty) return;
    try {
      final messageIds = msgs.map((e) => e.msgId).toList();

      final chatType =
          selectedConversationType.value == ChatConversationType.GroupChat
              ? ChatType.GroupChat
              : ChatType.Chat;
      print(
          'Fetching reactions for ${messageIds.length} messages, chatType: $chatType',);
      final groupId = chatType == ChatType.GroupChat
          ? selectedConversation.value?.id
          : null;
      final reactionsResult =
          await ChatClient.getInstance.chatManager.fetchReactionList(
        messageIds: messageIds,
        chatType: chatType,
        groupId: groupId,
      );
      for (final entry in reactionsResult.entries) {
        final msgId = entry.key;
        final reactions = entry.value;
        reactionMap[msgId] = reactions;
        print('Updated reactionMap for msgId $msgId: $reactions');
      }
      reactionMap.refresh();
      print('✅ Reaction map updated for ${messageIds.length} messages');
    } catch (e) {
      print('❌ Failed to fetch reactions: $e');
      AppUtils.showErrorSnackbar(message: 'Failed to load reactions: $e');
    }
  }

  Future<void> fetchLastMessagesForConversation(
      String convoId, ChatConversationType type,) async {
    try {
      final result =
          await ChatClient.getInstance.chatManager.fetchHistoryMessages(
        conversationId: convoId,
        type: type,
        pageSize: threadMessageQuantity, // Fetch up to 10 messages
      );

      final loadedMessages = result.data;
      print(
          'Fetched ${loadedMessages.length} messages for shortcut chat in conversation $convoId',);
      shortcutMessages[convoId] =
          loadedMessages.take(threadMessageQuantity).toList(); // Limit to 5
      shortcutMessages.refresh();

      // Initialize TextEditingController for this conversation if not already present
      if (shortcutInputControllers[convoId] == null) {
        shortcutInputControllers[convoId] = TextEditingController();
      }

      // Fetch reactions for the loaded messages
      await fetchReactionsForMessages(loadedMessages);
    } on ChatError catch (e) {
      print(
          'Error fetching shortcut messages for $convoId: ${e.code} - ${e.description}',);
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
      print(
        'Loaded ${loadedMessages.length} messages for conversation ${selectedConversation.value!.id}',
      );

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
  void selectReply(ChatMessage msg) {
    replyToMessage.value = msg;
  }

  void clearReply() {
    replyToMessage.value = null;
  }

  Future<void> sendMessage({
    String? targetID,
    ChatConversationType? chatType,
    String? text,
    String? filePath,
    String? audioPath,
    int? audioDuration,
    String? fileDisplayName,
    TextEditingController? inputController,
  }) async {
    if ((text == null || text.trim().isEmpty) &&
        filePath == null &&
        audioPath == null) {
      print('ChatController: No message content to send');
      return;
    }
    if (targetID == null || chatType == null) {
      print(
          'ChatController: Invalid targetID ($targetID) or chatType ($chatType)',);
      sendMessageError.value = 'Invalid target or chat type';
      sendingMessageState.value = TheStates.error;
      return;
    }

    final chatTypeValue = chatType == ChatConversationType.GroupChat
        ? ChatType.GroupChat
        : ChatType.Chat;
    var targetId = targetID;

    ChatMessage? message;

    sendingMessageState.value = TheStates.loading;
    sendMessageError.value = null;
    try {
      if (filePath != null) {
        if (!File(filePath).existsSync()) {
          print('ChatController: File does not exist at: $filePath');
          AppUtils.showErrorSnackbar(message: 'File does not exist!');
          sendMessageError.value = 'File does not exist';
          sendingMessageState.value = TheStates.error;
          return;
        }
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
            chatType: chatTypeValue,
            to: targetId,
            body: imgBody,
          );
        } else if (isVideo) {
          print('ChatController: Creating video message for $filePath');
          final vidBody = ChatVideoMessageBody(
            localPath: filePath,
            displayName: fileDisplayName ?? filePath.split('/').last,
          );
          message = ChatMessage.createSendMessage(
            chatType: chatTypeValue,
            to: targetId,
            body: vidBody,
          );
        } else if (isDocument) {
          final fileBody = ChatFileMessageBody(
            localPath: filePath,
            displayName: fileDisplayName ?? filePath.split('/').last,
          );
          message = ChatMessage.createSendMessage(
            chatType: chatTypeValue,
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
          chatType: chatTypeValue,
          to: targetId,
          body: voiceBody,
        );
      } else if (text != null) {
        message = ChatMessage.createTxtSendMessage(
          targetId: targetId,
          content: text.trim(),
          chatType: chatTypeValue,
        );
      }
      if (message != null && replyToMessage.value != null) {
        message.attributes ??= {};
        message.attributes!['replyTo'] = replyToMessage.value!.msgId;
        message.attributes!['replyPreview'] =
            (replyToMessage.value!.body is ChatTextMessageBody)
                ? (replyToMessage.value!.body as ChatTextMessageBody).content
                : '[${replyToMessage.value!.body.runtimeType}]';
        message.attributes!['replyToSender'] =
            replyToMessage.value!.from ?? 'Unknown';
        clearReply();
      }
      if (message != null) {
        print(
            'ChatController: Sending message to $targetId, type: $chatTypeValue, text: $text',);
        await ChatClient.getInstance.chatManager.sendMessage(message);
        print('ChatController: Message sent, msgId: ${message.msgId}');
        messages.add(message);
        shortcutMessages[targetId] = (shortcutMessages[targetId] ?? [])
          ..add(message);
        if (shortcutMessages[targetId]!.length > threadMessageQuantity) {
          shortcutMessages[targetId] =
              shortcutMessages[targetId]!.take(threadMessageQuantity).toList();
        }
        shortcutMessages.refresh();
        (inputController ??
                shortcutInputControllers[targetId] ??
                chatController)
            .clear();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollToBottom();
        });
        sendingMessageState.value = TheStates.success;
      }
    } catch (e) {
      print('ChatController: Error sending message: $e');
      sendMessageError.value = e.toString();
      sendingMessageState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to send message: $e');
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
      // Always refresh
      await fetchReactionsForMessages(
          [messages.firstWhere((m) => m.msgId == msgId)],);
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
      // Always refresh
      await fetchReactionsForMessages(
          [messages.firstWhere((m) => m.msgId == msgId)],);
      print('Reaction removed');
    } catch (e) {
      print('Failed to remove reaction: $e');
    }
  }

  void _addListeners() {
    // Add message event listener for sent messages
    ChatClient.getInstance.chatManager.addMessageEvent(
      chatListenerId,
      ChatMessageEvent(
        onSuccess: (msgId, msg) {
          print('Message sent successfully: $msgId');
          final index = messages.indexWhere((m) => m.msgId == msgId);
          if (index != -1) {
            messages[index] = msg;
          } else {
            messages.add(msg);
          }
          messages
            ..sort((a, b) => a.serverTime.compareTo(b.serverTime))
            ..refresh();
          // Update conversation list
          _updateConversationWithMessage(msg);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            scrollToBottom();
          });
        },
        onProgress: (msgId, progress) => print('Sending progress: $progress%'),
        onError: (msgId, msg, error) {
          print('Message failed: ${error.description}');
          AppUtils.showErrorSnackbar(
            message: 'Failed to send message: ${error.description}',
          );
        },
      ),
    );

    // Remove any existing event handler to prevent duplicates
    ChatClient.getInstance.chatManager.removeEventHandler(chatListenerId);

    // Add single event handler for received messages
    ChatClient.getInstance.chatManager.addEventHandler(
      chatListenerId,
      ChatEventHandler(
        onMessagesReceived: (msgs) {
          print('Received ${msgs.length} messages');
          final relevantMessages = msgs.where((msg) {
            return (msg.chatType == ChatType.Chat &&
                    (msg.to == currentUserId.value ||
                        msg.from == currentUserId.value)) ||
                (msg.chatType == ChatType.GroupChat &&
                    allConversations.any((c) => c.id == msg.to));
          }).toList();

          if (relevantMessages.isNotEmpty) {
            // Add to messages if in the current conversation
            if (selectedConversation.value != null) {
              final currentConvoId = selectedConversation.value!.id;
              final convoMessages = relevantMessages.where(
                (msg) =>
                    (msg.chatType == ChatType.Chat &&
                        (msg.to == currentConvoId ||
                            msg.from == currentConvoId)) ||
                    (msg.chatType == ChatType.GroupChat &&
                        msg.to == currentConvoId),
              );
              for (final msg in convoMessages) {
                if (!messages.any((m) => m.msgId == msg.msgId)) {
                  messages.add(msg);
                }
              }
              messages
                ..sort((a, b) => a.serverTime.compareTo(b.serverTime))
                ..refresh();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                scrollToBottom();
              });
            }
            // Update conversation list for all relevant messages
            for (final msg in relevantMessages) {
              _updateConversationWithMessage(msg);
            }
          }
        },
        onMessageReactionDidChange: (reactions) {
          print('Reaction changed: ${reactions.length} reactions');
          for (final reaction in reactions) {
            final msgId = reaction.messageId;
            final reactionList = reaction.reactions ?? [];
            print('Updating reactionMap for msgId $msgId: $reactionList');
            reactionMap[msgId] = reactionList;
          }
          reactionMap.refresh();
          print('✅ reactionMap refreshed');
        },
      ),
    );
  }

  Future<void> _updateConversationWithMessage(ChatMessage msg) async {
    try {
      final convoId = msg.chatType == ChatType.Chat
          ? (msg.from == currentUserId.value ? msg.to : msg.from)
          : msg.to;
      final convoType = msg.chatType == ChatType.Chat
          ? ChatConversationType.Chat
          : ChatConversationType.GroupChat;

      // Get or create conversation
      var convo = await ChatClient.getInstance.chatManager.getConversation(
        convoId!,
        type: convoType,
      );

      if (convo == null) {
        print('Conversation not found for $convoId, creating new');
        convo = await ChatClient.getInstance.chatManager.getConversation(
          convoId,
          type: convoType,
        );
      }

      // Get user or group info
      ChatUserInfo? userInfo;
      ChatGroup? group;
      if (convoType == ChatConversationType.Chat) {
        final userInfoMap = await ChatClient.getInstance.userInfoManager
            .fetchUserInfoById([convoId]);
        userInfo = userInfoMap[convoId];
      } else {
        group = await ChatClient.getInstance.groupManager
            .fetchGroupInfoFromServer(convoId);
      }

      // Get latest message preview
      String? latestMessage;
      final body = msg.body;
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

      // Get unread count
      var unreadCount = await convo!.unreadCount();
      if (msg.from != currentUserId.value) {
        unreadCount++;
      }

      // Determine username
      var userName = '';
      if (convoType == ChatConversationType.GroupChat) {
        userName = group?.name ?? 'Unknown Group';
      } else {
        userName = userInfo?.nickName?.trim().isNotEmpty == true
            ? userInfo!.nickName!
            : userInfo?.userId.trim().isNotEmpty == true
                ? userInfo!.userId
                : convoId;
      }

      // Update or add conversation
      final existingIndex = allConversations.indexWhere((c) => c.id == convoId);
      final isOnline = convoType == ChatConversationType.Chat
          ? userOnlineStatus[convoId] ?? false
          : true;

      final updatedConvo = ChatConversationWrapper(
        id: convoId,
        conversation: convo,
        userName: userName,
        avatarUrl: userInfo?.avatarUrl,
        isOnline: isOnline,
        latestMessage: latestMessage,
        lastChattedTime: DateTime.fromMillisecondsSinceEpoch(msg.serverTime),
        unreadCount: unreadCount,
      );

      if (existingIndex != -1) {
        allConversations[existingIndex] = updatedConvo;
      } else {
        allConversations.add(updatedConvo);
      }

      // Sort conversations by last message time
      allConversations
        ..sort((a, b) {
          final aTime = a.lastChattedTime?.millisecondsSinceEpoch ?? 0;
          final bTime = b.lastChattedTime?.millisecondsSinceEpoch ?? 0;
          return bTime.compareTo(aTime);
        })
        ..refresh();
      print('Updated conversation list for $convoId');
    } catch (e) {
      print('Error updating conversation: $e');
    }
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

  RxBool isCreatingGroup = false.obs;

  Future<void> createGroupAndChat({
    required String groupName,
    required String desc,
    List<String>? members,
  }) async {
    try {
      isCreatingGroup.value = true;
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
      selectedConversationType.value = ChatConversationType.GroupChat;

      selectConversation(
        ChatConversationWrapper(
          id: convo!.id,
          conversation: convo,
          userName: groupName,
          description: desc,
        ),
      );
    } finally {
      isCreatingGroup.value = false;
    }
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (chatScreenScrollController.hasClients) {
        final maxScroll = chatScreenScrollController.position.maxScrollExtent;
        const extraPadding = 100.0;
        chatScreenScrollController.animateTo(
          maxScroll + extraPadding,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void scrollToMessage(String msgId) {
    final index = messages.indexWhere((m) => m.msgId == msgId);
    if (index != -1) {
      final offset = index * 60.0;
      chatScreenScrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onClose() {
    chatController.dispose();
    chatScreenScrollController.dispose();
    shortcutInputControllers.forEach((_, controller) => controller.dispose());
    ChatClient.getInstance.chatManager.removeMessageEvent(chatListenerId);
    ChatClient.getInstance.chatManager.removeEventHandler(chatListenerId);
  }

  String getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour < 12 ? 'AM' : 'PM'}";
  }
}
