
import 'package:animated_splash_screen/animated_splash_screen.dart';
import "package:fidelo/Screens/screens.dart";
import 'package:flutter/material.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      
      debugShowCheckedModeBanner: false, 
      home: SplashScreen(),
      
      );
      
  }
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF004CC6), Color(0xFF00A7BF)],
            stops: [0, 1],
            begin: AlignmentDirectional(0, -1),
            end: AlignmentDirectional(0, 1),
          ),
        ),
        child:  Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/logoblanco.png',
                    width: 300,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
        ])
        
      ),
      backgroundColor: const Color(0xFF004CC6),
      nextScreen: HomePage(),
      duration: 2000,
      splashTransition: SplashTransition.slideTransition,
    );
  }
}

