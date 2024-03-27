import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatefulWidget {
  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  void initState() {
    super.initState();
setDefau();
  }




    setDefau() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
   String? fcmToken =   await FirebaseMessaging.instance.getToken();
 print('/////////////////////////////${fcmToken}-------------------------------------.......>>>>>>>>..');
    });
  }
    final List<String> notifications = [
    "Notification 1",
    "Notification 2",
    "Notification 3",
    "Notification 4",
    "Notification 5",
    "Notification 6",
    "Notification 7",
    "Notification 8",
    "Notification 9",
    "Notification 10",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification List'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.notifications),
            title: Text(notifications[index]),
            onTap: () {
              
              print('Notification ${index + 1} tapped');
            },
          );
        },
      ),
    );
  }
}

//Platform  Firebase App Id
//android   1:874163308863:android:03a50a52d314bc6b08eb8a