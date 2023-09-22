import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const CustomBottomNavigationBar({super.key, 
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(1),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0,3)
        )
      ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: GNav(
          backgroundColor: Colors.white,
          color: Colors.black,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade800,
          gap: 8,
          onTabChange: widget.onTabChange,
          padding: const EdgeInsets.all(10),
          tabs: const [
            GButton(icon: Icons.home), //Home
            GButton(icon: Icons.qr_code), //Qr
            GButton(icon: Icons.credit_card_sharp),//Pantalla de Mis cartas
            GButton(icon: Icons.notifications), //Notificaciones
            GButton(icon: Icons.person_pin), //Profile
          ],
          selectedIndex: widget.selectedIndex,
        ),
      ),
    );
  }
}
