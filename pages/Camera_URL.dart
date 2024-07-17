//
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
//
//
// class NotificationPage extends StatelessWidget {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notification Demo'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _showNotification();
//           },
//           child: Text('Show Notification'),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _showNotification() async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     const NotificationDetails platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'New Notification',
//       'You have tapped the button!',
//       platformChannelSpecifics,
//       payload: 'Custom_Sound',
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// //
// // import 'package:untitled/pages/notification.dart';
// //
// // class MyHomePage1 extends StatefulWidget {
// //   const MyHomePage1({super.key, required this.title});
// //
// //   final String title;
// //
// //   @override
// //   State<MyHomePage1> createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage1> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //           child: ElevatedButton(
// //             child: const Text('Show notifications'),
// //             onPressed: () {
// //               NotificationService()
// //                   .showNotification(title: 'Sample title', body: 'It works!');
// //             },
// //           )),
// //     );
// //   }
// // }
