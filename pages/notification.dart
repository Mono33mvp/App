// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationService {
//   final FlutterLocalNotificationsPlugin notificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   Future<void> initNotification() async {
//     AndroidInitializationSettings initializationSettingsAndroid =
//     const AndroidInitializationSettings('dorrlock');
//
//     var initializationSettingsIOS = DarwinInitializationSettings(
//         requestAlertPermission: true,
//         requestBadgePermission: true,
//         requestSoundPermission: true,
//         onDidReceiveLocalNotification:
//             (int id, String? title, String? body, String? payload) async {});
//
//     var initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//     await notificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse:
//             (NotificationResponse notificationResponse) async {});
//   }
//
//   notificationDetails() {
//     return const NotificationDetails(
//         android: AndroidNotificationDetails('channelId', 'channelName',
//             importance: Importance.max),
//         iOS: DarwinNotificationDetails());
//   }
//
//   Future showNotification(
//       {int id = 0, String? title, String? body, String? payLoad}) async {
//     return notificationsPlugin.show(
//         id, title, body, await notificationDetails());
//   }
// }
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/notify.dart';

import '../ALL_TAB/Systems_On_Off.dart';
import '../ALL_TAB/gallery_tab.dart';

class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage1> {
  final DatabaseReference _databaseReference =
  FirebaseDatabase.instance.ref("LaserAlert");
  final DatabaseReference _databaseReference1 =
  FirebaseDatabase.instance.ref("indoorAlert");
  final DatabaseReference _databaseReference2 =
  FirebaseDatabase.instance.ref("outoorAlert");

  @override
  void initState() {
    super.initState();

    // Replace "your_node" with the path to your specific node in Firebase Realtime Database
    _databaseReference.onValue.listen(( DatabaseEvent event) {
      // Retrieve the value of the node
      var nodeValue = event.snapshot.value;

      // Check if the node value is 1
      if (nodeValue == "1") {
        // Call the pushNotification function
        print('done');
        Notify.instantNotify();
      }
    }
    );
    _databaseReference1.onValue.listen(( DatabaseEvent event) {
      // Retrieve the value of the node
      var nodeValue1 = event.snapshot.value;

      // Check if the node value is 1
      if (nodeValue1 == "1") {
        // Call the pushNotification function
        print('done');
        Notify.instantNotify1();
      }
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: Text('Firebase Realtime Database Demo'),
      // ),
      body: gallery_tab_screen()
    );

  }
}