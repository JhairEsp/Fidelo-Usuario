import 'package:fidelo/Screens/QRScreens/QRScreens.dart';
import 'package:fidelo/Widgets/NavBar.dart';
import 'package:flutter/material.dart';

import '../screens.dart';

class notificaciones extends StatefulWidget {
  const notificaciones({super.key});

  @override
  State<notificaciones> createState() => _notificacionesState();
}

class _notificacionesState extends State<notificaciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("Notificaciones Screen")),
      backgroundColor: Colors.white,
                      bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: 2, 
          onTabChange: (index){
            switch(index){
              case 0 : Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),)); break;
              case 1 : Navigator.push(context, MaterialPageRoute(builder: (context)=>const QRScreen())); break;
              case 2: null; break;
              case 3: Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen())); break;
            }
          }
          ),
    );
  }}