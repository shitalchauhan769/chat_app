import 'package:flutter/material.dart';
import 'package:my_chat_app/screen/home/view/home_screen.dart';
import 'package:my_chat_app/screen/login/view/login_screen.dart';
import 'package:my_chat_app/screen/login/view/signup_screen.dart';
import 'package:my_chat_app/screen/splash/view/splash_screen.dart';

import '../screen/profile/view/proflie_screen.dart';

Map<String,WidgetBuilder>appRoutes={
  '/':(c1)=>const SplashScreen(),
  '/login':(c1)=>const LoginScreen(),
  '/signup':(c1)=>const SignupScreen(),
  '/home':(c1)=>const HomeScreen(),
  '/profile':(c1)=> const ProflieScreen(),

};