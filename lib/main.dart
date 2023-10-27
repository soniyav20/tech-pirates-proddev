import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prod_dev_23/views/login_page.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
