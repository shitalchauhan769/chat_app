import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/utils/app_routes.dart';
import 'package:my_chat_app/utils/colors.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
//https://jsonplaceholder.typicode.com/posts