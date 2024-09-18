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
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        body: Stack(
          children: [
            homeController.theme.value == true
                ? Image(
                    image: const AssetImage(
                        "assets/image/whatsapp wallpaper2.jpg"),
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
                        color: green),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "SignUp",
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter Email";
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Please enter Email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => TextFormField(
                      obscureText: homeController.isHidePassword.value,
                      controller: txtPassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            homeController.hidePassword();
                          },
                          icon: Icon(homeController.isHidePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        label: const Text(
                          "Password",
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Password";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (fromKey.currentState!.validate()) {
                        String mag = await AuthHelper.helper
                            .signUpEmailWithPassword(
                                txtEmail.text, txtPassword.text);
                        if (mag == "Success") {
                          Get.snackbar("Successful", "My ChatApp");
                          Get.offAllNamed("/login");
                        } else {
                          Get.snackbar(mag, "My ChatApp");
                        }
                      }
                    },
                    child: const Text(
                      "Signup",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("already have an account? Login"),
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
