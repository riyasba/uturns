import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:uturns/fire_base_pushnotification.dart';
import 'package:uturns/firebase_options.dart';
import 'package:uturns/notification.dart';

Future _firebaseBagroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print('Some Notification Recived');
  }
}


void main()async {



    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  PushNotifications.int();
  FirebaseMessaging.onBackgroundMessage(_firebaseBagroundMessage);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  NotificationList(),
    );
  }
}
