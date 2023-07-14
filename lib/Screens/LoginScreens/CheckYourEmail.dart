import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckYourEmail extends StatelessWidget {
  final String email;

  CheckYourEmail({required this.email});

  Future<void> _openEmailApp() async {
    final emailUrl = 'mailto:$email';
    if (await canLaunch(emailUrl)) {
      await launch(emailUrl);
    } else {
      throw 'No se pudo abrir la aplicación de correo electrónico.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2033DA),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 1),
            child: Container(
              width: double.infinity,
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, -0.65),
                    child: Container(
                      width: 128,
                      height: 128,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/3486/3486426.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, -0.2),
                    child: Text(
                      'Verifica tu Correo Electrónico',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, -0.1),
                    child: Text(
                      'Recibirá pasos para recuperar su contraseña',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(100, 87, 99, 108),
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.15),
                    child: ElevatedButton(
                      onPressed: _openEmailApp,
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2033DA),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Container(
                        width: 227,
                        height: 42,
                        alignment: Alignment.center,
                        child: Text(
                          'Abrir Email App',
                          style: TextStyle(
                            fontFamily: 'Poppins',
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
        ),
      ),
    );
  }
}
