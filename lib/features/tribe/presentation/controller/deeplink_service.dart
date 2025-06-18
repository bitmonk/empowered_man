// import 'package:get/get.dart';
// import 'dart:async';


// // DeepLinkService to handle incoming deep links
// class DeepLinkService {
//   StreamSubscription? _sub;

//   void init() async {
//     try {
//       // Handle initial link (when app is opened via link)
//       final initialLink = await getInitialLink();
//       if (initialLink != null) {
//         _handleDeepLink(initialLink);
//       }

//       // Listen for incoming links (when app is already running)
//       _sub = linkStream.listen((String? link) {
//         if (link != null) {
//           _handleDeepLink(link);
//         }
//       }, onError: (err) {
//         print('Error handling deep link: $err');
//       });
//     } catch (e) {
//       print('Error initializing deep links: $e');
//     }
//   }

//   void _handleDeepLink(String link) {
//     if (link.contains('/post/')) {
//       final postId = link.split('/post/').last;
//       // Navigate to post detail screen
//       Get.toNamed('/postDetail', arguments: {'postId': postId});
//     }
//   }

//   void dispose() {
//     _sub?.cancel();
//   }
// }