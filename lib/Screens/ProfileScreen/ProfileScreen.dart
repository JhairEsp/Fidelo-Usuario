import 'dart:convert';
import 'package:fidelo/Screens/HomeScreens/HomePage.dart';
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

  /*Future<void> obtenerPerfil() async {
    final String? user = GlobalVariables.idProfile;
    final apiUrl = Uri.parse('http://192.168.0.101:4000/api/profile/$user');

    try {
      final response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic>? profileData = jsonDecode(response.body);

        if (profileData != null) {
          setState(() {
            nombre = profileData['nombre'];
            apellidoPaterno = profileData['apellidoPaterno'];
            email = profileData['email'];
          });
        } else {
          print("error de buscar datos");
        }
      } else {
        print("error al enviar solicitud : ${response.statusCode}");
      }
    } catch (error) {
      print("Error en la solicitud : $error");
    }
  }
*/
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 55, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            'https://picsum.photos/seed/806/600',
                            width: 150,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                child: Text(
                                  "${GlobalVariables.nombre}",
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),  
                ),
                Opacity(
                  opacity: 0.5,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.grey[200],
                          size: 24,
                        ),
                        Text(
                          '$email',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.grey[200],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$num',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Tarjetas Disponibles',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$num',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Tarjetas Reclamadas',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                  child: ListTile(
                    onTap: () {
                      // Manejar el toque en "Tus Favoritos"
                    },
                    leading: Icon(
                      Icons.favorite,
                    ),
                    title: Text(
                      'Tus Favoritos',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    tileColor: Colors.white,
                    dense: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                  child: ListTile(
                    onTap: () {
                      // Manejar el toque en "Codigo de Referencia"
                    },
                    leading: Icon(
                      Icons.share,
                    ),
                    title: Text(
                      'Codigo de Referencia',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    tileColor: Colors.white,
                    dense: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                  child: ListTile(
                    onTap: () {
                      // Manejar el toque en "Promociones"
                    },
                    leading: Icon(
                      Icons.percent,
                    ),
                    title: Text(
                      'Promociones',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    tileColor: Colors.white,
                    dense: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                  child: ListTile(
                    onTap: () {
                      // Manejar el toque en "Configuracion"
                    },
                    leading: Icon(
                      Icons.settings,
                    ),
                    title: Text(
                      'Configuracion',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    tileColor: Colors.white,
                    dense: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Auth.logout(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFE700FF),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Container(
                      height: 40,
                      width: 150,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      alignment: Alignment.center,
                      child: Text(
                        'Cerrar Sesión',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: 3,
          onTabChange: (index) {
            switch (index) {
              case 0:
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                break;
              case 1:
                Navigator.push(context, MaterialPageRoute(builder: (context) => const QRScreen()));
                break;
              case 2:
                Navigator.push(context, MaterialPageRoute(builder: (context) => notificaciones()));
                break;
              case 3:
                // No necesitas hacer nada si ya estás en esta pantalla.
                break;
            }
          },
        ),
      ),
    );
  }
}
