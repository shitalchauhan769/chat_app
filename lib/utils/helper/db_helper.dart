import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_chat_app/screen/profile/model/proflie_model.dart';
import 'package:my_chat_app/utils/helper/auth_helper.dart';

class FireBaseDbHelper {
  static FireBaseDbHelper helper = FireBaseDbHelper._();

  FireBaseDbHelper._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void setProfile(ProfileModel profileModel) {
    firestore.collection("chat").doc(AuthHelper.helper.user!.uid).set({
      "name": profileModel.name,
      "email": profileModel.email,
      "mobile": profileModel.mobile,
      "bio": profileModel.bio
    });
  }
}
