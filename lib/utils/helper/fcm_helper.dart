import 'package:firebase_messaging/firebase_messaging.dart';

class FcmHelper
{
  static FcmHelper helper = FcmHelper._();

  FcmHelper._();
  FirebaseMessaging firebaseMessaging=FirebaseMessaging.instance;

  Future<void> initMsg()
  async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }
  void receiveMsg() {
  //   FirebaseMessaging.onMessage.listen((event) {
  //
  // },)

  }
}