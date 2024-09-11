import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_chat_app/utils/colors.dart';
import 'package:my_chat_app/utils/helper/auth_helper.dart';

import '../../home/controller/home_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          homeController.themeName.value == "dark"
              ? Image(
            image:
            const AssetImage("assets/image/whatsapp wallpaper2.jpg"),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            fit: BoxFit.cover,
          )
              : Image(
            image:
            const AssetImage("assets/image/whatsapp wallpaper.jpg"),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.chat,
                  color: green,
                  size: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "My Chat App",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: green

                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Signup",
                  style: TextStyle(
                      fontSize: 20,

                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: txtEmail,
                  decoration: const InputDecoration(
                    label: Text(
                      "Email",
                    ),
                    border: OutlineInputBorder(),
                  ),

                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: txtPassword,
                  decoration: const InputDecoration(
                    label: Text(
                      "Password",
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String mag = await AuthHelper.helper.signUpEmailWithPassword(txtEmail.text, txtPassword.text);
                    if (mag == "Success") {
                      Get.snackbar("Successful", "My ChatApp");
                      Get.offAllNamed("/login");
                    } else {
                      Get.snackbar(mag, "My ChatApp");

                    }

                  },
                  child:  Text(
                    "Signup",style: TextStyle(color:homeController.themeName.value == "dark"?Colors.white:Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {

                    Get.back();
                  },
                  child: const Text("already have an account? Loin"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
