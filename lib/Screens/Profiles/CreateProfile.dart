import 'dart:convert';
import 'package:fidelo/models/GlobalVariables.dart';
import 'package:http/http.dart' as http;

class CreateProfile {
  Future<void> enviarDatos(String nombre, String apellidoPaterno, String apellidoMaterno,String telefono, String documento, String distrito) async {
  const url = 'http://api.fidelo.pe:4000/api/profile';
  final String? cookie = GlobalVariables.cookie;
  final headers = {'Content-Type': 'application/json', 'Cookie': '$cookie'};
  
  final Map<String, dynamic> data = {
    "nombre": nombre,
    "apellidopat":  apellidoPaterno,
    "apellidomat": apellidoMaterno,
    "telefono": telefono,
    "documento": documento,
    "distrito": distrito,
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print("Solicitud exitosa");
    } else {
      print("Error en la solicitud: ${response.statusCode}");
    }
  } catch (error) {
    print("Error: $error");
  }
}
}
