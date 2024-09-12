import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_chat_app/screen/login/controller/login_controller.dart';
import 'package:my_chat_app/screen/profile/model/proflie_model.dart';
import 'package:my_chat_app/utils/helper/auth_helper.dart';
import 'package:my_chat_app/utils/helper/db_helper.dart';

import '../../home/controller/home_controller.dart';

class ProflieScreen extends StatefulWidget {
  const ProflieScreen({super.key});

  @override
  State<ProflieScreen> createState() => _ProflieScreenState();
}

class _ProflieScreenState extends State<ProflieScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtBio = TextEditingController();
  LoginController controller=Get.put(LoginController());
  HomeController homeController = Get.put(HomeController());
  GlobalKey <FormState> fromKey=GlobalKey<FormState>();

  @override
  void initState() {
    getData();
    super.initState();

  }

  Future<void> getData() async {
   await controller.getDataSingIn();
    if(controller.profileModel !=null)
      {
        txtName.text=controller.profileModel!.name!;
        txtEmail.text=controller.profileModel!.email!;
        txtMobile.text=controller.profileModel!.mobile!;
        txtBio.text=controller.profileModel!.bio!;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ProfileScreen",),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green.shade200),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.photo_camera,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: txtName,
                  decoration: const InputDecoration(
                    label: Text("Name"),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_rounded),
                  ),
                  validator: (value) {
                    if(value!.isEmpty)
                      {
                        return  "Please enter Name";
                      }
                    return null;

                  },

                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: txtEmail,
                  decoration: const InputDecoration(
                    label: Text("Email"),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if(value!.isEmpty)
                      {
                        return "Please enter Email";
                      }
                    else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value))
                      {
                        return "Please enter Email";
                      }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: txtMobile,
                  decoration: const InputDecoration(
                    label: Text("Mobile"),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return  "Please enter Mobile";
                    }
                    return null;

                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: txtBio,
                  decoration: const InputDecoration(
                    label: Text("Bio"),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.perm_contact_calendar_sharp),
                  ),
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return  "Please enter Bio";
                    }
                    return null;

                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if(fromKey.currentState!.validate())
                      {
                        ProfileModel model= ProfileModel(
                            name: txtName.text,
                            email: txtEmail.text,
                            mobile: txtMobile.text,
                            bio: txtBio.text,
                            uid: AuthHelper.helper.user!.uid);
                        await FireBaseDbHelper.helper.setProfile(model);
                        Get.toNamed("/dash");
                        Get.snackbar("profile", "profile Success");
                      }
                  },
                  child:  const Text("Submit",),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
