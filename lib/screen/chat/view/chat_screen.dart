import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/screen/chat/controller/chat_controller.dart';
import 'package:my_chat_app/screen/chat/model/chat_model.dart';
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
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
              size: 25,
            ),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Group info"),
              ),
              const PopupMenuItem(
                child: Text("Setting"),
              ),
            ],
          )
        ],
        leading: Container(
          // padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(7),
          height: 100,
          width: 100,
          child: CircleAvatar(
            backgroundColor: const Color(0xff4bce97),
            child: Text(
              model.name![0],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        title: Text("${model.name}"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
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
                return Expanded(
                  child: ListView.builder(
                    itemCount: chatList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        width: 200,
                        height: 50,
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
                                          .deleteChat(chatList[index].docId!);
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
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("${chatList[index].msg}"),
                          ),
                        ),
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
          Card(
            margin: const EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: txtSend,
                      decoration: const InputDecoration(
                        hintText: " Write Messenger",
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
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
