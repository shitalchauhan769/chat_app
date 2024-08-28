import 'package:get/get.dart';
import 'package:my_chat_app/screen/profile/model/proflie_model.dart';
import 'package:my_chat_app/utils/helper/db_helper.dart';

class LoginController extends GetxController
{
  ProfileModel? profileModel;

  Future<void> getDataSingIn() async {
    profileModel = await FireBaseDbHelper.helper.grtSingInProfile();
  }
}