import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/screen/home/controller/home_controller.dart';
import 'package:my_chat_app/utils/app_routes.dart';
import 'package:my_chat_app/utils/helper/fcm_helper.dart';
import 'package:my_chat_app/utils/services/notification_services.dart';
import 'package:my_chat_app/utils/theme.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HomeController controller = Get.put(HomeController());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationMsg.notificationMsg.initNotification();
  tz.initializeTimeZones();
  FcmHelper.helper.initMsg();
  controller.getTheme();
  runApp(
    Obx(
      () => GetMaterialApp(
        theme: controller.theme.value == false?lightTheme:darkTheme,
        debugShowCheckedModeBanner: false,
        routes: appRoutes,
      ),
    ),
  );
}

//Obx(
//       () => GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme:lightTheme,
//         darkTheme: darkTheme,
//         themeMode: controller.themeName.value == "dark"
//             ? ThemeMode.dark
//             : ThemeMode.light,
//         // themeMode: controller.theme =="Light"
//         //     ?ThemeMode.light
//         //     :controller.theme=="Dark"
//         //     ?ThemeMode.dark
//         //     :ThemeMode.system,
//         routes: app_routes,
//       ),
//     ),
