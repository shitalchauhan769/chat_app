import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_chat_app/utils/helper/auth_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              "Login",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: Colors.green),
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
              obscureText: true,
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
                String mag = await AuthHelper.helper.signInEmailWithPassword(txtEmail.text, txtPassword.text);
                if(mag=="Success")
                  {
                    Get.offAndToNamed('/home');
                    Get.snackbar("Successful", "My ChatApp");
                  }
                else
                  {
                    Get.snackbar(mag, "My ChatApp");
                  }
              },
              child: const Text(
                "Login",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Get.toNamed("/signup");
              },
              child: const Text("Don't have an account? Signup"),
            ),
          ],
        ),
      ),
    );
  }
}
