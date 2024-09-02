
class ChatModel
{
  String? meg,senderUid;
  DateTime? dateTime;

  ChatModel({this.meg, this.senderUid, this.dateTime});
  factory ChatModel.mapToModel(Map m1)
  {
     return ChatModel(senderUid: m1['senderUid'],meg: m1['meg'],dateTime: m1['date']);
  }
}