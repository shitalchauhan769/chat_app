import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/screen/user/controller/user_controller.dart';
import 'package:my_chat_app/utils/colors.dart';
import 'package:my_chat_app/utils/helper/auth_helper.dart';
import 'package:my_chat_app/utils/helper/db_helper.dart';

class AllUserScreen extends StatefulWidget {
  const AllUserScreen({super.key});

  @override
  State<AllUserScreen> createState() => _AllUserScreenState();
}

class _AllUserScreenState extends State<AllUserScreen> {
  UserController controller = Get.put(UserController());

  @override
  void initState() {
    controller.getUserAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select contact"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Invite a friend"),
              ),
              const PopupMenuItem(
                child: Text("Contacts"),
              ),
              const PopupMenuItem(
                child: Text("Refresh"),
              ),
              const PopupMenuItem(
                child: Text("Help"),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: green,
                  child: Icon(Icons.group_add),
                ),
                title: Text("New group"),

              ),
              SizedBox(height: 10,),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: green,
                  child: Icon(Icons.person_add_alt_1),
                ),
                title: Text("New contact"),

              ),
              SizedBox(height: 10,),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: green,
                  child: Icon(Icons.groups),
                ),
                title: Text("New community"),

              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Contact on WhatsApp"),
              ),
              SizedBox(height: 10,),
            ],
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: controller.profileList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      await FireBaseDbHelper.helper.getDocId(
                          AuthHelper.helper.user!.uid,
                          controller.profileList[index].uid!);
                      Get.toNamed("/chat", arguments: controller.profileList[index]);
                    },
                    leading: CircleAvatar(
                      backgroundColor: green,
                      child: Text(controller.profileList[index].name![0]),
                    ),
                    title: Text("${controller.profileList[index].name}"),
                    subtitle: Text("${controller.profileList[index].mobile}"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
