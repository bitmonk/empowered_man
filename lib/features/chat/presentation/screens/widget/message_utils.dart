import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';

import 'package:empowered/features/chat/presentation/screens/chat_coversation_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageUtils {
  static Widget getMessageWidget(ChatMessage message, bool isMine,
      String messageId, BuildContext context,) {
    var jsonMessage = message.body.toJson();
    String messageWidgetType = jsonMessage['type'] == 'file' &&
            jsonMessage['displayName']?.contains('.m4a') == true
        ? 'audio'
        : jsonMessage['type'];

    final controller = Get.find<ChatController>();

    if (controller.sendingMessageState.value == TheStates.loading) {
      return const Text('sending...');
    } else if (controller.sendingMessageState.value == TheStates.error) {
      return const Text('Message not sent. Please send again.');
    } else {
      Widget wid;
      switch (messageWidgetType) {
        case 'txt':
          wid = MessageTypeText(
            text: jsonMessage['content'] ?? '',
            isMine: isMine,
          );
        case 'file':
          final fileName = jsonMessage['displayName'] ?? 'File';
          final remotePath = jsonMessage['remotePath'];
          wid = (remotePath != null && remotePath.toString().isNotEmpty)
              ? InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(remotePath));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(12),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.65,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            !isMine ? AppColors.bgBorder : Colors.transparent,
                      ),
                      color: isMine ? AppColors.primary500 : AppColors.bgMedium,
                      borderRadius: BorderRadius.only(
                        bottomRight: const Radius.circular(14),
                        topLeft:
                            !isMine ? Radius.zero : const Radius.circular(14),
                        bottomLeft: const Radius.circular(14),
                        topRight:
                            isMine ? Radius.zero : const Radius.circular(14),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: isMine
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.insert_drive_file,
                          color: isMine ? Colors.white : Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            fileName,
                            style: TextStyle(
                              color: isMine ? Colors.white : Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: !isMine ? AppColors.bgBorder : Colors.transparent,
                    ),
                    color: isMine ? AppColors.primary500 : AppColors.bgMedium,
                    borderRadius: BorderRadius.only(
                      bottomRight: const Radius.circular(14),
                      topLeft:
                          !isMine ? Radius.zero : const Radius.circular(14),
                      bottomLeft: const Radius.circular(14),
                      topRight:
                          isMine ? Radius.zero : const Radius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Invalid file',
                    style: TextStyle(
                      color: isMine ? Colors.white : AppColors.textColor300,
                    ),
                  ),
                );
        case 'img':
          final remotePath = jsonMessage['remotePath'];
          wid = (remotePath != null && remotePath.toString().isNotEmpty)
              ? MessaageTypeImage(images: [jsonMessage['remotePath']])
              : const Text(
                  'Sending image.....',
                  style: TextStyle(color: Colors.white),
                );
        case 'video':
          final remotePath = jsonMessage.containsKey('remotePath');
          wid = remotePath
              ? MessaageTypeVideo(videoUrl: jsonMessage['remotePath'])
              : const Text(
                  'Sending video...',
                  style: TextStyle(color: Colors.white),
                );
        case 'audio':
          final remotePath = jsonMessage.containsKey('remotePath');
          wid = remotePath
              ? MessageTypeAudio(
                  url: jsonMessage['remotePath'] ?? '',
                  id: messageId,
                  isMine: isMine,
                )
              : const Text(
                  'Audio too large. Please select an audio under 100MB.',
                );
        default:
          wid = const SizedBox.shrink();
      }
      return wid;
    }
  }
}
