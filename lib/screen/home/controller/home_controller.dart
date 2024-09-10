import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/utils/helper/db_helper.dart';

import '../../../utils/helper/shared_helper.dart';
import '../../profile/model/proflie_model.dart';

class HomeController extends GetxController
{
  Stream<QuerySnapshot>? chatUser;
  RxList<ProfileModel>userList=<ProfileModel>[].obs;
  ProfileModel? model;
  String selctedSegmented="chat";
  RxInt selctedBottom = 0.obs;
  RxString themeName = "system".obs;
  String? theme;


  void getUser() {
    chatUser = FireBaseDbHelper.helper.getMyChat();
  }

  Future<void> getChat(String receiverID) async {
    model= await FireBaseDbHelper.helper.userChat(receiverID);
  }

  Future<void> setTheme(String theme) async {
    ShareHelper.helper.setTheme(theme: theme);
    await getTheme();
  }

  Future<void> getTheme() async {
    String? theme = await ShareHelper.helper.getTheme();
    themeName.value = theme?? "light";

  }

  void changeTheme() {
    theme!=theme;
  }

}