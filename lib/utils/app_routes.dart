import 'package:flutter/material.dart';
import 'package:my_chat_app/screen/chat/view/chat_screen.dart';
import 'package:my_chat_app/screen/communities/view/communities_screen.dart';

import 'package:my_chat_app/screen/home/view/home_screen.dart';
import 'package:my_chat_app/screen/login/view/login_screen.dart';
import 'package:my_chat_app/screen/login/view/signup_screen.dart';
import 'package:my_chat_app/screen/splash/view/splash_screen.dart';
import 'package:my_chat_app/screen/updates/view/updates_screen.dart';
import 'package:my_chat_app/screen/user/view/user_screen.dart';
import '../screen/dash/view/dash_screen.dart';
import '../screen/profile/view/proflie_screen.dart';

Map<String,WidgetBuilder>appRoutes={
  '/':(c1)=>const SplashScreen(),
  '/login':(c1)=>const LoginScreen(),
  '/signup':(c1)=>const SignupScreen(),
  '/home':(c1)=>const HomeScreen(),
  '/profile':(c1)=> const ProflieScreen(),
  '/user':(c1)=> const AllUserScreen(),
  '/chat':(c1)=> const ChatScreen(),
  '/updates':(c1)=> const UpdatesScreen(),
  '/communities':(c1)=> const CommunitiesScreen(),
  '/dash':(c1)=> const DashScreen(),

};