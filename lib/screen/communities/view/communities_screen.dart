import 'package:flutter/material.dart';

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
            icon: const Icon(Icons.document_scanner_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo_camera),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Setting"),
              ),

            ],
          )
        ],
        title: const Text("Communities"),
      ),
      body: const Column(
        children: [
          ListTile(
            title: Text("New Communities"),
            leading: Icon(Icons.person),
          ),
          ListTile(
            title: Text("you"),
            leading: Icon(Icons.photo_camera),
          ),
          ListTile(
            title: Text("Announcements"),
            leading: Icon(Icons.announcement),
            subtitle: Text("Welcome to your community!"),
          ),
          ListTile(
            title: Text("General"),
            leading: Icon(Icons.add_chart),
            subtitle: Text("New community members will no lon...."),
          ),
        ],
      ),
    );
  }
}
