import 'dart:convert';

import 'package:fidelo/models/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State <HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final scaffoldKey = GlobalKey<ScaffoldState>();
  final url = Uri.parse("http://192.168.0.9:4000/users");
  late Future<Usuario> usuario;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF2033DA),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: FutureBuilder(
              future: usuario,
              builder: (context,snapshot) {
                final Usuario userData = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.9, 0),
                      child: FaIcon(
                        FontAwesomeIcons.solidBell,
                        color: Colors.black,
                        size: 34,
                      ),
                    ),
                    Text(
                      'Bienvenido',
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      "${userData.nombre}"+" "+"${userData.apellidopat}",
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 9, 0, 0),
                      child: Container(
                        width: 366,
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: Text(
                                      'Buscador',
                                      style:
                                          TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                child: FaIcon(
                                  FontAwesomeIcons.search,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: double.infinity,
                        height: 1000,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                                child: Container(
                                  width: 300,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFBF00),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0.56, -0.8),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              30, 3, 0, 0),
                                          child: Text(
                                            'Tus monedas:\n\nCanjear Aqui',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0.56, -0.8),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                          child: Text(
                                            '[M]', //reemplazar por numero de monedas
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment: AlignmentDirectional(0.2, 0),
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  'https://cdn-icons-png.flaticon.com/256/7880/7880066.png',
                                                ).image,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            alignment: AlignmentDirectional(0, 0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Container(
                                  width: 310,
                                  height: 145,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF8C2A7D),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 2),
                                        spreadRadius: 4,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: Text(
                                          'Hamburgueseria',
                                          style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  'https://cdn-icons-png.flaticon.com/256/1858/1858002.png',
                                                ).image,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        20, 0, 0, 0),
                                                child: Container(
                                                  width: 155,
                                                  height: 17,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                  ),
                                                  child: LinearPercentIndicator(
                                                    percent: 0.7,
                                                    width: 155,
                                                    lineHeight: 78,
                                                    animation: true,
                                                    progressColor:
                                                        Color(0xFFF67329),
                                                    backgroundColor:
                                                        Colors.grey,
                                                    barRadius: Radius.circular(20),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        0, 2, 0, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Completo:   ',
                                                      style: TextStyle(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                    Text(
                                                      '[%P]',//Colocar el porcentaje
                                                      style: TextStyle(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Container(
                                  width: 310,
                                  height: 145,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF8C2A7D),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 2),
                                        spreadRadius: 4,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: Text(
                                          'Lan Center',
                                          style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  'https://cdn-icons-png.flaticon.com/256/1858/1858002.png',
                                                ).image,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        20, 0, 0, 0),
                                                child: Container(
                                                  width: 155,
                                                  height: 17,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                  ),
                                                  child: LinearPercentIndicator(
                                                    percent: 0.1,
                                                    width: 155,
                                                    lineHeight: 78,
                                                    animation: true,
                                                    progressColor:
                                                        Color(0xFFF67329),
                                                    backgroundColor:
                                                        Colors.grey,
                                                    barRadius: Radius.circular(20),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        0, 2, 0, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Completo:   ',
                                                      style: TextStyle(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                    Text(
                                                      '[%P]',
                                                      style: TextStyle(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Container(
                                  width: 310,
                                  height: 145,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF8C2A7D),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 2),
                                        spreadRadius: 4,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: Text(
                                          'Peluqueria',
                                          style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  'https://cdn-icons-png.flaticon.com/256/1858/1858002.png',
                                                ).image,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        20, 0, 0, 0),
                                                child: Container(
                                                  width: 155,
                                                  height: 17,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                  ),
                                                  child: LinearPercentIndicator(
                                                    percent: 0.5,
                                                    width: 155,
                                                    lineHeight: 78,
                                                    animation: true,
                                                    progressColor:
                                                        Color(0xFFF67329),
                                                    backgroundColor:
                                                        Colors.grey,
                                                    barRadius: Radius.circular(20),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        0, 2, 0, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Completo:   ',
                                                      style: TextStyle(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                    Text(
                                                      '[%P]',
                                                      style: TextStyle(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
@override
void initState() {
  super.initState();
  usuario =getUsuario();
}

Future<Usuario> getUsuario() async{
  final res = await http.get(url);
  if(res.statusCode == 200){
    final Map<String, dynamic> jsonUsuario = jsonDecode(res.body);
    final Usuario usuario = Usuario.fromJson(jsonUsuario);
    return usuario;
  }else{
    throw Exception("Error en la solicitud HTTP");
  }

}

}
