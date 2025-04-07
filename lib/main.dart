import 'dart:async';

import 'package:empowered/core/build_variants/environment_entry_points.dart';
import 'package:empowered/flavors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

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


// flutter run --debug --flavor=api
// flutter run --release --flavor=api
// flutter build apk --release --flavor api
// flutter build appbundle --release --flavor api
// flutter build appbundle --build-name=2.1.5 --build-number=20 --release --flavor api