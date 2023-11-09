  import 'dart:convert';
  import 'package:fidelo/Screens/CardScreens/DetallesCardScreen.dart';
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
    bool showTecnologyOnly = false;
    bool showFoodOnly = false;
    bool showBebidasOnly = false;
    bool showLavanderiaOnly = false;
    bool showPeluqueriaOnly = false;
    bool showLavadoAutosOnly = false;
    bool showLibreriaOnly = false;
  static List<Cards> cards_category =[
  Cards("Apple", "Tecnologia", "https://1000marcas.net/wp-content/uploads/2019/11/Apple-Logo.jpg",),
  Cards("Rockys", "Comida", "https://static.mercadonegro.pe/wp-content/uploads/2019/12/22202114/Screenshot_8.jpg"),
  Cards("Starbucks", "Bebida", "https://logos-download.com/wp-content/uploads/2016/03/Starbucks_Logo_2011.png"),
  Cards("Lavanderia Generica", "Lavanderia", "https://s10.s3c.es/imag/_v0/770x420/b/0/2/600x400_lavanderia.jpg"),
  Cards("Apple", "Tecnologia", "https://1000marcas.net/wp-content/uploads/2019/11/Apple-Logo.jpg"),
  Cards("Rockys", "Comida", "https://static.mercadonegro.pe/wp-content/uploads/2019/12/22202114/Screenshot_8.jpg"),
  Cards("Starbucks", "Bebida", "https://logos-download.com/wp-content/uploads/2016/03/Starbucks_Logo_2011.png"),
  Cards("Lavanderia Generica", "Lavanderia", "https://s10.s3c.es/imag/_v0/770x420/b/0/2/600x400_lavanderia.jpg"),
  Cards("Apple", "Tecnologia", "https://1000marcas.net/wp-content/uploads/2019/11/Apple-Logo.jpg"),
  Cards("Rockys", "Comida", "https://static.mercadonegro.pe/wp-content/uploads/2019/12/22202114/Screenshot_8.jpg"),
  Cards("Starbucks", "Bebida", "https://logos-download.com/wp-content/uploads/2016/03/Starbucks_Logo_2011.png"),
  Cards("Lavanderia Generica", "Lavanderia", "https://s10.s3c.es/imag/_v0/770x420/b/0/2/600x400_lavanderia.jpg"),
  Cards("Apple", "Tecnologia", "https://1000marcas.net/wp-content/uploads/2019/11/Apple-Logo.jpg"),
  Cards("Rockys", "Comida", "https://static.mercadonegro.pe/wp-content/uploads/2019/12/22202114/Screenshot_8.jpg"),
  Cards("Starbucks", "Bebida", "https://logos-download.com/wp-content/uploads/2016/03/Starbucks_Logo_2011.png"),
  Cards("Lavanderia Generica", "Lavanderia", "https://s10.s3c.es/imag/_v0/770x420/b/0/2/600x400_lavanderia.jpg"),
  Cards("Apple", "Tecnologia", "https://1000marcas.net/wp-content/uploads/2019/11/Apple-Logo.jpg"),
  Cards("Rockys", "Comida", "https://static.mercadonegro.pe/wp-content/uploads/2019/12/22202114/Screenshot_8.jpg"),
  Cards("Starbucks", "Bebida", "https://logos-download.com/wp-content/uploads/2016/03/Starbucks_Logo_2011.png"),
  Cards("Lavanderia Generica", "Lavanderia", "https://s10.s3c.es/imag/_v0/770x420/b/0/2/600x400_lavanderia.jpg"),
  Cards("Apple", "Tecnologia", "https://1000marcas.net/wp-content/uploads/2019/11/Apple-Logo.jpg"),
  Cards("Rockys", "Comida", "https://static.mercadonegro.pe/wp-content/uploads/2019/12/22202114/Screenshot_8.jpg"),
  Cards("Starbucks", "Bebida", "https://logos-download.com/wp-content/uploads/2016/03/Starbucks_Logo_2011.png"),
  Cards("Lavanderia Generica", "Lavanderia", "https://s10.s3c.es/imag/_v0/770x420/b/0/2/600x400_lavanderia.jpg"),
  ];
  List<Cards>display_list=List.from(cards_category);
  void updateList(String value){
    setState(() {
      display_list = cards_category.where((element) => element.titulo!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
    void toggleTecnologyFilter() {
    setState(() {
      showTecnologyOnly = !showTecnologyOnly;
      if (showTecnologyOnly) {
        display_list =
            cards_category.where((element) => element.categoria!.toLowerCase() == "tecnologia").toList();
      } else {
        display_list = List.from(cards_category);
      }
    });
  }
      void toggleBebidaFilter() {
    setState(() {
      showBebidasOnly = !showBebidasOnly;
      if (showBebidasOnly) {
        display_list =
            cards_category.where((element) => element.categoria!.toLowerCase() == "bebida").toList();
      } else {
        display_list = List.from(cards_category);
      }
    });
  }
        void toggleFoodFilter() {
    setState(() {
      showFoodOnly = !showFoodOnly;
      if (showFoodOnly) {
        display_list =
            cards_category.where((element) => element.categoria!.toLowerCase() == "comida").toList();
      } else {
        display_list = List.from(cards_category);
      }
    });
  }
          void toggleLavanderiaFilter() {
    setState(() {
      showLavanderiaOnly = !showLavanderiaOnly;
      if (showLavanderiaOnly) {
        display_list =
            cards_category.where((element) => element.categoria!.toLowerCase() == "lavanderia").toList();
      } else {
        display_list = List.from(cards_category);
      }
    });
  }

          void togglePeluqueriaFilter() {
    setState(() {
      showPeluqueriaOnly = !showPeluqueriaOnly;
      if (showPeluqueriaOnly) {
        display_list =
            cards_category.where((element) => element.categoria!.toLowerCase() == "peluqueria").toList();
      } else {
        display_list = List.from(cards_category);
      }
    });
  }
            void toggleLavadoAutosFilter() {
    setState(() {
      showLavadoAutosOnly = !showLavadoAutosOnly;
      if (showLavadoAutosOnly) {
        display_list =
            cards_category.where((element) => element.categoria!.toLowerCase() == "lavado autos").toList();
      } else {
        display_list = List.from(cards_category);
      }
    });
  }
              void toggleLibreriaOnly() {
    setState(() {
      showLibreriaOnly = !showLibreriaOnly;
      if (showLibreriaOnly) {
        display_list =
            cards_category.where((element) => element.categoria!.toLowerCase() == "libreria").toList();
      } else {
        display_list = List.from(cards_category);
      }
    });
  }


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
                  // ignore: use_build_context_synchronously
                  showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)
                  ),
                  backgroundColor: Colors.blue,
                  content: IntrinsicHeight(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                                            const Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: Text(
                          'Completa tus datos',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.black,
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
                                      return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      
                            insetPadding: const EdgeInsets.symmetric(horizontal: 16,vertical:90),
                            backgroundColor: Colors.blue,
                      content:  IntrinsicHeight(
                                
                                  child: SingleChildScrollView(
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
                                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage(),));
                                                          }else{
                                                            const AlertDialog(
                                                              content: Text("Campos Incompletos"),
                                                            );
                                                          }
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: const Color.fromARGB(255, 33, 11, 230),
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
                                      );
                              });
                      
                    }else{
                      const Dialog(
                        child: Text("Campos Incompletos"),
                      );
                    }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: const Color.fromARGB(255, 33, 11, 230),
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
                );
              },
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
  return Scaffold(
    appBar: PreferredSize(preferredSize: const Size.fromHeight(10), child: AppBar(automaticallyImplyLeading: false,elevation: 0,backgroundColor: Colors.white,)),
    backgroundColor: Colors.white,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
Row(
  children: [
    Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("   Bienvenido,", style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.normal)),
          Text("   ${GlobalVariables.nombre}", style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Container(
        width: 100,
        height: 100,
        child: Image.asset("assets/logohorizontalnegro.png"),
      ),
    ),
  ],
),
        Container(
          width: 379,height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black54)
            
          ),
          child: Padding(padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
          child: TextField(
            onChanged: (value) => updateList(value),
            style: const TextStyle(
              color: Colors.black54,
            ),
            decoration: const InputDecoration(filled: true,fillColor: Colors.white,hintText: "Buscador",prefixIcon: Icon(Icons.search),prefixIconColor: Colors.black54,),
            
          ),
          ),
          
        ),
        const SizedBox(height: 20,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
      child: InkWell(
        onTap: () => toggleFoodFilter(),
        child: Container(
          width: 100,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x33000000),
                offset: Offset(0, 2),
                spreadRadius: 2,
              )
            ],
            borderRadius: BorderRadius.circular(80),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Container(
                  width: 80,
                  height: 80,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://images3.alphacoders.com/131/1313839.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Comida',
                style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 12,
                    ),
              ),
            ],
          ),
        ),
      ),
    ),
        Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
      child: InkWell(
        onTap: () => toggleTecnologyFilter(),
        child: Container(
          width: 100,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x33000000),
                offset: Offset(0, 2),
                spreadRadius: 2,
              )
            ],
            borderRadius: BorderRadius.circular(80),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Container(
                  width: 80,
                  height: 80,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://images8.alphacoders.com/123/1239331.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Tecnologia',
                style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 12,
                    ),
              ),
            ],
          ),
        ),
      ),
    ),
            Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
      child: InkWell(
        onTap: () => toggleLavanderiaFilter(),
        child: Container(
          width: 100,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x33000000),
                offset: Offset(0, 2),
                spreadRadius: 2,
              )
            ],
            borderRadius: BorderRadius.circular(80),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Container(
                  width: 80,
                  height: 80,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://img.freepik.com/fotos-premium/linea-ropa-tienda_33765-29.jpg?w=360',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Lavanderia',
                style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 12,
                    ),
              ),
            ],
          ),
        ),
      ),
    ),
                Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
      child: InkWell(
        onTap: () => togglePeluqueriaFilter(),
        child: Container(
          width: 100,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x33000000),
                offset: Offset(0, 2),
                spreadRadius: 2,
              )
            ],
            borderRadius: BorderRadius.circular(80),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Container(
                  width: 80,
                  height: 80,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://i.pinimg.com/originals/80/55/0b/80550b2d2521bf459037ba822e23dd5a.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Peluqueria',
                style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 12,
                    ),
              ),
            ],
          ),
        ),
      ),
    ),
                    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
      child: InkWell(
        onTap: () => toggleBebidaFilter(),
        child: Container(
          width: 100,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x33000000),
                offset: Offset(0, 2),
                spreadRadius: 2,
              )
            ],
            borderRadius: BorderRadius.circular(80),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Container(
                  width: 80,
                  height: 80,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://w0.peakpx.com/wallpaper/371/679/HD-wallpaper-sanax-beber-bebidas-calor-fresco-sol-verano.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Bebidas',
                style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 12,
                    ),
              ),
            ],
          ),
        ),
      ),
    ),
    

  ],
)

        ),
        const SizedBox(height: 20,),
        Expanded(child: ListView.builder(
          itemCount: display_list.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetallesCardScreen(titulo: display_list[index].titulo, categoria: display_list[index].categoria, imagen: display_list[index].img),));
            },
            child: ListTile(
              title: Text(display_list[index].titulo!, style: const TextStyle(color: Colors.black, fontSize: 22,fontWeight: FontWeight.bold),),
              subtitle: Text(display_list[index].categoria!,style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.normal),),
              leading: Image.network(display_list[index].img!,width: 60, height: 60, fit: BoxFit.cover,),
            ),
          ),
          
          ))
      ],
    ),
    



  );
  
}
}

  
    