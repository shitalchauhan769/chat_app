import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_chat_app/screen/chat/model/chat_model.dart';
import 'package:my_chat_app/screen/profile/model/proflie_model.dart';
import 'package:my_chat_app/utils/helper/auth_helper.dart';

class FireBaseDbHelper {
  static FireBaseDbHelper helper = FireBaseDbHelper._();

  FireBaseDbHelper._();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  String? docId;

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

  Future<void> sendMessege(String senderUid, String receiverUid, ChatModel model) async {


    String? id= await checkChatConversationDoc(senderUid, receiverUid);
    if(id==null)
      {
        DocumentReference reference = await fireStore.collection("Chat").add({"uids": [senderUid, receiverUid]});
         id =reference .id;
      }

    await fireStore.collection("Chat").doc(id).collection("msg").add({
      "msg": model.msg,
      "date": model.dateTime,
      "sendUid": model.senderUid,
    });

  }

  Future<String? > checkChatConversationDoc(String senderUID, String receiverUID) async {
    QuerySnapshot snapshot = await fireStore.collection("Chat").where("uids", isEqualTo: [senderUID, receiverUID]).get();List<DocumentSnapshot> l1 = snapshot.docs;
    if (l1.isEmpty) {
      QuerySnapshot snapshot = await fireStore
          .collection("Chat")
          .where("uids", isEqualTo: [receiverUID, senderUID]).get();
      List<DocumentSnapshot> l2= snapshot.docs;

      if(l2.isEmpty)
        {
          DocumentReference reference = await fireStore.collection("Chat").add({"uids": [senderUID, receiverUID]});
          return reference.id;
        } else {
          DocumentSnapshot sp=l2[0];
          return sp.id;
        }

    } else {
      DocumentSnapshot snapshot =l1[0];
      return snapshot.id;}

  }

  Future<void> getDocId(String senderID, String receiverID) async {
    docId = await checkChatConversationDoc(senderID, receiverID);
  }



  Stream<QuerySnapshot<Map>>? readChat( )  {
  Stream <QuerySnapshot<Map>> snapshot =  fireStore.collection("Chat").doc(docId).collection("meg").orderBy("data",descending: false).snapshots();
  return snapshot;

  }
  
  Future<void> deleteChat(String megId) async {
     await fireStore.collection("Chat").doc(docId).collection("meg").doc(megId).delete();
  }
}
