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
      return Assets.images.squadProfile.image(
        height: 40,
        width: 40,
        fit: BoxFit.cover,
      );
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
}
