import "dart:convert";
import 'dart:core';
import 'package:fidelo/Screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/LoginScreens/Login.dart';
import 'GlobalVariables.dart';

class Auth{
  LoginIn()async {
    if ("${GlobalVariables.idProfile}" != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("tokken", true);
      prefs.setString("id", "${GlobalVariables.idProfile}");
    }else{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("tokken", false);
    }
  }
  static LogedIn()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("id", "${GlobalVariables.idProfile}");    
    }

  //LOGIN
static Future<http.Response> login(
    BuildContext context, String email, String password) async {
  final url = Uri.parse("http://api.fidelo.pe:4000/api/auth/login");
  final headers = {
    "Content-Type": "application/json",
  };
  final body = jsonEncode({
    "usuario": email,
    "contrasena": password,
  });
  final response =  await http.post(url, headers: headers, body: body);
  if(response.statusCode == 200){
    final cookies = response.headers["set-cookie"];
    GlobalVariables.cookie= cookies;
  }else{
    print("No pasa nada 1");
  }
    
  return response;
}


//REGISTRO
  static Future<Map<String, dynamic>> register(String email, String password) async {
    final url = Uri.parse("http://api.fidelo.pe:4000/api/auth/register");
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      "usuario": email,
      "contrasena": password,
      "roles": ["usercli"],
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final idProfile = data["id"];
      GlobalVariables.idProfile = idProfile;
      final cookies = response.headers["set-cookie"];
      GlobalVariables.cookie = cookies;
      return data;
    } else {
      return {
        "error": "Registration failed",
      };
    }
  }


//LOGOUT
  static Future logout(BuildContext context) async {
  final logoutUrl = Uri.parse('http://api.fidelo.pe:4000/api/auth/logout');
  final response = await http.post(logoutUrl);

  if (response.statusCode == 200) {
    GlobalVariables.idProfile = "sin datos";
    LogedIn();
    print("${GlobalVariables.idProfile}");
    // Logout successful, you can perform any necessary actions here
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()), // Navegar a la pantalla de inicio de sesión
    );
  } else {
  print("error de logueo");
  }
}

Future<void> obtenerIdProfile(String email, String password) async {
  final url = Uri.parse("http://api.fidelo.pe:4000/api/auth/login");
  final headers = {
    "Content-Type": "application/json",
  };
  final body = jsonEncode({
    "usuario": email,
    "contrasena": password,
  });
  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    // Busca el valor de "_id" en la respuesta
    final idProfile = responseData["id"];
    GlobalVariables.idProfile = idProfile;
    LoginIn();
    // Guarda el valor en la variable global
      print("esta es la otra print + ${GlobalVariables.idProfile}");
  } else {
    // Maneja el error si la solicitud no fue exitosa
    print("Error en la solicitud: ${response.statusCode}");
    // También puedes lanzar una excepción o realizar otras acciones de manejo de errores aquí
  }
}
}
