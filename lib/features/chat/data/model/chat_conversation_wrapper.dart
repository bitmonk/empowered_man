import 'package:agora_chat_sdk/agora_chat_sdk.dart';

class ChatConversationWrapper {
  ChatConversationWrapper({
    required this.conversation,
    required this.id,
    this.userName,
    this.avatarUrl,
    this.description,
    this.isOnline = false,
    this.latestMessage,
    this.lastChattedTime,
    this.unreadCount = 0,
  });
  final ChatConversation conversation;
  final String id;
  final String? userName;
  final String? avatarUrl;
  final bool isOnline;
  final String? latestMessage;
  final String? description;
  final DateTime? lastChattedTime;
  final int unreadCount;
}
