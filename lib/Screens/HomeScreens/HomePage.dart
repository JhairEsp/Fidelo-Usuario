  import 'dart:convert';
  import 'package:fidelo/Screens/CardScreens/MisCards.dart';
import 'package:fidelo/Screens/NotificacionesScreens/NotificacionScreen.dart';
  import 'package:fidelo/Screens/Profiles/CreateProfile.dart';
  import 'package:fidelo/Screens/QRScreens/QRScreens.dart';
  import 'package:fidelo/Widgets/Cards.dart';
  import 'package:fidelo/Widgets/NavBar.dart';
  import 'package:flutter/material.dart';
  import '../../models/GlobalVariables.dart';
  import '../screens.dart';
  import 'package:http/http.dart'as http;
  import 'package:flutter_typeahead/flutter_typeahead.dart';
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
    final List<String> distritos = [
    "Ancon",
    "Ate",
    "Barranco",
    "Breña",
    "Carabayllo",
    "Cercado de Lima",
    "Chaclacayo",
    "Chorrillos",
    "Cieneguilla",
    "Comas",
    "El Agustino",
    "Independencia",
    "Jesús María",
    "La Molina",
    "La Victoria",
    "Lince",
    "Los Olivos",
    "Lurigancho"
    "Lurín",
    "Magdalena del Mar",
    "Miraflores",
    "Pachacamac",
    "Pucusana",
    "Pueblo Libre",
    "Puente Piedra",
    "Punta Hermosa",
    "Punta Negra",
    "Rimac",
    "San Bartolo",
    "San Borja",
    "San Isidro",
    "San Juan de Lurigancho",
    "San Juan de Miraflores",
    "San Luis",
    "San Martin de Porres",
    "San Miguel",
    "Santa Anita",
    "Santa Maria del Mar",
    "Santa Rosa",
    "Santiago de Surco",
    "Surquillo",
    "Villa el Salvador",
    "Villa Maria del Triunfo"
  ];
    @override
    void initState() {
      super.initState();
      obtenerPerfil(context);
    }

    
  String? nombreValidator (String? value) {
    if (value == null || value.isEmpty) {
      return "El campo no puede estar vacío";
    }
    return null;
  }
    String? apellidopatValidator (String? value) {
    if (value == null || value.isEmpty) {
      return "El campo no puede estar vacío";
    }
    return null;
  }
    String? apellidomatValidator (String? value) {
    if (value == null || value.isEmpty) {
      return "El campo no puede estar vacío";
    }
    return null;
  }
    String? telefonoValidator (String? value) {
    if (value == null || value.isEmpty) {
      return "El campo no puede estar vacío";
    }
    return null;
  }
    String? dniValidator (String? value) {
    if (value == null || value.isEmpty) {
      return "El campo no puede estar vacío";
    }
    return null;
  }
    String? distritoValidator (String? value) {
    if (value == null || value.isEmpty) {
      return "El campo no puede estar vacío";
    }
    return null;
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
      if (profileData == null) {
        setState(() {
          GlobalVariables.nombre = " ";
          GlobalVariables.apellidoPaterno = " ";
        });
      }

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
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder:(BuildContext context){
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 16,vertical:90),
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
                                  validator: nombreValidator,
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
                                  validator: apellidopatValidator,
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
                                  validator: apellidomatValidator,
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
                            if (_nombreController.text.isNotEmpty && _apellidopatController.text.isNotEmpty && _apellidomatController.text.isNotEmpty) {
                            showDialog(context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context){
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
        insetPadding: EdgeInsets.symmetric(horizontal: 16,vertical:90),
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
                keyboardType: TextInputType.phone,
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
                  counterText: "",
                ),
                style: const TextStyle(fontSize: 16),
                validator: telefonoValidator,
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
                                  maxLength: 8,
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
                                    counterText: "",
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                  validator: dniValidator,
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
                  child: TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _distritoController,
                      autofocus: true,
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
                    validator: distritoValidator,
                    suggestionsCallback: (pattern) {
                      return distritos.where((distrito) =>
                          distrito.toLowerCase().contains(pattern.toLowerCase()));
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(suggestion),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      _distritoController.text = suggestion;
                    },
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
                        if (_telefonoController.text.isNotEmpty && _distritoController.text.isNotEmpty && _distritoController.text.isNotEmpty) {
                        final String nombre = _nombreController.text;
                        final String apellidoPaterno = _apellidopatController.text;
                        final String apellidoMaterno = _apellidomatController.text;
                        final String telefono = _telefonoController.text;
                        final String documento = _documentoController.text;
                        final String distrito = _distritoController.text;
                        await CreateProfile().enviarDatos(nombre, apellidoPaterno, apellidoMaterno, telefono, documento, distrito);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(),));
                        }else{
                          Dialog(
                            child: Text("Campos Incompletos"),
                          );
                        }
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
                    
}else{
  Dialog(
    child: Text("Campos Incompletos"),
  );
}
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

//Nombre en Home

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
                Align(
                  alignment: AlignmentDirectional(0.00, -1.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: Text(
                      'Bienvenido',
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child:    
                  Text(
                    '${GlobalVariables.nombre}'+" "+"${GlobalVariables.apellidoPaterno}",
                    style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 25,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                      child: TextFormField(
                        //controller,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Buscar',
                          labelStyle: TextStyle(fontSize: 12,color: Colors.black),
                          hintStyle: TextStyle(fontSize: 12,color: Colors.black),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.search,
                            size: 15,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      //Validator
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 18, 0, 5),
                  child: Text(
                    'Catergorias',
                    style: TextStyle(
                      fontSize: 14
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCategoryItem(category: "Tecnologia", imageUrl: "https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dGVjaG5vbG9neXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",),
                      CustomCategoryItem(category: "Comida", imageUrl: "https://barradeideas.com/wp-content/uploads/2019/09/fast-food.jpg"),
                      CustomCategoryItem(category: "Cafeteria", imageUrl: "https://fondosmil.com/fondo/15480.jpg" ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomCard(name: "Apple", category: "Tecnologia", imageUrl: "https://images.unsplash.com/photo-1621768216002-5ac171876625?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXBwbGUlMjBsb2dvfGVufDB8fDB8fHww&w=1000&q=80"),
                      CustomCard(name: "Rockys", category: "Comida", imageUrl: "https://mir-s3-cdn-cf.behance.net/projects/404/3e270297243061.Y3JvcCwzOTQ3LDMwODgsNzgsMA.jpg"),
                      CustomCard(name: "Starbucks", category: "Cafeteria", imageUrl: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png"),
                      CustomCard(name: "Rockys", category: "Comida", imageUrl: "https://mir-s3-cdn-cf.behance.net/projects/404/3e270297243061.Y3JvcCwzOTQ3LDMwODgsNzgsMA.jpg"),
                      CustomCard(name: "Starbucks", category: "Cafeteria", imageUrl: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png"),
                      CustomCard(name: "Rockys", category: "Comida", imageUrl: "https://mir-s3-cdn-cf.behance.net/projects/404/3e270297243061.Y3JvcCwzOTQ3LDMwODgsNzgsMA.jpg"),
                      CustomCard(name: "Starbucks", category: "Cafeteria", imageUrl: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
              bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: 0, 
            onTabChange: (index){
              switch(index){
                case 0 : null; break;
                case 1 : Navigator.push(context, MaterialPageRoute(builder: (context)=>const QRScreen())); break;
                case 2: Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyCards())); break;
                case 3: Navigator.push(context, MaterialPageRoute(builder: (context)=> const notificaciones())); break;
                case 4: Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen())); break;
              }
            }
            ),
      ),
    );
    }
  }