import 'package:fidelo/Screens/Profiles/CreateProfile.dart';
import 'package:flutter/material.dart';
import 'package:fidelo/Screens/screens.dart';

class Register3 extends StatefulWidget {
  @override
  State<Register3> createState() => _Register3State();
}

class _Register3State extends State<Register3> {
  final _telefonoController = TextEditingController();
  final _dniController = TextEditingController();
  final _distritoController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.deepPurple[600],
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
                    child: Text(
                      'Completa tus datos',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ),
                ),
Opacity(
  opacity: 0.6,
  child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
    child: Image.network(
      'https://cdn-icons-png.flaticon.com/512/1792/1792211.png',
      width: 150,
      height: 150,
    ),
  ),
),

                Opacity(
                  opacity: 0.6,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 15),
                    child: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0x00F1F4F8),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
                              child: TextFormField(
                                controller: _telefonoController,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Numero de Telefono',
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                    child: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0x00F1F4F8),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
                              child: TextFormField(
                                controller: _dniController,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Numero de DNI',
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                    child: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0x00F1F4F8),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
                              child: TextFormField(
                                controller: _distritoController,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Indique su Distrito',
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      final String telefono= _telefonoController.text;
                      final String dni =_distritoController.text;
                      final String distrito = _distritoController.text;
                      CreateProfile().Datos2(telefono, dni, distrito);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Continuar',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
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
      ),
    );
  }
}
