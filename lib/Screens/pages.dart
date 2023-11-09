import 'package:fidelo/Screens/CardScreens/MisCards.dart';
import 'package:fidelo/Screens/HomeScreens/HomePage.dart';
import 'package:fidelo/Screens/NotificacionesScreens/NotificacionScreen.dart';
import 'package:fidelo/Screens/ProfileScreen/ProfileScreen.dart';
import 'package:fidelo/Screens/QRScreens/QRScreens.dart';
import 'package:flutter/material.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int _selectedIndex = 0;
  void _navigateBotttomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> _pages = [
    const HomePage(),
    const QRScreen(),
    MyCards(),
    const notificaciones(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white70,
        elevation: 10,
        currentIndex: _selectedIndex,
        onTap: _navigateBotttomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,),label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.qr_code,color: Colors.black,),label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.credit_card,color: Colors.black,),label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.notifications,color: Colors.black,),label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.black,),label: "")
        ],

      ),
    );
  }
}