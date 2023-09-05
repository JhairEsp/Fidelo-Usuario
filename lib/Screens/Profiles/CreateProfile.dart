import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateProfile {
   

  Future<void> emailProfile(String email) async {
    final apiUrl = Uri.parse('http://192.168.0.101:4000/api/profile');

    final requestBody = {
      "correoElectronico": email,
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
        print('Email creado con éxito');
        
      } else {
        // Error al crear el perfil, puedes manejar el error aquí.
        print('Error al crear el email. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      // Maneja los errores de solicitud aquí.
      print('Error en la solicitud: $error');
    }
  }

  Future<void> Datos1(String nombre, String apellidoPaterno, String apellidoMaterno) async {

    final apiUrl = Uri.parse('http://192.168.0.101:4000/api/profile'); // Usar la ID del perfil

    final requestBody = {
      "nombre": nombre,
      "apellidopat": apellidoPaterno,
      "apellidomat": apellidoMaterno,
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
        // El perfil se actualizó correctamente, puedes manejar la respuesta aquí.
        print('Datos1 creado con éxito');
      } else {
        // Error al crear los datos1, puedes manejar el error aquí.
        print('Error al crear los datos1. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      // Maneja los errores de solicitud aquí.
      print('Error en la solicitud: $error');
    }
  }

  Future<void> Datos2(String telefono, String dni, String distrito) async {
    // Verificar si profileId tiene un valor antes de continuar

    final apiUrl = Uri.parse('http://192.168.0.101:4000/api/profile'); // Usar la ID del perfil

    final requestBody = {
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
        // El perfil se actualizó correctamente, puedes manejar la respuesta aquí.
        print('Datos2 creado con éxito');
      } else {
        // Error al crear los datos2, puedes manejar el error aquí.
        print('Error al crear los datos2. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      // Maneja los errores de solicitud aquí.
      print('Error en la solicitud: $error');
    }
  }



  
}
