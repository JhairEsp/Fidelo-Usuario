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

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String nombre = "";
  String apellidoPaterno = "";
  String apellidoMaterno = "";
  String email = "";

  @override
  void initState() {
    //obtenerPerfil();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
 return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette-thumbnail.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.00, 0.00),
                          child: Text(
                            "${GlobalVariables.nombre}"+" "+"${GlobalVariables.apellidoPaterno}",
                            style: TextStyle(
                              fontSize: 16
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$NUM',
                              style: TextStyle(
                                fontSize: 14
                              ),
                            ),
                            Text(
                              'Tarjetas Disponibles',
                              style:TextStyle(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF0F04E5),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$num',
                              style: TextStyle(
                                fontSize: 14
                              ),
                            ),
                            Text(
                              'Tarjetas Usadas',
                              style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF0F04E5),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: ListTile(
                    leading: Icon(
                      Icons.favorite,
                      color: Color(0xFF0F04E5),
                    ),
                    title: Text(
                      'Favoritos',
                      style: TextStyle(
                        fontSize: 14
                      ),
                    ),
                    tileColor: Colors.white,
                    dense: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Color(0xFF0F04E5),
                    ),
                    title: Text(
                      'Informacion Personal',
                      style: TextStyle(
                        fontSize: 14
                      ),
                    ),
                    tileColor: Colors.white,
                    dense: false,
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DatosPersonales())),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Color(0xFF0F04E5),
                    ),
                    title: Text(
                      'Configuracion',
                      style: TextStyle(
                        fontSize: 14
                      ),
                    ),
                    tileColor: Colors.white,
                    dense: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: ListTile(
                    leading: Icon(
                      Icons.share,
                      color: Color(0xFF0F04E5),
                    ),
                    title: Text(
                      'Compartir con amigos',
                      style: TextStyle(
                        fontSize: 14
                      ),
                    ),
                    tileColor: Colors.white,
                    dense: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Color(0xFF0F04E5),
                    ),
                    title: Text(
                      'Cerrar Sesión',
                      style: TextStyle(
                        fontSize: 14
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () {
                      Auth.logout(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
              bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: 4, 
            onTabChange: (index){
              switch(index){
                case 0 : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),)); break;
                case 1 : Navigator.push(context, MaterialPageRoute(builder: (context)=>const QRScreen())); break;
                case 2: Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyCards())); break;
                case 3: Navigator.push(context, MaterialPageRoute(builder: (context)=> const notificaciones())); break;
                case 4: null; break;
              }
            }
            ),
      ),
    );
  }
}
