import 'package:get/get.dart';
import 'package:my_chat_app/utils/helper/db_helper.dart';

class ChatController extends GetxController
{

  void redsData(String senderID, String receiverID)
  {
       FireBaseDbHelper.helper.readChat(senderID, receiverID);
  }
}