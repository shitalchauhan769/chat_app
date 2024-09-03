import 'package:get/get.dart';
import 'package:my_chat_app/utils/helper/db_helper.dart';

class ChatController extends GetxController
{
  Stream? dataSnap;
  void getChatData()
  {
    dataSnap= FireBaseDbHelper.helper.readChat();
  }
}