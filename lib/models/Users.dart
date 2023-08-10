import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
    String id;
    String nombre;
    String apellidopat;
    String apellidomat;
    String correo;
    String telefono;
    String direccion;
    String distrito;
    bool estado;
    DateTime createdAt;
    DateTime updatedAt;

  User({
    required this.id,
    required this.nombre,
    required this.apellidopat,
    required this.apellidomat,
    required this.correo,
    required this.telefono,
    required this.direccion,
    required this.distrito,
    required this.estado,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      nombre: json["nombre"],
      apellidopat: json["apellidopat"],
      apellidomat: json["apellidomat"],
      correo: json["correo"],
      telefono: json["telefono"],
      direccion: json["direccion"],
      distrito: json["distrito"],
      estado: json["estado"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "nombre": nombre,
      "apellidopat": apellidopat,
      "apellidomat": apellidomat,
      "correo": correo,
      "telefono": telefono,
      "direccion": direccion,
      "distrito": distrito,
      "estado": estado,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}

class UserApi {
  final String baseUrl = "http://192.168.0.101:4000/api/user";

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }
  Future<User> getUser(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/$userId'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      return User.fromJson(jsonData);
    } else {
      throw Exception("Failed to load user");
    }
  }
  Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to create user");
    }
  }

  Future<User> updateUser(User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${user.id}'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to update user");
    }
  }

  Future<void> deleteUser(String userId) async {
    final response = await http.delete(Uri.parse('$baseUrl/$userId'));

    if (response.statusCode != 200) {
      throw Exception("Failed to delete user");
    }
  }
}
