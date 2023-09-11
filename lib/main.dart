
import "package:fidelo/Screens/screens.dart";
import 'package:flutter/material.dart';
import 'package:fidelo/models/GlobalVariables.dart';
import 'Screens/LoginScreens/Login.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        "/login" : (context) => Login(),
      },
      debugShowCheckedModeBanner: false, 
      home: Login());
  }
}
