import 'dart:convert';
import 'package:fidelo/Screens/CardScreens/MisCards.dart';
import 'package:fidelo/Screens/HomeScreens/HomePage.dart';
import 'package:fidelo/Screens/ProfileScreen/DatosPersonales.dart';
import 'package:fidelo/Widgets/NavBar.dart';
import 'package:fidelo/models/Auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/GlobalVariables.dart';
import '../NotificacionesScreens/NotificacionScreen.dart';
import '../QRScreens/QRScreens.dart';

class ProfileScreen extends StatelessWidget {
  String nombre = "";

  String apellidoPaterno = "";

  String apellidoMaterno = "";

  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Text(
                    'Perfil',
                    style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.black,
                          fontSize: 26,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network("https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg",fit: BoxFit.cover,)
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  '${GlobalVariables.nombre}'+" "+"${GlobalVariables.apellidoPaterno}",
                  style: TextStyle(
                    fontSize: 14
                  ),
                ),
              ),
              Text(
                'Correo electronico',
                style: TextStyle(
                  fontSize: 14
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                        spreadRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 30),
                          child: ListTile(
                            title: Text(
                              'Cambiar Contraseña',
                              style: TextStyle(
                                fontSize: 22
                              ),
                            ),
                            trailing: Icon(
                              Icons.lock,
                              color: Colors.black,
                              size: 20,
                            ),
                            tileColor: Colors.white,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                          child: ExpansionTile(
                            title: Text(
                              'Datos Personales',
                              style: TextStyle(
                                fontSize: 22
                              ),
                            ),
                            trailing: Icon(
                              Icons.lock,
                              color: Colors.black,
                              size: 20,
                            ),
                            children: [
                                Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Center(
                                  child: Text("Mis datos Personales"),
                                ),
                                ),
                                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: ListTile(
                      title: Text(
                        'Nombre',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      subtitle: Text(
                        '${GlobalVariables.nombre}',
                        style: TextStyle(
                          fontSize: 14
                        ),
                      ),
                      trailing: Icon(
                        Icons.location_history,
                        color: Color(0xFF0F04E5),
                        size: 20,
                      ),
                      tileColor:
                          Colors.white,
                      dense: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: ListTile(
                      title: Text(
                        'Apellido Paterno',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      subtitle: Text(
                        '${GlobalVariables.apellidoPaterno}',
                        style: TextStyle(
                          fontSize: 14
                        ),
                      ),
                      trailing: Icon(
                        Icons.person_4,
                        color: Color(0xFF0F04E5),
                        size: 20,
                      ),
                      tileColor:
                          Colors.white,
                      dense: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: ListTile(
                      title: Text(
                        'Apellido Materno',
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        '${GlobalVariables.apellidoMaterno}',
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: Icon(
                        Icons.person_2,
                        color: Color(0xFF0F04E5),
                        size: 20,
                      ),
                      tileColor:
                          Colors.white,
                      dense: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: ListTile(
                      title: Text(
                        'Número de telefono',
                        style:TextStyle(fontSize: 18)
                      ),
                      subtitle: Text(
                        '${GlobalVariables.telefono}',
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: Icon(
                        Icons.settings_cell,
                        color: Color(0xFF0F04E5),
                        size: 20,
                      ),
                      tileColor:
                          Colors.white,
                      dense: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: ListTile(
                      title: Text(
                        'Numero de DNI',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      subtitle: Text(
                        '${GlobalVariables.documento}',
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: Icon(
                        Icons.perm_identity,
                        color: Color(0xFF0F04E5),
                        size: 20,
                      ),
                      tileColor:
                          Colors.white,
                      dense: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: ListTile(
                      title: Text(
                        'Distrito',
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        '${GlobalVariables.distrito}',
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: Icon(
                        Icons.location_city,
                        color: Color(0xFF0F04E5),
                        size: 20,
                      ),
                      tileColor:
                          Colors.white,
                      dense: false,
                    ),
                  ),
                            ],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                          child: ListTile(
                            onTap: () => Auth.logout(context),
                            title: Text(
                              'Cerrar Sesión',
                              style: TextStyle(
                                fontSize: 22
                              ),
                            ),
                            trailing: Icon(
                              Icons.lock,
                              color: Colors.black,
                              size: 20,
                            ),
                            tileColor: Colors.white,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        SizedBox(height: 30,)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
