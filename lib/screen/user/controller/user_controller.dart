import 'package:get/get.dart';
import 'package:my_chat_app/screen/profile/model/proflie_model.dart';
import 'package:my_chat_app/utils/helper/db_helper.dart';

class UserController extends GetxController
{
  RxList<ProfileModel>profileList =<ProfileModel>[].obs;

  Future<void> getUserAll() async {
    profileList.value= await FireBaseDbHelper.helper.getUsers();
  }
}