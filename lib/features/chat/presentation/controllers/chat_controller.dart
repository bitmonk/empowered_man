import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/data/source/chat_remote_source.dart';

class ChatController extends GetxController {
  ChatController({required this.remoteSource});
  final ChatRemoteSource remoteSource;
  RxList<String> filterList = ['All', 'Threads', 'Squads'].obs;
  RxInt selectedFilterindex = 0.obs;
  late TextEditingController chatController;
  late ScrollController scrollController;

  // RxList<ChatConversationModel> chatConversationList = [
  //   ChatConversationModel(
  //     isMine: false,
  //     timeStamp: '10:30 AM',
  //     profileImageUrl: '',
  //     name: '',
  //     message: 'Good Morning, My Friend ',
  //     dateTime: '2024-02-10 10:30:00',
  //   ),
  //   ChatConversationModel(
  //     isMine: false,
  //     timeStamp: '11:00 AM',
  //     profileImageUrl: '',
  //     name: '',
  //     message: 'How are you ??',
  //     dateTime: '2024-02-10 11:00:00',
  //   ),
  //   ChatConversationModel(
  //     isMine: true,
  //     timeStamp: '11:00 AM',
  //     profileImageUrl: '',
  //     name: '',
  //     message: 'Good Morning, My Friend ',
  //     dateTime: '2024-02-10 11:00:00',
  //   ),
  // ].obs;
  RxList<ChatUserListModel> chatUserList = [
    ChatUserListModel(
      name: 'Liam Cooper',
      message: 'Hey, are we still on for tonight?',
      dateTime: '20 min ago',
      unreadText: 2,
      isOnline: false,
      imageUrl: 'chatFriendPicThird',
    ),
    ChatUserListModel(
      name: 'Jane Smith',
      message: 'Just sent you the files. Let me know if you got them!',
      dateTime: '1 min ago',
      unreadText: 1,
      isOnline: true,
      imageUrl: 'chatFriendPicSecond',
    ),
    ChatUserListModel(
      name: 'Mike Johnson',
      message: 'Let’s catch up this weekend!',
      dateTime: '30 min ago',
      unreadText: 0,
      isOnline: true,
      imageUrl: 'chatFriendPic',
    ),
    ChatUserListModel(
      name: 'Emily Davis',
      message: 'I’ll be there in 15 minutes.',
      dateTime: '1 hour ago',
      unreadText: 3,
      isOnline: true,
      imageUrl: 'chatFriendPicSecond',
    ),
    ChatUserListModel(
      name: 'Chris Brown',
      message: 'Haha, that was hilarious!',
      dateTime: 'Yesterday',
      unreadText: 0,
      isOnline: true,
      imageUrl: 'chatFriendPicSecond',
    ),
    ChatUserListModel(
      name: 'Anna Taylor',
      message: 'Meeting rescheduled to 3 PM. Does that work?',
      imageUrl: 'chatFriendPicSecond',
      dateTime: 'Yesterday',
      unreadText: 5,
      isOnline: true,
    ),
    ChatUserListModel(
      name: 'Robert Wilson',
      message: 'Can you review this document?',
      imageUrl: 'chatImageProfileOne',
      dateTime: '2 days ago',
      unreadText: 1,
      isOnline: true,
    ),
    ChatUserListModel(
      name: 'Linda Thompson',
      message: 'Good morning! Hope you have a great day!',
      dateTime: '3 days ago',
      unreadText: 0,
      imageUrl: 'chatFriendPicSecond',
      isOnline: true,
    ),
    ChatUserListModel(
      name: 'David Anderson',
      message: 'Check your email, I’ve sent the details.',
      imageUrl: 'chatFriendPicSecond',
      dateTime: 'Last week',
      unreadText: 2,
      isOnline: true,
    ),
    ChatUserListModel(
      name: 'Sophia Martin',
      message: 'I’ll call you back in a bit.',
      dateTime: 'Last week',
      imageUrl: 'chatFriendPicSecond',
      unreadText: 0,
      isOnline: true,
    ),
  ].obs;
  @override
  void onInit() {
    super.onInit();
    chatController = TextEditingController();
    scrollController = ScrollController();
  }

  @override
  void onClose() {
    chatController.dispose();
    scrollController.dispose();
  }

  // void sendMessage() {
  //   if (chatController.text.trim().isNotEmpty) {
  //     chatConversationList.add(
  //       ChatConversationModel(
  //         message: chatController.text.trim(),
  //         isMine: true,
  //         timeStamp: getCurrentTime(),
  //         profileImageUrl: '',
  //         name: '',
  //         dateTime: '',
  //       ),
  //     );
  //     chatController.clear();
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //       scrollToBottom();
  //     });
  //   }
  // }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  String getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour < 12 ? 'AM' : 'PM'}";
  }
}

// class ChatConversationModel {
//   ChatConversationModel({
//     required this.isMine,
//     required this.timeStamp,
//     required this.profileImageUrl,
//     required this.name,
//     required this.message,
//     required this.dateTime,
//     this.isLiked = false,
//     this.hide = false,
//   });
//   final String name;
//   final String message;
//   final String dateTime;
//   final String timeStamp;
//   final String profileImageUrl;
//   final bool isMine;
//   final bool hide;
//   final bool isLiked;
// }

class ChatUserListModel {
  ChatUserListModel({
    required this.imageUrl,
    required this.isOnline,
    required this.name,
    required this.message,
    required this.dateTime,
    required this.unreadText,
  });
  final String name;
  final String message;
  final String dateTime;
  final int unreadText;
  final bool isOnline;
  final String imageUrl;
}
