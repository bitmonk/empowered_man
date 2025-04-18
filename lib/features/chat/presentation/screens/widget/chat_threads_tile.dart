import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_input_field.dart';

class ChatThreadsTile extends StatelessWidget {
  const ChatThreadsTile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Assets.images.chatUserPic.image(width: 40, height: 40),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'James Mitchell',
                    style: AppTextStyles.textBodyB1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.appGreen,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 5,
                      width: 5,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    '2 hr',
                    style: AppTextStyles.textSmallS2,
                  ),
                ],
              ),
              subtitle: const Text(
                'Unit 1',
                style: AppTextStyles.textBodyB4,
              ),
            ),
            const AppDivider(
              indent: 20,
              endent: 20,
              color: AppColors.bgBorderVLight,
            ),
            // ListView.builder(
            //   shrinkWrap: true,
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: controller.chatConversationList.length,
            //   itemBuilder: (context, index) {
            //     var chat = controller.chatConversationList[index];
            //     return ChatBubbleContainer(
            //       message: chat.message,
            //       isMine: chat.isMine,
            //       timeStamp: chat.timeStamp,
            //       onLike: () {},
            //     );
            //   },
            // ),
            ChatInputField(),
          ],
        );
      },
    );
  }
}
