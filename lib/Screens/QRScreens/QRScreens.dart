import 'package:fidelo/Screens/CardScreens/MisCards.dart';
import 'package:fidelo/Screens/NotificacionesScreens/NotificacionScreen.dart';
import 'package:fidelo/Widgets/NavBar.dart';
import 'package:flutter/material.dart';

import '../screens.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const SafeArea(child: Text("Este es el QR Screen")),
      backgroundColor: Colors.white,
                      bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: 1, 
          onTabChange: (index){
            switch(index){
              case 0 : Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),)); break;
              case 1 : null; break;
              case 2: Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyCards())); break;
              case 3: Navigator.push(context, MaterialPageRoute(builder: (context) => notificaciones(),)); break;
              case 4: Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
            }
          }
          ),
      
    );
    
  }
}