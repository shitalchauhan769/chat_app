import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_chat_app/utils/helper/auth_helper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Signup",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(
              height: 30,
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
                String mag = await AuthHelper.helper
                    .signUpEmailWithPassword(txtEmail.text, txtPassword.text);
                if (mag == "Success") {
                  Get.snackbar("Successful", "My ChatApp");

                } else {
                  Get.snackbar(mag, "My ChatApp");
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
              child: const Text("already have an account? Loin"),
            ),
          ],
        ),
      ),
    );
  }
}
