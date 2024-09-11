import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/screen/chat/controller/chat_controller.dart';
import 'package:my_chat_app/screen/chat/model/chat_model.dart';
import 'package:my_chat_app/screen/home/controller/home_controller.dart';
import 'package:my_chat_app/screen/profile/model/proflie_model.dart';
import 'package:my_chat_app/utils/colors.dart';
import 'package:my_chat_app/utils/helper/auth_helper.dart';
import 'package:my_chat_app/utils/helper/db_helper.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ProfileModel model = Get.arguments;
  TextEditingController txtSend = TextEditingController();
  ChatController controller = Get.put(ChatController());
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    controller.getChatData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.video_call_outlined,
              size: 35,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
              size: 25,
              color: Colors.white,
            ),
          ),
          PopupMenuButton(
            color: Colors.white,
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Group info"),
              ),
              const PopupMenuItem(
                child: Text("Group media"),
              ),
              const PopupMenuItem(
                child: Text("Search"),
              ),
              const PopupMenuItem(
                child: Text("Mute Notifications"),
              ),
              const PopupMenuItem(
                child: Text("Disappearing messages"),
              ),
              const PopupMenuItem(
                child: Text("Wallpaper"),
              ),
              const PopupMenuItem(
                child: Text("More"),
              ),
            ],
          ),
        ],
        leading: Container(
          // padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(7),
          height: 100,
          width: 100,
          child: CircleAvatar(
            backgroundColor: Colors.green.shade200,
            child: Text(
              model.name![0],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: homeController.theme.value == true
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
        ),
        title: Text(
          "${model.name}",
          style: TextStyle(
            color: homeController.theme.value == true
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          homeController.theme.value == true
              ? Image(
                  image:
                      const AssetImage("assets/image/whatsapp wallpaper2.jpg"),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  fit: BoxFit.cover,
                )
              : Image(
                  image:
                      const AssetImage("assets/image/whatsapp wallpaper.jpg"),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  fit: BoxFit.cover,
                ),
          Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: controller.dataSnap,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.hasError}");
                    } else if (snapshot.hasData) {
                      List<ChatModel> chatList = [];
                      QuerySnapshot? snap = snapshot.data;
                      for (var x in snap!.docs) {
                        Map m1 = x.data() as Map;
                        ChatModel c1 = ChatModel.mapToModel(m1);
                        c1.docId = x.id;
                        chatList.add(c1);
                      }
                      return ListView.builder(
                        itemCount: chatList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(5),
                            width: 200,
                            height: 60,
                            alignment: chatList[index].senderUid !=
                                    AuthHelper.helper.user!.uid
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: InkWell(
                              onLongPress: () {
                                if (chatList[index].senderUid ==
                                    AuthHelper.helper.user!.uid) {
                                  Get.defaultDialog(
                                    title: "you went to delete messege",
                                    actions: [
                                      TextButton(
                                        onPressed: () async {
                                          await FireBaseDbHelper.helper
                                              .deleteChat(
                                                  chatList[index].docId!);
                                          Get.back();
                                        },
                                        child: const Text("Delete"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text("Cancel"),
                                      ),
                                    ],
                                  );
                                }
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.50,
                                height: 200,
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: chatList[index].senderUid !=
                                          AuthHelper.helper.user!.uid
                                      ? Colors.white
                                      : Colors.green.shade300,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "${chatList[index].msg}",
                                      style: TextStyle(
                                        color:
                                            homeController.theme.value == true
                                                ? Colors.black
                                                : Colors.white,
                                      ),
                                    ),
                                    Expanded(
                                        child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "${chatList[index].dateTime!.toDate().hour}:${chatList[index].dateTime!.toDate().minute}",
                                        style: TextStyle(
                                          color:
                                              homeController.theme.value == true
                                                  ? Colors.black
                                                  : Colors.white,
                                        ),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: homeController.theme.value == false
                    ? Colors.black
                    : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(
                              color: homeController.theme.value == true
                                  ? Colors.black
                                  : Colors.white70,
                            ),
                            controller: txtSend,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                wordSpacing: 1,
                                color: homeController.theme.value == true
                                    ? Colors.black
                                    : Colors.white70,
                              ),
                              hintText: " Write Messenger",
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ChatModel m1 = ChatModel(
                              dateTime: Timestamp.now(),
                              msg: txtSend.text,
                              senderUid: AuthHelper.helper.user!.uid);
                          FireBaseDbHelper.helper.sendMessege(
                              AuthHelper.helper.user!.uid, model.uid!, m1);
                        },
                        icon: Icon(
                          Icons.send,
                          color: homeController.theme.value == false
                              ? Colors.white70
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
