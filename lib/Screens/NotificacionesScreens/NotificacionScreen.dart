import 'package:fidelo/Screens/CardScreens/MisCards.dart';
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
          
    );
  }}