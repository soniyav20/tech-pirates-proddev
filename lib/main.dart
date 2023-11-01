import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prod_dev_23/view_models/changes.dart';
import 'package:prod_dev_23/views/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA-oUvLl18GsT01XsUPLF-UlW6LP3v0cEg",
          appId: '1:12862108178:android:3b2a2b055e9e69dc965ecb',
          messagingSenderId: '12862108178',
          projectId: 'proddev2023'));
  WidgetsFlutterBinding.ensureInitialized();
  String messageTitle = "Empty";
  String notificationAlert = "alert";

  runApp(Changes(
    child: MaterialApp(
      theme: ThemeData.dark(),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
