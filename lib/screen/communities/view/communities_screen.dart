import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CommunitiesScreen extends StatefulWidget {
  const CommunitiesScreen({super.key});

  @override
  State<CommunitiesScreen> createState() => _CommunitiesScreenState();
}

class _CommunitiesScreenState extends State<CommunitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.document_scanner_outlined,color: Colors.white,),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo_camera,color: Colors.white,),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Setting"),
              ),

            ],
          )
        ],
        title: const Text("Communities",style: TextStyle(color: Colors.white,),),
      ),
      body:  Column(
        children: [
          const SizedBox(height: 10,),
          const SizedBox(
            height: 100,
            child: Card(
              child: ListTile(
                title: Text("New Communities"),
                leading: Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
            child: Card(
              child: ListTile(
                title: Text("You"),
                leading: Icon(Icons.photo_camera),
              ),
            ),
          ),
          SizedBox(
            height: 300,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ListTile(
                    title: Text("Announcements"),
                    leading: Icon(Icons.announcement),
                    subtitle: Text("Welcome to your community!"),
                  ),
                  const SizedBox(height: 10,),
                  const ListTile(
                    title: Text("General"),
                    leading: Icon(Icons.add_chart),
                    subtitle: Text("New community members will no lon...."),
                  ),
                  const SizedBox(height: 10,),
                  ListTile(
                    onTap: () {
                     Get.toNamed("/communitiesView");
                    },
                    title: const Text("View all"),
                    leading: const Icon(Icons.arrow_forward_ios),

                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
