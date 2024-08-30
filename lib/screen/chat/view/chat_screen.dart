import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/screen/profile/model/proflie_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ProfileModel model=Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(5),
          height: 120,
          width: 120,
          child: CircleAvatar(
            child: Text(model.name![0]),
          ),
        ),
        title:  Text("${model.name}"),
      ),
    );
  }
}
