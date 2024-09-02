import 'package:get/get.dart';
import 'package:my_chat_app/screen/chat/model/chat_model.dart';
import 'package:my_chat_app/utils/helper/db_helper.dart';

class ChatController extends GetxController
{
  RxList<ChatModel>chatList=<ChatModel>[].obs;
  void redsData(String senderID, String receiverID)
  {
    chatList.value=FireBaseDbHelper.helper.readCha(senderID, receiverID) as List<ChatModel>;
  }
}