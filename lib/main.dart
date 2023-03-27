import 'package:fidelo/Screens/RegisterScreens/Register.dart';
import "package:fidelo/Screens/screens.dart";
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Register());
  }
}
