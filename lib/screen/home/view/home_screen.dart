import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_chat_app/utils/helper/auth_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatApp"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Row(
              children: [
                const Text("SigningLogout"),
                IconButton(
                  onPressed: () {
                    AuthHelper.helper.logOut();
                    Get.toNamed("/login");
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
