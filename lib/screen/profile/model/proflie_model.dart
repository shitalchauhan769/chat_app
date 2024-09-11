class ProfileModel
{
  String? email,name,mobile,bio,uid,msg;

  ProfileModel({this.email, this.name, this.mobile, this.bio,this.uid,this.msg});
  factory ProfileModel.mapToModel(Map m1)
  {
    return ProfileModel(bio: m1['bio'],mobile: m1['mobile'],email: m1['email'],name: m1['name'],uid: m1['uid'],msg: m1['msg']);
  }
}