// import 'package:firebase_messaging/firebase_messaging.dart';

// FirebaseMessaging messaging = FirebaseMessaging.instance;

// void firebaseCloudMessagingListeners() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     // Handle incoming messages
//     print("onMessage: $message");
//   });

//   FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
//     // Handle background messages
//     print("onBackgroundMessage: $message");
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     // Handle notification taps
//     print("onMessageOpenedApp: $message");
//   });

// }

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotifications {
   static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final _firebaseMessaging = FirebaseMessaging.instance;

  static Future int() async {
    await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,);


         final token=await _firebaseMessaging.getToken();
         print('device tocken  $token');




         
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Colors.white,
            importance: NotificationImportance.High,
            playSound: true,
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupName: 'Basic group',
         channelGroupKey: 'basic_channel_group')
      ],
      debug: true);

        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    print('Message data: ${message.toString()}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');

      Map<String, String>? data = Map.from(message.data);

      
      AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
        //    icon: AwesomeNotifications.rootNativePath,
            title: message.notification!.title,
            body: message.notification!.body,
            payload: data),
      );
    }
  });

  }




 
}
