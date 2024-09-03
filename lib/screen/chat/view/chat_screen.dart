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
  ChatController controller=Get.put(ChatController());
  @override
  void initState() {
    // FireBaseDbHelper.helper.readCha(txtSend.)
    // controller.redsData(txtSend.text, );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            
          }, icon: const Icon(Icons.video_call_outlined,size: 35,),),
          IconButton(onPressed: () {

          }, icon: const Icon(Icons.call,size: 25,),),
          PopupMenuButton(itemBuilder: (context) => [
            const PopupMenuItem(child: Text("Group info"),),
            const PopupMenuItem(child: Text("Setting"),),
          ],)
        ],
        leading: Container(
          // padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(7),
          height: 100,
          width: 100,
          child: CircleAvatar(

            backgroundColor: const Color(0xff4bce97),
            child: Text(model.name![0],style: const TextStyle(fontWeight: FontWeight.bold),),
          ),
        ),
        title: Text("${model.name}"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  margin: const EdgeInsets.all(5),
                  height: 60,
                  alignment: index % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    // margin: const EdgeInsets.all(5),
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * 0.50,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    
                    child: const Text("hello"),
                  ),
                );
              },
              itemCount: 20,
            ),
          ),
          Card(
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
                          dateTime: DateTime.now(),
                          meg: txtSend.text,
                          senderUid: AuthHelper.helper.user!.uid);
                      FireBaseDbHelper.helper.sendMessege(
                          AuthHelper.helper.user!.uid, model.uid!, m1);
                      // FireBaseDbHelper.helper.checkChatConversationDoc(, receiverUID);
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
