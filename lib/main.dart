import 'package:empowered/core/build_variants/environment_entry_points.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  StagingEntryPoint();
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  //LocalNotificationService().showNotification(message);
  print('Handling a background message: ${message.messageId}');
}
