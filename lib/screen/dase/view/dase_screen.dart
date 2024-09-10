import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_chat_app/screen/call/view/call_screen.dart';
import 'package:my_chat_app/screen/communities/view/communities_screen.dart';
import 'package:my_chat_app/screen/home/view/home_screen.dart';
import 'package:my_chat_app/screen/updates/view/updates_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../home/controller/home_controller.dart';
import '../../user/controller/user_controller.dart';

class DaseScreen extends StatefulWidget {
  const DaseScreen({super.key});

  @override
  State<DaseScreen> createState() => _DaseScreenState();
}

class _DaseScreenState extends State<DaseScreen> {
  HomeController homeController = Get.put(HomeController());
  UserController controller = Get.put(UserController());

  @override
  void initState() {
    homeController.getUser();
    super.initState();
  }
  List screenList=[
    HomeScreen(),
    UpdatesScreen(),
    CommunitiesScreen(),
    CallScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => screenList[homeController.selctedBottom.value]
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: homeController.selctedBottom.value,
        items:  [
          SalomonBottomBarItem(
            icon: Icon(Icons.chat,color: homeController.themeName.value =="light"?Colors.black:Colors.white,),
            title: const Text("Chat"),
            selectedColor: Colors.orange,
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.update,color: homeController.themeName.value =="light"?Colors.black:Colors.white,),
            title: const Text("Updates"),
            selectedColor: Colors.orange,
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.comment,color: homeController.themeName.value =="light"?Colors.black:Colors.white,),
            title: const Text("Communities"),
            selectedColor: Colors.orange,
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.phone,color: homeController.themeName.value =="light"?Colors.black:Colors.white,),
            title: const Text("Call"),
            selectedColor: Colors.orange,
          ),

        ],
        onTap: (value) {
          homeController.selctedBottom.value=value;
          print(homeController.selctedBottom.value);
        },
      ),
    );
  }
}
