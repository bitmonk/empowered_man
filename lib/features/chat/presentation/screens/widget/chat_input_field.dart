import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';

class ChatInputField extends StatelessWidget {
  ChatInputField({super.key, this.isNewMessage = false});
  final bool isNewMessage;
  final controller = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.bgBorder,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child:
                Assets.images.addIconWithBackground.svg(width: 40, height: 40),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              minLines: 1,
              textInputAction: TextInputAction.newline,
              onTap: () async {
                await Future.delayed(const Duration(milliseconds: 500));
                controller.scrollToBottom();
              },
              controller: controller.chatController,
              decoration: InputDecoration(
                hintText: 'Message...',
                hintStyle: AppTextStyles.textBodyB2
                    .copyWith(color: AppColors.textColor200),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          // InkWell(
          //   onTap: isNewMessage
          //       ? () {
          //           Navigator.pop(context);
          //           Get.to(
          //             () => const ChatCoversationScreen(
          //               isSoloChat: false,
          //               isGroupChat: true,
          //             ),
          //           );
          //         }
          //       : controller.sendMessage,
          //   child: Assets.images.sendMessageIcon.svg(width: 40, height: 40),
          // ),
        ],
      ),
    );
  }
}
