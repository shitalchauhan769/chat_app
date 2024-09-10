import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../utils/colors.dart';
import '../../../utils/helper/auth_helper.dart';
import '../../../utils/helper/db_helper.dart';
import '../../user/controller/user_controller.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
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
        title: const Text("Call"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.document_scanner_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo_camera),
          ),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           const Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(" Favourite",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
               SizedBox(height: 10,),
               ListTile(
                 leading: CircleAvatar(
                   backgroundColor: green,
                   child: Icon(Icons.favorite),
                 ),
                 title: Text("Add favourite"),
               ),
               SizedBox(height: 10,),
               Text(" Recent",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
             ],
           ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.profileList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () async {
                        await FireBaseDbHelper.helper.getDocId(
                            AuthHelper.helper.user!.uid,
                            controller.profileList[index].uid!);
                        Get.toNamed("/chat",
                            arguments: controller.profileList[index]);
                      },
                      leading: CircleAvatar(
                        backgroundColor: green,
                        child: Text(controller.profileList[index].name![0]),
                      ),
                      title: Text("${controller.profileList[index].name}"),
                      subtitle: Text("${controller.profileList[index].mobile}"),
                      trailing: const Icon(Icons.video_call),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
