import 'dart:convert';
import 'package:fidelo/Screens/Profiles/GetProfileById.dart';
import 'package:http/http.dart' as http;

import '../../models/GlobalVariables.dart';

class CreateProfile {

  Future<String?> UserProfile(String email, String nombre, String apellidoPaterno, String apellidoMaterno, String telefono, String dni, String distrito) async {
    final apiUrl = Uri.parse('http://192.168.0.101:4000/api/profile');

    final requestBody = {
      "correoElectronico": email,
      "nombre": nombre,
      "apellidopat": apellidoPaterno,
      "apellidomat": apellidoMaterno, 
      "telefono": telefono,
      "documento": dni,
      "distrito": distrito,
    };
    
    try {
      final response = await http.post(
        apiUrl,
        body: jsonEncode(requestBody),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        // El perfil se creó correctamente, puedes manejar la respuesta aquí.
        final responseBody = jsonDecode(response.body);
        final profileId = responseBody["_id"]; // Aquí obtenemos la ID del perfil
        GlobalVariables.idProfile = profileId; // Asigna la ID del perfil a la variable global
        print('Email creado con éxito. ID del perfil: $profileId');
        //;
        return profileId;
        // Puedes guardar profileId en un lugar accesible para otras partes de tu aplicación
      } else {
        // Error al crear el perfil, puedes manejar el error aquí.
        print('Error al crear el email. Código de estado: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      // Maneja los errores de solicitud aquí.
      print('Error en la solicitud: $error');
      return null;
    }
  }
}