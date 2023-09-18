import 'package:fidelo/Screens/ProfileScreen/ProfileScreen.dart';
import 'package:fidelo/models/GlobalVariables.dart';
import 'package:flutter/material.dart';

class DatosPersonales extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 35, 0, 50),
                    child: Text(
                      'Informacion Personal ',
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 25,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: ListTile(
                      title: Text(
                        'Nombre',
                        style: TextStyle(
                          fontSize: 22
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
                          fontSize: 22
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
                        style: TextStyle(fontSize: 22),
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
                        style:TextStyle(fontSize: 22)
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
                          fontSize: 22
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
                        style: TextStyle(fontSize: 22),
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
              IconButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen())),
                icon: Icon(Icons.keyboard_arrow_left, size: 24,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}