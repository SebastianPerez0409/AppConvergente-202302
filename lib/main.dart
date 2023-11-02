import 'package:flutter/material.dart';
import 'package:iniciosesion/UI/LogIn/register.dart';
import 'package:iniciosesion/mundo/firebase_api.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  /*  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications(); */

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Register(),
  ));
}
