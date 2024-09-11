import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_chat_app/utils/colors.dart';
import 'package:my_chat_app/utils/helper/auth_helper.dart';

import '../../home/controller/home_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  HomeController homeController = Get.put(HomeController());
  GlobalKey<FormState> fromKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Scaffold(
        body: Stack(
          children: [
            homeController.theme.value==true?
            Image(
              image:
              const AssetImage("assets/image/whatsapp wallpaper2.jpg"),
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              fit: BoxFit.cover,
            )
                :Image(
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
                    "Login Your Account",
                    style: TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold, color: green),
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: txtEmail,
                    decoration: const InputDecoration(
                      label: Text(
                        "Email",
                      ),
                      border: OutlineInputBorder(),
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
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtPassword,
                    obscureText: true,

                    decoration: const InputDecoration(
                      label: Text(
                        "Password",
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return "Please enter Password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {

                     if(fromKey.currentState!.validate())
                       {
                         String mag = await AuthHelper.helper
                             .signInEmailWithPassword(txtEmail.text, txtPassword.text);
                         if (mag == "Success") {
                           AuthHelper.helper.checkUser();
                           Get.offAndToNamed('/profile');
                         } else {
                           Get.snackbar(mag, "My ChatApp");
                         }
                       }

                    },
                    child:  const Text(
                      "Login",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      String mag =
                          await AuthHelper.helper.signGoolgeWithEmailAndPassword();
                      if (mag == "Success") {
                        AuthHelper.helper.checkUser();
                        Get.offAndToNamed('/profile');
                        Get.snackbar("Successful", "My ChatApp");
                      } else {
                        Get.snackbar(mag, "My ChatApp");
                      }
                    },
                    child: const Card(
                      child: Image(
                        image: AssetImage("assets/image/google.png"),
                        width: 200,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed("/signup");
                    },
                    child:  const Text("Don't have an account? Signup",),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
