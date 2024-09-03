
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel
{
  String? meg,senderUid;
  Timestamp? dateTime;
  String? docId;

  ChatModel({this.meg, this.senderUid, this.dateTime});
  factory ChatModel.mapToModel(Map m1)
  {
     return ChatModel(senderUid: m1['senderUid'],meg: m1['meg'],dateTime: m1['date']);
  }
}