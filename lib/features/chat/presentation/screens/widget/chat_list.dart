import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/chat/presentation/screens/chat_coversation_screen.dart';

class ChatList extends StatelessWidget {
  ChatList({required this.isSquad, super.key});
  final bool isSquad;
  final controller = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.chatUserList.length,
      itemBuilder: (context, index) {
        var chat = controller.chatUserList[index];

        return InkWell(
          onTap: () {
            Get.to(
              () => ChatCoversationScreen(
                isGroupChat: isSquad,
                isSoloChat: !isSquad,
              ),
            );
          },
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            title: Row(
              children: [
                Text(
                  isSquad ? 'Squad 1' : chat.name,
                  style: AppTextStyles.textBodyB1.copyWith(),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: chat.isOnline ? AppColors.appGreen : null,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 5,
                    width: 5,
                  ),
                ),
                const Spacer(),
                Text(
                  chat.dateTime,
                  style: AppTextStyles.textSmallS2,
                ),
              ],
            ),
            subtitle: Text(
              chat.message,
              style: AppTextStyles.textBodyB4,
            ),
            leading: ClipOval(
              child: isSquad
                  ? Assets.images.squadProfile.image(height: 40, width: 40)
                  : Assets.images.chatUserPic.image(height: 40, width: 40),
            ),
          ),
        );
      },
    );
  }
}
