import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/utils/helper/db_helper.dart';

import '../../profile/model/proflie_model.dart';

class HomeController extends GetxController
{
  Stream<QuerySnapshot>? chatUser;
  RxList<ProfileModel>userList=<ProfileModel>[].obs;
  ProfileModel? model;


  void getUser() {
    chatUser = FireBaseDbHelper.helper.getMyChat();
  }
  Future<void> getChat(String receiverID) async {
    model= await FireBaseDbHelper.helper.userChat(receiverID);
  }
}