import 'package:fidelo/Screens/HomeScreens/HomePage.dart';
import 'package:fidelo/Screens/Profiles/CreateProfile.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import "package:fidelo/Screens/screens.dart";
import '../../models/Auth.dart';
import '../LoginScreens/Login.dart'; // Importa la biblioteca para manejar el retraso

class Register1 extends StatefulWidget {
  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> with TickerProviderStateMixin {
  //datos
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();

  //verificadores
  bool _emailError = false;
  bool _passwordError = false;
  bool _isPasswordVisible = false; // Variable para controlar la visibilidad de la contraseña
  late AnimationController _passwordVisibilityController;

  @override
  void initState() {
    super.initState();
    _passwordVisibilityController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
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
        title: const Text("Error"),
        content: const Text("Por favor, corrige los errores antes de continuar."),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  } else if (_passwordController.text != _repasswordController.text) {
    // Mostrar un mensaje de error si las contraseñas no coinciden.
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: const Text("Las contraseñas no coinciden."),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  } else {
    // El correo electrónico y la contraseña son válidos y las contraseñas coinciden, procede con el registro.
    final result = await Auth.register(
      _emailController.text,
      _passwordController.text,
    );
    if (result.containsKey("error")) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: const Text("Registro Fallido"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Ok"),
            ),
          ],
        ),
      );
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}


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
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/logo.png",
                          width: 150,
                          height: 150,
                          fit: BoxFit.contain, 
                        ),
                      ),
                    ),
                  ),
                const Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'Registro',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.black,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
                const Opacity(
                  opacity: 0.6,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Text(
                      'Crea tu cuenta',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 15),
                    child: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color:  Colors.black,
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
                                    onChanged: _validateEmail, // Validar correo electrónico mientras se escribe
                                    autofocus: true,
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
                                    validator: emailValidator,
                                  ),
                                  if (_emailError)
                                    const Text(
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
                              child: TextFormField(
                                controller: _passwordController,
                                onChanged: _validatePassword, // Validar contraseña mientras se escribe
                                autofocus: true,
                                obscureText: !_isPasswordVisible, // Usa el valor de _isPasswordVisible
                                decoration: InputDecoration(
                                  labelText: 'Contraseña',
                                  labelStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black,
                                  ),
                                  hintStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black,
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
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                style: const TextStyle(
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
                              child: TextFormField(
                                controller: _repasswordController,
                                onChanged: _validatePassword, // Validar contraseña mientras se escribe
                                autofocus: true,
                                obscureText: !_isPasswordVisible, // Usa el valor de _isPasswordVisible
                                decoration: InputDecoration(
                                  labelText: 'Confirmar Contraseña',
                                  labelStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black,
                                  ),
                                  hintStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black,
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
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                style: const TextStyle(
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
                  child: const Text(
                    "¿Ya tienes cuenta? Inicia Sesión",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white, // Puedes cambiar el color del texto aquí
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_emailError && !_passwordError) {
                        // Verificar que no haya error de correo electrónico o contraseña antes de registrar
                        _register();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 33, 11, 230),
                      elevation: 3,
                      minimumSize: const Size(250,45),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
