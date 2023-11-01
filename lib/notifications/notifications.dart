// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
//
// class Notification extends StatefulWidget {
//   const Notification({Key? key}) : super(key: key);
//
//   @override
//   State<Notification> createState() => _NotificationState();
// }
//
// class _NotificationState extends State<Notification> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     FirebaseMessaging.configure(
//       onMessage: (message) async {
//         setState(() {
//           messageTitle = message["notification"]["title"];
//           notificationAlert = "New Notification Alert";
//         });
//       },
//       onResume: (message) async {
//         setState(() {
//           messageTitle = message["data"]["title"];
//           notificationAlert = "Application opened from Notification";
//         });
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               notificationAlert,
//             ),
//             Text(
//               messageTitle,
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
