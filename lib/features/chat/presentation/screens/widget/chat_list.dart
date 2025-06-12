import 'package:cached_network_image/cached_network_image.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/data/model/chat_conversation_wrapper.dart';
import 'package:empowered/features/chat/presentation/controllers/audio_player_controller.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/chat/presentation/screens/chat_coversation_screen.dart';

class ChatList extends StatelessWidget {
  ChatList({required this.isSquad, required this.convo, super.key});

  final bool isSquad;
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
      child: ListTile(
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
            const SizedBox(
              width: 2,
            ),
            //  if (convo.lastChattedTime != null) const Spacer(),
            if (convo.lastChattedTime != null)
              Text(
                convo.lastChattedTime!.timeAgo(),
                style: AppTextStyles.textSmallS2,
              ),
          ],
        ),
        subtitle: Row(
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
        ),
        leading: ClipOval(
          child: _buildProfileImage(),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    // For squad/group chats, use the static squad image
    if (isSquad) {
      return _buildInitialAvatar();
    }

    // For individual chats, try to load user's avatar
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
          // Fallback to static image if network image fails
          return Assets.images.chatUserPic.image(
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          );
        },
      );
    }

    // Fallback to static image if no avatar URL
    return Assets.images.chatUserPic.image(
      height: 40,
      width: 40,
      fit: BoxFit.cover,
    );
  }

  Widget _buildInitialAvatar() {
    String initials = _getInitials(convo.userName ?? 'N/A');
    Color backgroundColor = _getRandomLightColor(convo.userName ?? 'N/A');

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

    // Remove extra spaces and split by space
    List<String> words = name.trim().split(RegExp(r'\s+'));

    if (words.length >= 2) {
      // If multiple words, take first letter of first two words
      return (words[0][0] + words[1][0]).toUpperCase();
    } else if (words[0].length >= 2) {
      // If single word with 2+ characters, take first two letters
      return words[0].substring(0, 2).toUpperCase();
    } else {
      // If single character, duplicate it
      return (words[0][0] + words[0][0]).toUpperCase();
    }
  }

  Color _getRandomLightColor(String seed) {
    // Use the name as seed for consistent color per conversation
    int hash = seed.hashCode;
    int index = hash.abs() % _lightColors.length;
    return _lightColors[index];
  }

  Color _getTextColor(Color backgroundColor) {
    // Calculate luminance to determine if text should be dark or light
    double luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black87 : Colors.white;
  }
}
