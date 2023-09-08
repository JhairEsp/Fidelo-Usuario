import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const CustomBottomNavigationBar({
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
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade800,
          gap: 8,
          onTabChange: widget.onTabChange,
          padding: const EdgeInsets.all(16),
          tabs: const [
            GButton(icon: Icons.home), //Home
            GButton(icon: Icons.qr_code), //Qr
            GButton(icon: Icons.notifications), //Notificaciones
            GButton(icon: Icons.person_pin), //Profile
          ],
          selectedIndex: widget.selectedIndex,
        ),
      ),
    );
  }
}
