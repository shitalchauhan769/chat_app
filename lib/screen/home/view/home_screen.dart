import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_chat_app/screen/home/controller/home_controller.dart';
import 'package:my_chat_app/screen/profile/model/proflie_model.dart';
import 'package:my_chat_app/utils/helper/auth_helper.dart';
import 'package:my_chat_app/utils/helper/shared_helper.dart';
import 'package:my_chat_app/utils/services/notification_services.dart';

import '../../../utils/colors.dart';
import '../../../utils/helper/db_helper.dart';
import '../../user/controller/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  UserController controller = Get.put(UserController());

  @override
  void initState() {
    homeController.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.document_scanner_outlined,color: Colors.white,),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo_camera,color: Colors.white,),
          ),
          PopupMenuButton(

            itemBuilder: (context) => [

              const PopupMenuItem(
                child: Text(" New group"),
              ),
              const PopupMenuItem(
                child: Text("New broadcast"),
              ),
              const PopupMenuItem(
                child: Text("Linked devices"),
              ),
              const PopupMenuItem(
                child: Text("Starred messages"),
              ),
              const PopupMenuItem(
                child: Text("Payments"),
              ),
              const PopupMenuItem(
                child: Text("Setting"),
              ),
            ],
          )
        ],
        title: const Text("WhatsApp",style: TextStyle(color: Colors.white,),),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 90,),
            const Icon(
              Icons.chat,
              color: green,
              size: 100,
            ),
            const SizedBox(height: 50,),
            Card(
              child: ListTile(
                onTap: () {
                  Get.toNamed("/profile");
                },
                title: const Center(child: Text("Profile"),),
                leading: const Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                title: const Center(child: Text("Theme",),),
                leading: Obx(
                  () =>  SizedBox(
                    height: 35,
                    width: 35,
                    child: Switch(value: homeController.theme.value, onChanged: (value) {
                      ShareHelper.helper.setTheme(theme: homeController.theme.value=value);
                      print(homeController.theme.value);
                    },),
                  ),
                ),

              )
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Get.toNamed("/notification");
                },
                title: const Center(child: Text("Notification"),),
                leading: const Icon(Icons.notifications),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Get.toNamed("/login");
                },
                title: const Center(child: Text("logout"),),
                leading: const Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: homeController.chatUser,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            homeController.userList.clear();
            QuerySnapshot? sq = snapshot.data;
            List<QueryDocumentSnapshot> sqList = sq!.docs;

            for (var x in sqList) {
              Map m1 = x.data() as Map;
              List uidList = m1["uids"];
              String receiverID = "";
              if (uidList[0] == AuthHelper.helper.user!.uid) {
                receiverID = uidList[1];
              } else {
                receiverID = uidList[0];
              }
              homeController.getChat(receiverID).then(
                (value) {
                  homeController.userList.add(homeController.model!);
                },
              );
            }

            return Obx(
              () => ListView.builder(
                itemCount: homeController.userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      await FireBaseDbHelper.helper.getDocId(
                          AuthHelper.helper.user!.uid,
                          homeController.userList[index].uid!);
                      Get.toNamed("/chat",
                          arguments: homeController.userList[index]);
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade400,
                      child: Text(homeController.userList[index].name![0]),
                    ),
                    title: Text("${homeController.userList[index].name}"),
                    subtitle: Text("${homeController.userList[index].mobile}"),
                    trailing: Text("${""}"),
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade400,
        onPressed: () {
          Get.toNamed("/user");
        },
        child: const Icon(
          Icons.person,
        ),
      ),
    );
  }
}
