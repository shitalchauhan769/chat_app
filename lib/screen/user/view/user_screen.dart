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
  UserController controller=Get.put(UserController());
  @override
  void initState() {
    controller.getUserAll();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("user"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.profileList.length,
          itemBuilder: (context, index) {
            return  ListTile(
              onTap: () {
                FireBaseDbHelper.helper.getDocId(AuthHelper.helper.user!.uid, controller.profileList[index].uid!);
                Get.toNamed("/chat",arguments: controller.profileList[index]);
              },
              leading: CircleAvatar(
                backgroundColor: green,
                child: Text(controller.profileList[index].name![0]),
              ),
              title:  Text("${controller.profileList[index].name}"),
              subtitle:  Text("${controller.profileList[index].mobile}"),
            );
          },
        ),
      ),
    );
  }
}
