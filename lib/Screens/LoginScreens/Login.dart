import 'package:fidelo/Screens/screens.dart';
import "package:fidelo/models/Auth.dart";
import 'package:fidelo/Screens/LoginScreens/ForgotPassword.dart';
import 'package:fidelo/Screens/RegisterScreens/Register1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
Future<void> _login() async {
  Auth.login(context, _emailController.text, _passwordController.text);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomePage()), 
  );
}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2033DA),
        automaticallyImplyLeading: false,
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(-0.11, -1.3),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.55,
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
              alignment: AlignmentDirectional(0, -0.5),
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
              alignment: AlignmentDirectional(0, 0.4), // Ajusta la posición vertical
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 6,
                      color: Color(0x33000000),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  children: [
                    SizedBox(height: 30),
                    const Align(
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
                    SizedBox(height: 10),
                    Container(
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
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    const Align(
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
                    SizedBox(height: 10),
                    Container(
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
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: ' Contraseña',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(100, 87, 99, 108),
                            fontFamily: "Poppins",
                            fontSize: 14,
                            letterSpacing: 0.25,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
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
                    SizedBox(height: 10),
                    Align(
                      alignment: const AlignmentDirectional(-0.75, 0.21),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPassword(),
                            ),
                          );
                        },
                        child: const Text(
                          'Olvidaste tu contraseña?',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: const AlignmentDirectional(0, 0.6),
                      child: ElevatedButton(
                        onPressed: _login,
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
                            vertical: 20,
                            horizontal: 60,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: const AlignmentDirectional(1, 0.20),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text(
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
                                  ),
                                );
                              },
                              child: const Text(
                                'Registrate',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFFF0000),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
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
    );
  }
}
