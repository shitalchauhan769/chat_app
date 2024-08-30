import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const SizedBox(height: 200,),
              InkWell(
                onTap: () {
                  Get.toNamed("/profile");
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Profile",style: TextStyle(fontSize: 15),),
                    Icon(Icons.person_rounded,),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  AuthHelper.helper.logOut();
                  Get.toNamed("/login");
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("SigningLogout",style: TextStyle(fontSize: 15),),
                    Icon(Icons.logout),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
      // body: ListView.builder(
      //   itemCount: 1,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       // leading:Container(
      //       //   decoration: const BoxDecoration(
      //       //       shape: BoxShape.circle,
      //       //       color: Colors.grey
      //       //   ),
      //       // ),
      //       title: const Text("Name"),
      //       subtitle: const Text("hii"),
      //       trailing: const Column(
      //         children: [
      //           // Text("day"),
      //           Text("time"),
      //         ],
      //       ),
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/user");
        },
        child: const Icon(Icons.person),
      ),
    );
  }
}
