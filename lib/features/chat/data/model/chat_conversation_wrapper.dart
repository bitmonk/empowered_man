import 'package:agora_chat_sdk/agora_chat_sdk.dart';

class ChatConversationWrapper {
  ChatConversationWrapper(
      {required this.conversation,
      required this.userName,
      this.avatarUrl,
      this.isOnline = false,
      this.latestMessage,
      this.lastChattedTime,
      this.unreadCount = 0,});
  final ChatConversation conversation;
  final String userName;
  final String? avatarUrl;
  final bool isOnline;
  final String? latestMessage;
  final DateTime? lastChattedTime;
  final int unreadCount;
}
