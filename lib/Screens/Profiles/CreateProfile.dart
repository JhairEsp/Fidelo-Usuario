import 'dart:convert';

import 'package:fidelo/models/GlobalVariables.dart';
import 'package:http/http.dart' as http;

class CreateProfile {
  Future<void> enviarDatos() async {
  final url = 'http://192.168.0.101:4000/api/profile';
  final String? cookie = GlobalVariables.cookie;
  final headers = {'Content-Type': 'application/json', 'Cookie': '$cookie'};

  final Map<String, dynamic> data = {
    "nombre": "Jhairprueba3",
    "apellidopat": "Espinoza",
    "apellidomat": "Rios",
    "telefono": "999777555",
    "documento": "003433434",
    "distrito": "Independencia"
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // La solicitud fue exitosa, puedes manejar la respuesta aquí si es necesario.
      print("Solicitud exitosa");
    } else {
      // La solicitud no fue exitosa, puedes manejar el error aquí si es necesario.
      print("Error en la solicitud: ${response.statusCode}");
    }
  } catch (error) {
    // Manejar errores de red u otros errores aquí.
    print("Error: $error");
  }
}
}
