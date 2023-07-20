import 'package:flutter/foundation.dart';

class Usuario{
  String nombre;
  String apellidopat;
  String apellidomat;
  String dni;
  String telefono;
  Map <String, dynamic> direccion;
  Usuario({
  required this.nombre,
  required this.apellidopat,
  required this.apellidomat,
  required this.dni,
  required this.telefono,
  required this.direccion,
  });

  factory Usuario.fromJson(Map<String,dynamic>json){
    return Usuario(
      nombre: json["nombre"],
      apellidopat: json["apellidopat"], 
      apellidomat: json["apellidomat"], 
      dni: json["dni"], 
      telefono: json["telefono"], 
      direccion: json["direccion"]
      );
  }
}

