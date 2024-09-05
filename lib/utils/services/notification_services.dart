import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationMsg {
  static NotificationMsg notificationMsg = NotificationMsg._();

  NotificationMsg._();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  String? timeZone;

  void initNotification() {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings("logo");

    DarwinInitializationSettings darwinInitializationSettings =
        const DarwinInitializationSettings();

    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: darwinInitializationSettings);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  void showSimpleNotification() {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("1", "simple",
            importance: Importance.max, priority: Priority.high);
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
    flutterLocalNotificationsPlugin.show(
        1, "hello", "Simple", notificationDetails);
  }

  void showScheduleNotification() {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("3", "Schedule");
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
    flutterLocalNotificationsPlugin.zonedSchedule(
        2,
        "Schedule",
        "Schedule Notification is lets ",
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  void showBigNotification() {}

  void showMediaStyleNotification() {}
}
