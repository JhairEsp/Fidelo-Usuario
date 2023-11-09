import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fidelo/Screens/pages.dart';
import "package:fidelo/Screens/screens.dart";
import 'package:fidelo/Widgets/SplashScreen.dart';
import 'package:fidelo/models/Auth.dart';
import 'package:fidelo/models/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;

  @override
  void initState() {
    checkId();
    super.initState();
    print("${GlobalVariables.idProfile}");
  }

  Future<void> checkId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? idProfile = prefs.getString("id");
    if (idProfile != null) {
      GlobalVariables.idProfile = idProfile;
    }
    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: getMainScreen()
    );
  }
  Widget getMainScreen() {
  if (isLoading) {
    return SplashScreen();
  } else {
    if (GlobalVariables.idProfile == "sin datos") {
      return Login();
    } else {
      return Pages();
    }
  }
}
}
