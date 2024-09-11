import 'package:flutter/material.dart';
import 'package:my_chat_app/utils/colors.dart';

class CommunitiesViewScreen extends StatefulWidget {
  const CommunitiesViewScreen({super.key});

  @override
  State<CommunitiesViewScreen> createState() => _CommunitiesViewScreenState();
}

class _CommunitiesViewScreenState extends State<CommunitiesViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Community info"),
              ),
              const PopupMenuItem(
                child: Text("Invite members"),
              ),
              const PopupMenuItem(
                child: Text("Community setting"),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          const ListTile(
            title: Text("You"),
            leading: Icon(Icons.photo_camera),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height:100,
                child: Card(
                  child: ListTile(
                    title: Text("Announcements"),
                    leading: Icon(Icons.announcement),
                    subtitle: Text("Welcome to your community!"),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Groups you're in"),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text("General"),
                            leading: Icon(Icons.add_chart),
                            subtitle: Text("New community members will no lon...."),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: Container(
                                width: 200,
                                height: 30,
                                decoration:  BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(child: Text("Add group"),),
                              ),

                            ),
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
