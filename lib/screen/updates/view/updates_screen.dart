import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/colors.dart';
import '../../../utils/helper/auth_helper.dart';
import '../../../utils/helper/db_helper.dart';
import '../../home/controller/home_controller.dart';
import '../../user/controller/user_controller.dart';

class UpdatesScreen extends StatefulWidget {
  const UpdatesScreen({super.key});

  @override
  State<UpdatesScreen> createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
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
        title: const Text("Updates",style: TextStyle(color: Colors.white,),),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.document_scanner_outlined,color: Colors.white,),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo_camera,color: Colors.white,),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded,color: Colors.white,),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text(" Status privacy"),
              ),
              const PopupMenuItem(
                child: Text("Create channel"),
              ),
              const PopupMenuItem(
                child: Text("Setting"),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
           const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "Status",
                  style: TextStyle(// color: homeController.themeName.value == "dark"?Colors.white:Colors.black,
                      fontSize: 20,
                        fontWeight: FontWeight.bold),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: green,
                    child: Text(""),
                  ),
                  title: Text("My Status"),
                  subtitle: Text("Tap to add status updates"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Recent Updates",
                    style: TextStyle( fontSize: 15),),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: homeController.userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: green,
                      child: Text(homeController.userList[index].name![0]),
                    ),
                    title: Text("${homeController.userList[index].name}"),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
