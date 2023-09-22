import 'package:fidelo/Screens/HomeScreens/HomePage.dart';
import 'package:fidelo/Screens/NotificacionesScreens/NotificacionScreen.dart';
import 'package:fidelo/Screens/ProfileScreen/ProfileScreen.dart';
import 'package:fidelo/Screens/QRScreens/QRScreens.dart';
import 'package:flutter/material.dart';

import '../../Widgets/NavBar.dart';

class MyCards extends StatefulWidget {
  const MyCards({super.key});

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Mis cards screen"),
        color: Colors.white,
      ),
      

                    bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: 2, 
            onTabChange: (index){
              switch(index){
                case 0 : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),)); break;
                case 1 : Navigator.push(context, MaterialPageRoute(builder: (context)=>const QRScreen())); break;
                case 2: null ; break;
                case 3: Navigator.push(context, MaterialPageRoute(builder: (context)=> const notificaciones())); break;
                case 4: Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen())); break;
              }
            }
            ),
    );
  }
}