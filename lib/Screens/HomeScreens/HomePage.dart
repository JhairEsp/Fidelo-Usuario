import 'dart:convert';
import 'package:fidelo/Screens/NotificacionesScreens/NotificacionScreen.dart';
import 'package:fidelo/Screens/QRScreens/QRScreens.dart';
import 'package:fidelo/Widgets/NavBar.dart';
import 'package:flutter/material.dart';
import '../../models/GlobalVariables.dart';
import '../screens.dart';
import 'package:http/http.dart'as http;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String nombre = "";

final busquedaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    obtenerPerfil();
  }
    Future<void> obtenerPerfil() async {
    String? id = GlobalVariables.idProfile;
    final apiUrl = Uri.parse('http://192.168.0.101:4000/api/profile/$id');

    try {
      final response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> profileData = jsonDecode(response.body);

        setState(() {
          nombre = profileData['nombre'];
        });
      } else {
        print('Error al obtener el perfil. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      print('Error en la solicitud: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 400,
                  height: 245,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 60, 0, 0),
                                    child: Text(
                                      'Bienvenido',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          19, 10, 0, 0),
                                      child: Text(
                                        "$nombre",
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 25,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Align(
                              alignment: const AlignmentDirectional(1, 0),
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(0, 15, 20, 0),
                                child: Container(
                                  width: 160,
                                  height: 160,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/256/64/64572.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: busquedaController,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Buscador',
                                        labelStyle: const TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(100, 87, 99, 108),
                                        ),
                                        hintStyle: const TextStyle(
                                          fontSize: 14,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(100, 87, 99, 108),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(100, 87, 99, 108),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(100, 87, 99, 108),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        focusedErrorBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(100, 87, 99, 108),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                      style:
                                          const TextStyle(
                                            fontSize: 14,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              const Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 15, 0),
                                    child: Icon(
                                      Icons.search,
                                      color: Color.fromARGB(100, 87, 99, 108),
                                      size: 24,
                                    ),
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Container(
                    width: 400,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        const BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            'EMPRESAS DISPONIBLES',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5, 5, 0, 0),
                                    child: Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5, 5, 0, 0),
                                    child: Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5, 5, 0, 0),
                                    child: Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5, 5, 0, 0),
                                    child: Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
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
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Card(
                          margin : const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              color: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              shadowColor: Colors.black,
                                                            child: const SizedBox(
                                width: 350, // Ancho deseado
                                height: 150, // Alto deseado
                                  child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                  'Informacion dentro de la Card',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                                margin : const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              color: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              shadowColor: Colors.black,
                                                            child: const SizedBox(
                                width: 350, // Ancho deseado
                                height: 150, // Alto deseado
                                  child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                  'Informacion dentro de la Card',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        Card(
                              margin : const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              color: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              shadowColor: Colors.black,
                                                            child: const SizedBox(
                                width: 350, // Ancho deseado
                                height: 150, // Alto deseado
                                  child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                  'Informacion dentro de la Card',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                  
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: 0, 
          onTabChange: (index){
            switch(index){
              case 0 : null; break;
              case 1 : Navigator.push(context, MaterialPageRoute(builder: (context)=>const QRScreen())); break;
              case 2: Navigator.push(context, MaterialPageRoute(builder: (context)=> const notificaciones())); break;
              case 3: Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen())); break;
            }
          }
          ),
      ),
    );
  }
}