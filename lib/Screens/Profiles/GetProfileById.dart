import 'package:http/http.dart' as http;
import 'dart:convert'; // Importa la biblioteca 'dart:convert' para trabajar con JSON

class GetProfileByID {
  Future getProfile(String profileId) async {
    final apiUrl = Uri.parse('http://192.168.0.101:4000/api/profile/$profileId');

    try {
      final response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Parsea el cuerpo de la respuesta JSON
        final Map<String, dynamic> profileData = jsonDecode(response.body);

        // Accede a los campos individuales del perfil
        final String nombre = profileData['nombre'];
        final String correoElectronico = profileData['correoElectronico'];
        final String telefono = profileData['telefono'];

        // Ahora puedes trabajar con estos datos, por ejemplo, imprimirlos
        print('Nombre: $nombre');
        print('Correo Electrónico: $correoElectronico');
        print('Teléfono: $telefono');

        // También puedes devolver los datos o hacer cualquier otra cosa que necesites hacer con ellos
      } else {
        // Maneja el error de obtener el perfil aquí.
        print('Error al obtener el perfil. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      // Maneja los errores de solicitud aquí.
      print('Error en la solicitud: $error');
    }
  }
}
