
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel
{
  String? msg,senderUid;
  Timestamp? dateTime;
  String? docId;

  ChatModel({this.msg, this.senderUid, this.dateTime});
  factory ChatModel.mapToModel(Map m1)
  {
     return ChatModel(senderUid: m1['senderUid'],msg: m1['msg'],dateTime: m1['date']);
  }
}