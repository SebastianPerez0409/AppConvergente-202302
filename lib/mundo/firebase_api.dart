/* import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print('title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('body: ${message.data}');
  }
} */
