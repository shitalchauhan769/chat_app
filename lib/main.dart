import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/utils/app_routes.dart';
import 'package:my_chat_app/utils/colors.dart';
import 'package:my_chat_app/utils/helper/fcm_helper.dart';
import 'package:my_chat_app/utils/services/notification_services.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationMsg.notificationMsg.initNotification();
  tz.initializeTimeZones();
  FcmHelper.helper.initMsg();
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(color: green),

      ),
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
    ),
  );
}
