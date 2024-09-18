import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/screen/chat/model/chat_model.dart';
import 'package:my_chat_app/utils/helper/db_helper.dart';

import '../../../utils/helper/shared_helper.dart';
import '../../profile/model/proflie_model.dart';

class HomeController extends GetxController
{
  Stream<QuerySnapshot>? chatUser;
  RxList<ProfileModel>userList=<ProfileModel>[].obs;
  ProfileModel? model;
  RxString selctedSegmented="chat".obs;
  RxInt selctedBottom = 0.obs;
  RxBool theme = false.obs;
  RxList<ChatModel>chatList=<ChatModel>[].obs;
  RxBool isHidePassword = true.obs;


  void getUser() {
    chatUser = FireBaseDbHelper.helper.getMyChat();
  }

  Future<void> getChat(String receiverID) async {
    model= await FireBaseDbHelper.helper.userChat(receiverID);
  }

  Future<void> getTheme() async {

    bool? themeName=await ShareHelper.helper.getTheme();
    theme.value=themeName??false;

  }

  void hidePassword()
  {
    isHidePassword.value=!isHidePassword.value;
  }



}