import "package:fidelo/Screens/LoginScreens/ForgotPassword.dart";
import 'package:fidelo/Screens/RegisterScreens/Register1.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  String? validateTextField1(String? value) {
    if (value == null || value.isEmpty) {
      return "El campo no puede estar vacío";
    }
    return null;
  }

  String? validateTextField2(String? value) {
    if (value == null || value.isEmpty) {
      return "El campo no puede estar vacío";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-0.11, -1.3),
                child: Container(
                  width: double.infinity,
                  height: 370,
                  decoration: BoxDecoration(
                    color: Color(0xFF2033DA),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, -0.4),
                    child: Text(
                      'Fidelo',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Pacifico",
                        fontSize: 100,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.43),
                child: Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.85),
                child: SingleChildScrollView(
                  child: Container(
                    width: 274,
                    height: 420,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.75, -0.75),
                          child: Text(
                            'Correo Electronico',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 0.15,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, -0.55),
                          child: Container(
                            width: 246,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: TextField(
                              controller: _emailController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: ' Correo Electronico',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(100, 87, 99, 108),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 0.25,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                color: Color.fromARGB(100, 87, 99, 108),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.8, -0.27),
                          child: Text(
                            'Contraseña',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontSize: 16,
                              letterSpacing: 0.15,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, -0.05),
                          child: Container(
                            width: 246,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: TextField(
                              controller: _passwordController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: ' Contraseña',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(100, 87, 99, 108),
                                  fontFamily: "Poppins",
                                  fontSize: 14,
                                  letterSpacing: 0.25,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "Poppins",
                                letterSpacing: 0.15,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.75, 0.21),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgotPassword()));
                            },
                            child: Text(
                              'Olvidaste tu contraseña?',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.6),
                          child: ElevatedButton(
                            onPressed: () => signIn(),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF2033DA),
                              onPrimary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '             No tienes una cuenta?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Register1(),
                                      ));
                                  // Agregar aquí la acción que deseas realizar al hacer clic en el hipervínculo
                                },
                                child: Text(
                                  'Registrate',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFFF0000),
                                    fontSize: 12,
                                    decoration: TextDecoration
                                        .underline, // Agregamos una línea subrayada al texto
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
