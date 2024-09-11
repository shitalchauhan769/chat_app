import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/services/notification_services.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: Column(
        children: [
            const SizedBox(height: 10,),
            Card(
              child: ListTile(
                onTap: () {
                  // NotificationMsg.notificationMsg.showSimpleNotification();
                },
                title: const Center(child: Text("Simple Notification"),),
                leading: const Icon(Icons.notifications),
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              child: ListTile(
                onTap: () {
                  NotificationMsg.notificationMsg.showScheduleNotification();
                },
                title: const Center(child: Text("Schedule Notification"),),
                leading: const Icon(Icons.notifications),
              ),
            ),
            const SizedBox(height: 10,),
            Card(
            child: ListTile(
              onTap: () {
                // NotificationMsg.notificationMsg.showBigPictureNotification();
              },
              title: const Center(child: Text("BigPicture Notification"),),
              leading: const Icon(Icons.image),
            ),
          ),
            const SizedBox(height: 10,),
            Card(
            child: ListTile(
              onTap: () {
                NotificationMsg.notificationMsg.showMediaStyleNotification();
              },
              title: const Center(child: Text("sound Notification"),),
              leading: const Icon(Icons.music_note),
            ),
          ),

        ],
      ),
    );
  }
}
