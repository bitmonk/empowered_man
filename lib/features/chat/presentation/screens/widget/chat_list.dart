import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/data/model/chat_conversation_wrapper.dart';
import 'package:empowered/features/chat/presentation/controllers/audio_player_controller.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/chat/presentation/screens/chat_coversation_screen.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_input_field.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart'; // Added import

class ChatList extends StatelessWidget {
  ChatList({
    required this.isSquad,
    required this.convo,
    this.showLastMessage = true,
    this.showShortcutContainer = false,
    super.key,
  });

  final bool isSquad;
  final bool showLastMessage;
  final bool showShortcutContainer;
  final controller = Get.find<ChatController>();
  final ChatConversationWrapper convo;
  final List<Color> _lightColors = [
    const Color(0xFFE3F2FD), // Light Blue
    const Color(0xFFF3E5F5), // Light Purple
    const Color(0xFFE8F5E8), // Light Green
    const Color(0xFFFFF3E0), // Light Orange
    const Color(0xFFFCE4EC), // Light Pink
    const Color(0xFFE0F2F1), // Light Teal
    const Color(0xFFF1F8E9), // Light Lime
    const Color(0xFFEDE7F6), // Light Deep Purple
    const Color(0xFFE8EAF6), // Light Indigo
    const Color(0xFFE1F5FE), // Light Cyan
    const Color(0xFFF9FBE7), // Light Yellow Green
    const Color(0xFFFFF8E1), // Light Amber
  ];

  @override
  Widget build(BuildContext context) {
    if (showShortcutContainer) {
      return _buildUnifiedContainer();
    }

    return _buildStandardChatList();
  }

  Widget _buildUnifiedContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.bgMedium,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: InkWell(
        onTap: () {
          AudioPlayerInitializer.initialize();
          controller.selectConversation(convo);
          Get.to(
            () => ChatCoversationScreen(
              isGroupChat: isSquad,
              isSoloChat: !isSquad,
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            _buildChatListContent(),
            Container(
              height: 1,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              color: AppColors.bgDark.withOpacity(0.3),
            ),
            _buildShortcutMessagesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildStandardChatList() {
    return InkWell(
      onTap: () {
        AudioPlayerInitializer.initialize();
        controller.selectConversation(convo);
        Get.to(
          () => ChatCoversationScreen(
            isGroupChat: isSquad,
            isSoloChat: !isSquad,
          ),
        );
      },
      child: _buildChatListContent(),
    );
  }

  Widget _buildChatListContent() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      title: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Text(
                    convo.userName == '' ? 'N/A' : convo.userName ?? '',
                    style: AppTextStyles.textBodyB1.copyWith(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (convo.isOnline)
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: convo.isOnline && !isSquad
                            ? AppColors.appGreen
                            : null,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 5,
                      width: 5,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 2),
          if (convo.lastChattedTime != null)
            Text(
              convo.lastChattedTime!.timeAgo(),
              style: AppTextStyles.textSmallS2,
            ),
        ],
      ),
      subtitle: showLastMessage
          ? Row(
              children: [
                Expanded(
                  child: Text(
                    convo.latestMessage ?? '',
                    style: AppTextStyles.textBodyB4,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (convo.unreadCount != 0)
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      color: AppColors.appGreen,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          convo.unreadCount.toString(),
                          style: AppTextStyles.textBodyB4,
                        ),
                      ),
                    ),
                  ),
              ],
            )
          : null,
      leading: ClipOval(
        child: _buildProfileImage(),
      ),
    );
  }

  Widget _buildShortcutMessagesSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const GreyDivider(),
        const VerticalSpacing(12),
        Obx(() {
          final messages = controller.shortcutMessages[convo.id] ?? [];
          if (controller.shortcutMessages[convo.id] == null) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (messages.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'No messages yet',
                  style: AppTextStyles.textCaptionC2,
                ),
              ),
            );
          }
          final limitedMessages = messages.length > 5
              ? messages.sublist(messages.length - 5)
              : messages;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            reverse: true,
            itemCount: limitedMessages.length,
            itemBuilder: (context, msgIndex) {
              final message =
                  limitedMessages[limitedMessages.length - 1 - msgIndex];
              final isMine =
                  message.from == ChatClient.getInstance.currentUserId;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Row(
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: isMine
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          if (!isMine)
                            Text(
                              message.from ?? 'Unknown',
                              style: AppTextStyles.textCaptionC2.copyWith(
                                color: AppColors.textColor200,
                                fontSize: 10,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: isMine
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              if (!isMine) ...[
                                _buildMessageAvatar(message),
                                const SizedBox(width: 8),
                              ],
                              // Use MessageUtils to get the appropriate widget
                              _buildShortcutMessageContent(message, isMine, context),
                              const HorizontalSpacing(8),
                              if (isMine) ...[
                                _buildMessageAvatar(message),
                              ],
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: isMine
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Text(
                                DateTime.fromMillisecondsSinceEpoch(
                                        message.serverTime,)
                                    .toString()
                                    .substring(11, 16),
                                style: AppTextStyles.textCaptionC2.copyWith(
                                  color: AppColors.textColor200,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (isMine) const SizedBox(width: 8),
                  ],
                ),
              );
            },
          );
        }),
        ChatInputField(
          controller: controller.shortcutInputControllers.putIfAbsent(
            convo.id,
            () => TextEditingController(),
          ),
          onSend: (message) {
            controller
                .sendMessage(
              targetID: convo.id,
              chatType: convo.conversation.type,
              text: message,
              inputController: controller.shortcutInputControllers[convo.id],
            )
                .then((_) {
              controller.fetchLastMessagesForConversation(
                convo.id,
                convo.conversation.type,
              );
            });
          },
          isSquad: convo.conversation.type == ChatConversationType.GroupChat,
        ),
      ],
    );
  }

  // New method to build shortcut message content based on message type
  Widget _buildShortcutMessageContent(ChatMessage message, bool isMine, BuildContext context) {
    var jsonMessage = message.body.toJson();
    String messageWidgetType = jsonMessage['type'] == 'file' &&
            jsonMessage['displayName']?.contains('.m4a') == true
        ? 'audio'
        : jsonMessage['type'];

    Widget content;

    switch (messageWidgetType) {
      case 'txt':
        content = Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          decoration: BoxDecoration(
            color: isMine ? AppColors.primary500 : AppColors.bgDark,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            jsonMessage['content'] ?? '',
            style: AppTextStyles.textBodyB3.copyWith(
              color: AppColors.baseWhite,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        );

      case 'img':
        final remotePath = jsonMessage['remotePath'];
        content = Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: isMine ? AppColors.primary500 : AppColors.bgDark,
            borderRadius: BorderRadius.circular(12),
          ),
          child: (remotePath != null && remotePath.toString().isNotEmpty)
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    remotePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.broken_image,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              : const Icon(
                  Icons.image,
                  color: Colors.white,
                  size: 30,
                ),
        );

      case 'video':
        content = Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: isMine ? AppColors.primary500 : AppColors.bgDark,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.play_circle_fill,
            color: Colors.white,
            size: 30,
          ),
        );

      case 'audio':
        content = Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isMine ? AppColors.primary500 : AppColors.bgDark,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.mic,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                'Voice message',
                style: AppTextStyles.textBodyB3.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );

      case 'file':
        final fileName = jsonMessage['displayName'] ?? 'File';
        content = Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          decoration: BoxDecoration(
            color: isMine ? AppColors.primary500 : AppColors.bgDark,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.insert_drive_file,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  fileName,
                  style: AppTextStyles.textBodyB3.copyWith(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );

      default:
        content = Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isMine ? AppColors.primary500 : AppColors.bgDark,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Unsupported message',
            style: AppTextStyles.textBodyB3.copyWith(
              color: Colors.white,
            ),
          ),
        );
    }

    return content;
  }

  Widget _buildMessageAvatar(ChatMessage message) {
    final isMine = message.from == ChatClient.getInstance.currentUserId;
    final userName = message.from ?? 'Unknown';

    if (isSquad) {
      return _buildInitialAvatarForMessage(userName);
    }

    if (isMine) {
      final imgUrl =
          Get.find<ProfileController>().userProfile.value.image ?? '';
      if (imgUrl.isNotEmpty) {
        return ClipOval(
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            height: 25,
            width: 25,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              height: 25,
              width: 25,
              color: Colors.grey[200],
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            errorWidget: (context, url, error) =>
                Assets.images.chatUserPicTwo.image(
              height: 25,
              width: 25,
              fit: BoxFit.cover,
            ),
          ),
        );
      }
      return Assets.images.chatUserPicTwo.image(
        height: 25,
        width: 25,
        fit: BoxFit.cover,
      );
    }

    final avatarUrl = convo.avatarUrl;
    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: avatarUrl,
          height: 25,
          width: 25,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            height: 25,
            width: 25,
            color: Colors.grey[200],
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          errorWidget: (context, url, error) =>
              Assets.images.chatUserPicTwo.image(
            height: 25,
            width: 25,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    return Assets.images.chatUserPicTwo.image(
      height: 25,
      width: 25,
      fit: BoxFit.cover,
    );
  }

  Widget _buildInitialAvatarForMessage(String userName) {
    var initials = _getInitials(userName);
    var backgroundColor = _getRandomLightColor(userName);
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          initials,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: _getTextColor(backgroundColor),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    if (isSquad) {
      return _buildInitialAvatar();
    }

    if (convo.avatarUrl != null && convo.avatarUrl!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: convo.avatarUrl!,
        height: 40,
        width: 40,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          height: 40,
          width: 40,
          color: Colors.grey[200],
          child: const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
        errorWidget: (context, url, error) {
          return Assets.images.chatUserPic.image(
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          );
        },
      );
    }

    return Assets.images.chatUserPic.image(
      height: 40,
      width: 40,
      fit: BoxFit.cover,
    );
  }

  Widget _buildInitialAvatar() {
    var initials = _getInitials(convo.userName ?? 'N/A');
    var backgroundColor = _getRandomLightColor(convo.userName ?? 'N/A');

    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          initials,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _getTextColor(backgroundColor),
          ),
        ),
      ),
    );
  }

  String _getInitials(String name) {
    if (name.isEmpty || name == 'N/A') {
      return 'NA';
    }

    var words = name.trim().split(RegExp(r'\s+'));

    if (words.length >= 2) {
      return (words[0][0] + words[1][0]).toUpperCase();
    } else if (words[0].length >= 2) {
      return words[0].substring(0, 2).toUpperCase();
    } else {
      return (words[0][0] + words[0][0]).toUpperCase();
    }
  }

  Color _getRandomLightColor(String seed) {
    var hash = seed.hashCode;
    var index = hash.abs() % _lightColors.length;
    return _lightColors[index];
  }

  Color _getTextColor(Color backgroundColor) {
    var luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black87 : Colors.white;
  }
}
