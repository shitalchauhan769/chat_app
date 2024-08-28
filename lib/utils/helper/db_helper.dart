import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_chat_app/screen/profile/model/proflie_model.dart';
import 'package:my_chat_app/utils/helper/auth_helper.dart';

class FireBaseDbHelper {
  static FireBaseDbHelper helper = FireBaseDbHelper._();

  FireBaseDbHelper._();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

 Future <void> setProfile(ProfileModel profileModel) async {
   await fireStore.collection("Chat").doc(AuthHelper.helper.user!.uid).set({
      "name": profileModel.name,
      "email": profileModel.email,
      "mobile": profileModel.mobile,
      "bio": profileModel.bio
    });
  }

  Future<ProfileModel ?> grtSingInProfile()
  async {
   DocumentSnapshot docData   =await fireStore.collection("Chat").doc(AuthHelper.helper.user!.uid).get();
   if(docData.exists)
     {
       Map m1 = docData.data() as Map;
       ProfileModel model =ProfileModel.mapToModel(m1);
       return model;
     }
   else
     {
       return null;
     }
  }
}
