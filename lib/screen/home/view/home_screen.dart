import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_chat_app/screen/home/controller/home_controller.dart';
import 'package:my_chat_app/screen/profile/model/proflie_model.dart';
import 'package:my_chat_app/utils/helper/auth_helper.dart';
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
  UserController controller=Get.put(UserController());

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
            icon: const Icon(Icons.document_scanner_outlined),
          ),
          IconButton(
            onPressed: () {
              NotificationMsg.notificationMsg.showSimpleNotification();
            },
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              NotificationMsg.notificationMsg.showScheduleNotification();
            },
            icon: const Icon(Icons.schedule),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo_camera),
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
        title: const Text("WhatsApp"),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed("/profile");
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(fontSize: 15),
                    ),
                    Icon(
                      Icons.person_rounded,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  AuthHelper.helper.logOut();
                  Get.toNamed("/login");
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SigningLogout",
                      style: TextStyle(fontSize: 15),
                    ),
                    Icon(Icons.logout),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body:  StreamBuilder(
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
                () =>  ListView.builder(
                    itemCount: homeController.userList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () async {
                          await  FireBaseDbHelper.helper.getDocId(AuthHelper.helper.user!.uid, homeController.userList[index].uid!);
                          Get.toNamed("/chat",arguments: homeController.userList[index]);
                        },
                        leading: CircleAvatar(
                          backgroundColor: green,
                          child: Text(homeController.userList[index].name![0]),
                        ),
                        title: Text("${homeController.userList[index].name}"),
                        subtitle: Text("${homeController.userList[index].mobile}"),
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
        onPressed: () {
          Get.toNamed("/user");
        },
        child: const Icon(Icons.person),
      ),
    );
  }
}
