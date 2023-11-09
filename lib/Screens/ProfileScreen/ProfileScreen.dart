import 'dart:convert';
import 'package:fidelo/Screens/CardScreens/MisCards.dart';
import 'package:fidelo/Screens/HomeScreens/HomePage.dart';
import 'package:fidelo/Screens/ProfileScreen/DatosPersonales.dart';
import 'package:fidelo/Widgets/NavBar.dart';
import 'package:fidelo/models/Auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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
  appBar: AppBar(
    backgroundColor: Color(0xFF0F04E5),
    automaticallyImplyLeading: false,
    title: Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Text(
        'Configuracion',
        style: TextStyle(
              fontFamily: 'Outfit',
              color: Colors.white,
              fontSize: 22,
            ),
      ),
    ),
    actions: [],
    centerTitle: false,
    elevation: 2,
  ),
  body: SingleChildScrollView(
    child: SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Color(0xFF0F04E5),
                    ),
                    title: Text(
                      'Mi Cuenta',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    tileColor:
                        Colors.white,
                    dense: false,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0),
                  ),
                ),
        ExpansionTile(
        title: Text(
        '          Datos Personales',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.grey[600],
        ),
        ),
        trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey[600],
        size: 20,
        ),
        backgroundColor: Colors.white,
        childrenPadding: EdgeInsetsDirectional.fromSTEB(55, 0, 20, 0),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
                          title: Text(
                            '${GlobalVariables.nombre}',
                            style: TextStyle(
                              fontSize: 18
                            ),
                          ),
                          subtitle: Text(
                            "Nombre",
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
                                
            
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: ListTile(
                          title: Text(
                            '${GlobalVariables.apellidoPaterno}',
                            style: TextStyle(
                              fontSize: 18
                            ),
                          ),
                          subtitle: Text(
                            'Apellido Paterno',
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
                            '${GlobalVariables.apellidoMaterno}',
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text(
                            "Apellido Materno",
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
                            '${GlobalVariables.telefono}',
                            style:TextStyle(fontSize: 18)
                          ),
                          subtitle: Text(
                            'Numero de Telefono',
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
                            '${GlobalVariables.documento}',
                            style: TextStyle(
                              fontSize: 18
                            ),
                          ),
                          subtitle: Text(
                            'Numero de DNI',
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
                            '${GlobalVariables.distrito}',
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
        ),
        
                ListTile(
                  title: Text(
                    'Cambiar Contraseña',
                    style:TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[600],
                    ), 
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                  tileColor: Colors.white,
                  dense: false,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(55, 0, 20, 0),
                ),
                              ListTile(
                                onTap: () {
                                  showDialog(context: context, builder: (BuildContext context){
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      title: Text("Privacidad y Seguridad"),
                                      content: Text(" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed facilisis tortor vel ante tristique, eu malesuada nisi malesuada. In hac habitasse platea dictumst. Maecenas sagittis orci id enim vulputate, ac facilisis justo lacinia. Nunc ac malesuada elit, et efficitur odio. Maecenas fringilla, urna eu vulputate feugiat, tortor nisi pharetra elit, sit amet fermentum purus odio vitae urna. Sed hendrerit purus id velit bibendum, nec imperdiet arcu sagittis. Nulla facilisi. Nunc vel massa id ipsum malesuada condimentum. Vivamus sed elit et purus aliquam varius. Curabitur vel nisi eu sem sollicitudin bibendum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc venenatis ac est in gravida. Integer malesuada tincidunt odio, vel tempus elit imperdiet sit amet. Sed eu erat ac nunc fermentum fermentum. Quisque quis tortor et ante ultricies dapibus. "),
                                    );
                                  });
                                },
                  title: Text(
                    'Privacidad y Seguridad',
                    style:TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[600],
                    ), 
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                  tileColor: Colors.white,
                  dense: false,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(55, 0, 20, 0),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                  child: ListTile(
                    leading: Icon(
                      Icons.volume_up,
                      color: Color(0xFF0F04E5),
                    ),
                    title: Text(
                      'Notificaciones',
                      style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    ),
                    tileColor:
                        Colors.white,
                    dense: false,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Notificaciones',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Icon(
                    Icons.notifications,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                  tileColor: Colors.white,
                  dense: false,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(55, 0, 20, 0),
                ),
                ListTile(
                  title: Text(
                    'Tema Oscuro',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Icon(
                    Icons.dark_mode,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                  tileColor: Colors.white,
                  dense: false,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(55, 0, 20, 0),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: ElevatedButton(
        onPressed: () async {
        Auth.logout(context); 
        GlobalVariables.idProfile = "sin datos";
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("id", "${GlobalVariables.idProfile}");
        print(GlobalVariables.idProfile);
        },
        child: Text(
        'Cerrar Sesión',
        style: TextStyle(
          fontFamily: 'Readex Pro',
          color: Colors.white,
        ),
        ),
        style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0F04E5),
        onPrimary: Colors.white,
        elevation: 3,
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        ),
        )
        
            ),
          ],
        ),
      ),
    ),
  ),
);
  }
}
