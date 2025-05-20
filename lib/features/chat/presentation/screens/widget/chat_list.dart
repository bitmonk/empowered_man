import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/data/model/chat_conversation_wrapper.dart';
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
        controller.selectConversation(convo.conversation);
        Get.to(
          () => const ChatCoversationScreen(
            isGroupChat: false,
            isSoloChat: true,
          ),
        );
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        title: Row(
          children: [
            Text(
              isSquad ? 'Squad 1' : convo.userName,
              style: AppTextStyles.textBodyB1.copyWith(),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  color: convo.isOnline ? AppColors.appGreen : null,
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 5,
                width: 5,
              ),
            ),
            const Spacer(),
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
                convo.latestMessage ?? 'M/A',
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
                    color: AppColors.appGreen, shape: BoxShape.circle,),
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
          child: isSquad
              ? Assets.images.squadProfile.image(height: 40, width: 40)
              : Assets.images.chatUserPic.image(height: 40, width: 40),
        ),
      ),
    );
  }
}
