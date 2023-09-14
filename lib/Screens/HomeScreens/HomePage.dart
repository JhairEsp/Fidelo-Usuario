  import 'dart:convert';
  import 'package:fidelo/Screens/NotificacionesScreens/NotificacionScreen.dart';
import 'package:fidelo/Screens/Profiles/CreateProfile.dart';
  import 'package:fidelo/Screens/QRScreens/QRScreens.dart';
  import 'package:fidelo/Widgets/NavBar.dart';
  import 'package:flutter/material.dart';
  import '../../models/GlobalVariables.dart';
  import '../screens.dart';
  import 'package:http/http.dart'as http;
  class HomePage extends StatefulWidget {
    const HomePage({Key? key}) : super(key: key);

    @override
    State<HomePage> createState() => _HomePageState();
  }
  class _HomePageState extends State<HomePage> {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    String nombre = "";
    String apellidopaterno = "";
    String apellidomaterno = "";
    String telefono ="";
    String documento = "";
    String distrito = "";
  final busquedaController = TextEditingController();
    final _emailController = TextEditingController();
  final _nombreController = TextEditingController();
  final _apellidopatController = TextEditingController();
  final _apellidomatController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _documentoController = TextEditingController();
  final _distritoController = TextEditingController();
    String? _selectedDistrict;
  List<String> _districts = [
    'Comas',
    'Independencia',
    'Distrito 3',
    // Agrega aquí la lista completa de distritos de Lima
  ];
    @override
    void initState() {
      super.initState();
      obtenerPerfil(context);
    }
Future<void> obtenerPerfil(BuildContext context) async {
  final String? user = GlobalVariables.idProfile;
  final apiUrl = Uri.parse('http://192.168.0.101:4000/api/profile/$user');

  try {
    final response = await http.get(
      apiUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic>? profileData = jsonDecode(response.body);

      if (profileData != null) {
        setState(() {
          nombre = profileData['nombre'];
          apellidopaterno = profileData["apellidopat"];
          apellidomaterno = profileData["apellidomat"];
          telefono = profileData["telefono"];
          documento = profileData["documento"];
          distrito = profileData["distrito"];
          GlobalVariables.nombre = nombre;
          GlobalVariables.apellidoPaterno = apellidopaterno;
          GlobalVariables.apellidoMaterno = apellidomaterno;
          GlobalVariables.telefono = telefono;
          GlobalVariables.documento = documento;
          GlobalVariables.distrito = distrito;
        });
      } else {
        // Mostrar un showDialog cuando profileData es nulo
    showDialog(context: context, builder:(BuildContext context){
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
              insetPadding: EdgeInsets.all(0),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Colors.deepPurple[600],
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Text(
                        'Completa tus datos',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.6,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/1792/1792211.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.6,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0x00F1F4F8),
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
                                padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
                                child: TextFormField(
                                  controller: _nombreController, // controller
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    labelText: 'Nombre',
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
                                  style: const TextStyle(fontSize: 16),
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
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0x00F1F4F8),
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
                                padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
                                child: TextFormField(
                                  controller: _apellidopatController,//controller
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    labelText: 'Apellido Paterno',
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
                                  style: const TextStyle(
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
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0x00F1F4F8),
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
                                padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
                                child: TextFormField(
                                  controller: _apellidomatController, //Controller
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    labelText: 'Apellido Materno',
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
                                  style: const TextStyle(
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: ElevatedButton(
                      onPressed: () async {
                            showDialog(context: context, builder: (BuildContext context){
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        insetPadding: EdgeInsets.all(0),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Colors.deepPurple[600],
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(
                        'Completa tus datos',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.6,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/1792/1792211.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
Opacity(
  opacity: 0.6,
  child: Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
    child: Container(
      width: 300,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0x00F1F4F8),
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
              padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
              child: TextFormField(
                controller: _telefonoController,
                autofocus: true,
                obscureText: false,
                keyboardType: TextInputType.number,
                maxLength: 9, // Limitar la entrada a 9 números
                decoration: const InputDecoration(
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
                style: const TextStyle(fontSize: 16),
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
    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
    child: Container(
      width: 300,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0x00F1F4F8),
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
              padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
              child: TextFormField(
                controller: _documentoController,
                autofocus: true,
                obscureText: false,
                keyboardType: TextInputType.number,
                maxLength: 8, // Limitar la entrada a 8 números
                decoration: const InputDecoration(
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
                style: const TextStyle(
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
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
        child: Container(
          width: 300,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0x00F1F4F8),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
                  child: DropdownButtonFormField<String>(
                    value: _selectedDistrict,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedDistrict = newValue;
                      });
                    },
                    items: _districts.map((district) {
                      return DropdownMenuItem<String>(
                        value: district,
                        child: Text(district),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
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
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final String nombre = _nombreController.text;
                        final String apellidoPaterno = _apellidopatController.text;
                        final String apellidoMaterno = _apellidomatController.text;
                        final String telefono = _telefonoController.text;
                        final String documento = _documentoController.text;
                        final String distrito = _distritoController.text;
                        await CreateProfile().enviarDatos(nombre, apellidoPaterno, apellidoMaterno, telefono, documento, distrito);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(),));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 33, 11, 230),
                        elevation: 3,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Row(
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
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        backgroundColor: Color.fromARGB(255, 33, 11, 230),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        
                        ),
                      ),
                      child: const Row(
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
    );
      }
    } else {
      print('Error al obtener el perfil. Código de estado: ${response.statusCode}');
    }
  } catch (error) {
    print('Error en la solicitud: $error');
  }
}
    @override
    Widget build(BuildContext context) {
 return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                          child: Text(
                            "${GlobalVariables.nombre}"+" "+"${GlobalVariables.apellidoPaterno}",
                            style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 24,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://picsum.photos/seed/492/600',
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20,),
                Text("Empresas disponibles"),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
          child: Container(
            width: 200,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://assets.stickpng.com/images/580b57fcd9996e24bc43c516.png',
                        width: 300,
                        height: 96,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 54,
                      decoration: BoxDecoration(
                        color:
                            Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Apple',
                                style:
                                    TextStyle(
                                      fontSize: 14
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Tecnologia',
                                style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color:Colors.grey,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
                Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
          child: Container(
            width: 200,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://assets.stickpng.com/images/580b57fcd9996e24bc43c516.png',
                        width: 300,
                        height: 96,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 54,
                      decoration: BoxDecoration(
                        color:
                            Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Apple',
                                style:
                                    TextStyle(
                                      fontSize: 14
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Tecnologia',
                                style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color:Colors.grey,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
                Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
          child: Container(
            width: 200,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://assets.stickpng.com/images/580b57fcd9996e24bc43c516.png',
                        width: 300,
                        height: 96,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 54,
                      decoration: BoxDecoration(
                        color:
                            Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Apple',
                                style:
                                    TextStyle(
                                      fontSize: 14
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Tecnologia',
                                style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color:Colors.grey,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(25, 30, 0, 15),
                    child: Text(
                      'Mis Tarjetas',
                      style:TextStyle(
                        fontSize: 14
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Container(
                          width: 380,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                                spreadRadius: 5,
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Container(
                          width: 380,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0, 0, 0),
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.network(
                                            'https://logodownload.org/wp-content/uploads/2017/10/Starbucks-logo.png',
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 30, 0, 0),
                                            child: Text(
                                              'Starbucks',
                                              style:
                                                  TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Text(
                                              'Cafeteria',
                                              textAlign: TextAlign.start,
                                              style:
                                                  TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                  )
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.91, 0.04),
                                child: Icon(
                                  Icons.navigate_next_outlined,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                              
                            )
                    ],
                  ),
                )),
              ],
            ),
          ),
        ] ),
      ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: 0, 
            onTabChange: (index){
              switch(index){
                case 0 : null; break;
                case 1 : Navigator.push(context, MaterialPageRoute(builder: (context)=>const QRScreen())); break;
                case 2: Navigator.push(context, MaterialPageRoute(builder: (context)=> const notificaciones())); break;
                case 3: Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen())); break;
              }
            }
            ),
      ));
    }
  }