import 'package:fidelo/Screens/Profiles/CreateProfile.dart';
import 'package:fidelo/Screens/RegisterScreens/Register2.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../../models/Auth.dart';
import '../LoginScreens/Login.dart'; // Importa la biblioteca para manejar el retraso

class Register1 extends StatefulWidget {
  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> with TickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();
  bool _emailError = false;
  bool _passwordError = false;
  bool _isPasswordVisible = false; // Variable para controlar la visibilidad de la contraseña
  late AnimationController _passwordVisibilityController;

  @override
  void initState() {
    super.initState();
    _passwordVisibilityController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _passwordVisibilityController.dispose();
    super.dispose();
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "El campo no puede estar vacío";
    }
    if (!value.contains('@')) {
      return "Correo electrónico no válido";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "El campo no puede estar vacío";
    }
    return null;
  }

  String? repasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "El campo no puede estar vacío";
    }
    return null;
  }

  void _validateEmail(String text) {
    setState(() {
      _emailError = text.isEmpty || !text.contains('@');
    });
  }

  void _validatePassword(String text) {
    setState(() {
      _passwordError = text != _repasswordController.text;
    });
  }

  Future<void> _register() async {
    if (_emailError || _passwordError) {
      // Mostrar un mensaje de error si el correo electrónico o la contraseña son inválidos.
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Por favor, corrige los errores antes de continuar."),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            ),
          ],
        ),
      );
    } else {
      // El correo electrónico y la contraseña son válidos, procede con el registro.
      final result = await Auth.register(
          _emailController.text, _passwordController.text);
      if (result.containsKey("error")) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text("Registro Fallido"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Ok"),
              ),
            ],
          ),
        );
      } else {
        await CreateProfile().emailProfile(_emailController.text);
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              title: Center(child: Text("Registro")),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Registrado Correctamente'),
                  SizedBox(height: 20),
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/256/11487/11487186.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Cierra el AlertDialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register2()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF2033DA),
                      textStyle: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(180, 50),
                    ),
                    child: Text("Continuar"),
                  ),
                ],
              ),
              actions: [],
            );
          },
        );
      }
    }
  }

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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 130, 0, 0),
                    child: Text(
                      'Registro',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Text(
                      'Crea tu cuenta',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                      ),
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
                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Stack(
                                alignment: AlignmentDirectional.centerEnd,
                                children: [
                                  TextFormField(
                                    controller: _emailController,
                                    onChanged: _validateEmail, // Validar correo electrónico mientras se escribe
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Correo Electrónico',
                                      labelStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.black,
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.grey,
                                      ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                    style: TextStyle(fontSize: 16),
                                    validator: emailValidator,
                                  ),
                                  if (_emailError)
                                    Text(
                                      'Correo no válido',
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
                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: TextFormField(
                                controller: _passwordController,
                                onChanged: _validatePassword, // Validar contraseña mientras se escribe
                                autofocus: true,
                                obscureText: !_isPasswordVisible, // Usa el valor de _isPasswordVisible
                                decoration: InputDecoration(
                                  labelText: 'Contraseña',
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      // Cambia la visibilidad de la contraseña al hacer clic en el icono
                                      setState(() {
                                        _isPasswordVisible = !_isPasswordVisible;
                                      });
                                    },
                                    child: Icon(
                                      // Muestra un icono de ojo si la contraseña es visible o un icono de ojo tachado si no lo es
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                validator: passwordValidator,
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
                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: TextFormField(
                                controller: _repasswordController,
                                onChanged: _validatePassword, // Validar contraseña mientras se escribe
                                autofocus: true,
                                obscureText: !_isPasswordVisible, // Usa el valor de _isPasswordVisible
                                decoration: InputDecoration(
                                  labelText: 'Confirmar Contraseña',
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      // Cambia la visibilidad de la contraseña al hacer clic en el icono
                                      setState(() {
                                        _isPasswordVisible = !_isPasswordVisible;
                                      });
                                    },
                                    child: Icon(
                                      // Muestra un icono de ojo si la contraseña es visible o un icono de ojo tachado si no lo es
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                validator: repasswordValidator,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
                    "¿Ya tienes cuenta? Inicia Sesión",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white, // Puedes cambiar el color del texto aquí
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_emailError && !_passwordError) {
                        // Verificar que no haya error de correo electrónico o contraseña antes de registrar
                        _register();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      elevation: 3,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text("Registrar")
                        // Espacio entre el icono y el texto (ajusta según sea necesario)
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
