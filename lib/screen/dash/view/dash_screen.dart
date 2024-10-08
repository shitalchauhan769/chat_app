import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_chat_app/screen/call/view/call_screen.dart';
import 'package:my_chat_app/screen/communities/view/communities_screen.dart';
import 'package:my_chat_app/screen/home/view/home_screen.dart';
import 'package:my_chat_app/screen/updates/view/updates_screen.dart';
import 'package:my_chat_app/utils/colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../home/controller/home_controller.dart';
import '../../user/controller/user_controller.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  HomeController homeController = Get.put(HomeController());
  UserController controller = Get.put(UserController());

  @override
  void initState() {
    homeController.getUser();
    super.initState();
  }
  List screenList=[
    const HomeScreen(),
    const UpdatesScreen(),
    const CommunitiesScreen(),
    const CallScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx(
        () => screenList[homeController.selctedBottom.value]
      ),
      bottomNavigationBar: Obx(() =>
         SalomonBottomBar(
          currentIndex: homeController.selctedBottom.value,
          onTap: (value) {
            homeController.selctedBottom.value = value;
            // print(homeController.selctedBottom.value);
          },

          items:  [
            SalomonBottomBarItem(
              icon:  Obx(() =>   Icon(Icons.chat,color: homeController.theme.value==false?Colors.black:Colors.white,)),
              title: const Text("Chat"),
              selectedColor: green
            ),

            SalomonBottomBarItem(
              icon:  Obx(() => Icon(Icons.update,color: homeController.theme.value==false?Colors.black:Colors.white,)),
              title: const Text("Updates"),
              selectedColor:  green
            ),

            SalomonBottomBarItem(
              icon:  Obx(() =>  Icon(Icons.comment,color: homeController.theme.value==false?Colors.black:Colors.white,)),
              title: const Text("Communities"),
              selectedColor:  green
            ),

            SalomonBottomBarItem(
              icon:  Obx(() =>  Icon(Icons.phone,color: homeController.theme.value==false?Colors.black:Colors.white,)),
              title: const Text("Call"),
              selectedColor:   green
            ),

          ],

        ),
      ),
    );
  }
}
