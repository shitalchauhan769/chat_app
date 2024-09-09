import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:my_chat_app/utils/services/notification_services.dart';

class FcmHelper
{
  static FcmHelper helper = FcmHelper._();

  FcmHelper._();
  FirebaseMessaging firebaseMessaging=FirebaseMessaging.instance;
  String? token;

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

  Future<void> getToken()
  async {
    token = await FirebaseMessaging.instance.getToken();
    print("================token=$token");
  }
  void receiveMsg() {
    getToken();
    FirebaseMessaging.onMessage.listen((event) {
      if(event.notification!=null)
        {
          String? title= event.notification!.title;
          String? body=event.notification!.body;
          String? image=event.notification!.android!.imageUrl;

          if(title!=null&&body!=null&&image!=null)
            {
              NotificationMsg.notificationMsg.showSimpleNotification(title,body);
            }
          else if(title!=null&&body!=null&&image!=null)
            {
              NotificationMsg.notificationMsg.showBigPictureNotification(title, body, image);
            }
        }

  },);

  }
}