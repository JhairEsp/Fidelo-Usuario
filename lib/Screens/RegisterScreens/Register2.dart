
import 'package:fidelo/Screens/screens.dart';
import 'package:flutter/material.dart';

class Register2 extends StatefulWidget {
  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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

  String? validateTextField3(String? value) {
    if (value == null || value.isEmpty) {
      return "El campo no puede estar vacío";
    }
    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repasswordController.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Color(0xFF2033DA),
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(1),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: double.infinity,
                            height: 350,
                            decoration: BoxDecoration(
                              color: Color(0xFF2033DA),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, -0.4),
                                  child: Text(
                                    'Fidelo',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Pacifico',
                                      fontSize: 100,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0.198),
                                  child: Text(
                                    'Registrarse',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
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
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.4),
                child: SingleChildScrollView(
                  child: Container(
                    width: 274,
                    height: 450,
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
                          alignment: AlignmentDirectional(-0.86, -0.9),
                          child: Text(
                            'Correo Electrónico',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, -0.75),
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
                            child: TextFormField(
                              controller: _emailController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: ' Correo Electrónico',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(100, 87, 99, 108),
                                  fontFamily: "Poppins",
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
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                              ),
                              validator: validateTextField1,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.86, -0.5),
                          child: Text(
                            'Contraseña',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, -0.35),
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
                            child: TextFormField(
                              controller: _passwordController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: ' Contraseña',
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
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                              ),
                              validator: validateTextField2,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.86, -0.14),
                          child: Text(
                            'Confirmar contraseña',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.05),
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
                            child: TextFormField(
                              controller: _repasswordController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: ' Confirmar Contraseña',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(100, 87, 99, 108),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
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
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                              ),
                              validator: validateTextField3,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.40),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF2033DA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              minimumSize: Size(60, 60),
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              if (_repasswordController.text == _passwordController.text) {
                                
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                      title: Center(child: Text("Registro")),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('Registrado Correctamente'),
                                          SizedBox(height: 20),
                                          Image.network(
                                            'https://cdn-icons-png.flaticon.com/256/753/753399.png',
                                            width: 100,
                                            height: 100,
                                          ),
                                          SizedBox(height: 20),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.push(context, 
                                MaterialPageRoute(builder: (context)=>Login(),
                                )
                                ); 
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xFF2033DA), // Color del botón
                                              textStyle: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30), // Radio del botón
                                              ),
                                              minimumSize: Size(180, 50),
                                            ),
                                            child: Text('Iniciar Sesion'),
                                          ),
                                        ],
                                      ),
                                      actions: [],
                                    );
                                  },
                                );                               
                              } else {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                      title: Center(child: Text('Error')),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('Las contraseñas no coinciden'),
                                          SizedBox(height: 20),
                                          Image.network(
                                            'https://cdn-icons-png.flaticon.com/256/9213/9213333.png',
                                            width: 100,
                                            height: 100,
                                          ),
                                          SizedBox(height: 20),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(); // Cierra el AlertDialog
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xFF2033DA), // Color del botón
                                              textStyle: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30), // Radio del botón
                                              ),
                                              minimumSize: Size(180, 50),
                                            ),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      ),
                                      actions: [],
                                    );
                                  },
                                );
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 8.0, left: 8.0), // Ajusta el espacio según tus necesidades
                              child: Text(
                                'Registrarse',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.70),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Ya tienes cuenta?',
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Iniciar Sesión',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFFF0000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
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
