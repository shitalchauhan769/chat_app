import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_chat_app/screen/chat/model/chat_model.dart';
import 'package:my_chat_app/screen/profile/model/proflie_model.dart';
import 'package:my_chat_app/utils/helper/auth_helper.dart';

class FireBaseDbHelper {
  static FireBaseDbHelper helper = FireBaseDbHelper._();

  FireBaseDbHelper._();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<void> setProfile(ProfileModel profileModel) async {
    await fireStore.collection("User").doc(AuthHelper.helper.user!.uid).set({
      "name": profileModel.name,
      "email": profileModel.email,
      "mobile": profileModel.mobile,
      "bio": profileModel.bio,
      "uid": AuthHelper.helper.user!.uid
    });
  }

  Future<ProfileModel?> grtSingInProfile() async {
    DocumentSnapshot docData = await fireStore
        .collection("User")
        .doc(AuthHelper.helper.user!.uid)
        .get();
    if (docData.exists) {
      Map m1 = docData.data() as Map;
      ProfileModel model = ProfileModel.mapToModel(m1);
      return model;
    } else {
      return null;
    }
  }

  Future<List<ProfileModel>> getUsers() async {
    List<ProfileModel> profileList = [];
    QuerySnapshot querySnapshot = await fireStore
        .collection("User")
        .where("uid", isNotEqualTo: AuthHelper.helper.user!.uid)
        .get();
    List<QueryDocumentSnapshot> docList = querySnapshot.docs;
    for (var x in docList) {
      Map m1 = x.data() as Map;
      ProfileModel model = ProfileModel.mapToModel(m1);
      String docId = x.id;
      model.uid = docId;
      profileList.add(model);
    }
    return profileList;
  }

  Future<void> sendMessege(
      String senderUid, String receiverUid, ChatModel model) async {
    DocumentReference reference = await fireStore.collection("Chat").add({
      "uids": [senderUid, receiverUid]
    });
    await fireStore.collection("Chat").doc(reference.id).collection("msg").add({
      "msg": model.meg,
      "date": model.dateTime,
      "sendUid": model.senderUid,
    });
  }

  Future<void> checkChatConversationDoc(
      String senderUID, String receiverUID) async {
    QuerySnapshot snapshot = await fireStore
        .collection("Chat")
        .where("uids", arrayContainsAny: [senderUID, receiverUID]).get();
    List<DocumentSnapshot> l1 = snapshot.docs;

    if (l1.isEmpty) {
      QuerySnapshot snapshot = await fireStore
          .collection("Chat")
          .where("uids", arrayContainsAny: [receiverUID, senderUID]).get();
      List<DocumentSnapshot> l2= snapshot.docs;
      if(l2.isEmpty)
        {
          print("not any Conversation===================");
        }
      else
        {
          print("yes  Conversation===================${l1.length}");
        }
    }
    else
    {
      print("yes  Conversation===================${l1.length}");
    }
  }
}
