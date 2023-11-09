import 'dart:convert';
import 'package:fidelo/Screens/pages.dart';
import 'package:flutter/material.dart';
import 'package:fidelo/Screens/screens.dart';
import '../../models/Auth.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = false;
  bool _emailError = false;
Auth _auth =Auth();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });

    // Cambiar el estado nuevamente después de 1 segundo
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showPassword = !_showPassword;
      });
    });
  }

  bool _validateEmail(String email) {
    // Verificar si el correo electrónico contiene el símbolo "@"
    return email.contains('@');
  }

Future<void> _login() async {
  // Validar el correo electrónico antes de iniciar sesión
  if (!_validateEmail(_emailController.text)) {
    setState(() {
      _emailError = true;
    });
    return;
  }

  // Restablecer el estado de error del correo electrónico
  setState(() {
    _emailError = false;
  });

  final response = await Auth.login(
    context,
    _emailController.text,
    _passwordController.text,
  );

  if (response.statusCode == 200) {
    // Llamada a obtenerIdProfile para obtener el valor _id
    await _auth.obtenerIdProfile(_emailController.text, _passwordController.text);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Pages(),));
  }else{
    // Login failed, show an error dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: const Text(
            "Inicio de sesión fallido. Por favor, verifica tus credenciales."),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF004CC6),Color(0xFF00A7BF)])
        ),
        child: Stack(
          children:[ SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "assets/logoblanco.png",
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain, 
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Text(
                    'Bienvenido de vuelta',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                  child: Text(
                    'INICIAR SESIÓN',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Opacity(
                  opacity:1,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                    child: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Stack(
                                alignment: AlignmentDirectional.centerEnd,
                                children: [
                                  TextFormField(
                                    controller: _emailController,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      labelText: 'Correo Electrónico',
                                      labelStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.black,
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.black,
                                      ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                    style: const TextStyle(fontSize: 16),
                                    onChanged: (value) {
                                      setState(() {
                                        _emailError = !_validateEmail(value) &&
                                            _emailController.text.isNotEmpty;
                                      });
                                    },
                                  ),
                                  if (_emailError)
                                    const Text(
                                      'Correo electrónico no válido',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
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
                Opacity(
                  opacity: 1,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                    child: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Icon(
                              Icons.lock,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
                              child: TextFormField(
                                controller: _passwordController,
                                autofocus: false,
                                obscureText: !_showPassword,
                                decoration: const InputDecoration(
                                  labelText: 'Contraseña',
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: _togglePasswordVisibility,
                            icon: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Opacity(
                  opacity: 1,
                  child: Align(
                    alignment: AlignmentDirectional(0.60, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 50),
                      child: Text(
                        'Olvidaste tu contraseña?',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: ElevatedButton(  
                    onPressed: () {
                      _login();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF004CC6),
                      onPrimary: Colors.black,
                      elevation: 3,
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(250, 60),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text("O",style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register1(),));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(255, 255, 255, 0.27),
                      onPrimary: Colors.black,
                      elevation: 3,
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(250, 60),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                    ),
                    child: const Text(
                      'Registrarse',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),

              ],
            ),
          ),
          const Positioned(
            top: 16,
            left: 16,
            child: Text("Version 0.0.8",style: TextStyle(
            color: Colors.black,fontSize: 12,
          ),))
        ], 
        ),
      ),
    );
  }
}
