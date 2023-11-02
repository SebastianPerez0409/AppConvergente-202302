import 'package:flutter/material.dart';
import 'package:iniciosesion/UI/LogIn/register.dart';

void main() async {
  /*  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications(); */

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Register(),
  ));
}
