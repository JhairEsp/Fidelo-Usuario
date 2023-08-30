import "dart:convert";
import 'dart:core';
import 'dart:math';
import 'package:fidelo/Screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth{
  //LOGIN
  static Future<void> login(BuildContext context, String email, String password) async{
    final url = Uri.parse("http://192.168.0.101:4000/api/auth/login");
    final headers = {
      "Content-Type" : "application/json",
    };
    final body = jsonEncode({
      "usuario": email,
      "contrasena": password,
    });
    final response = await http.post(url, headers: headers, body: body);
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
    }else{
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("Error"),
          content: Text("Login Failed. Please check your credentials"),
          actions: [
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text("OK"),
              ),
          ],
        )
        );
    }
  }


//REGISTRO
  static Future<Map<String, dynamic>> register(String email, String password) async {
    final url = Uri.parse("http://192.168.0.101:4000/api/auth/register");
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
      return data;
    } else {
      return {
        "error": "Registration failed",
      };
    }
  }


//LOGOUT
  static Future logout(BuildContext context) async {
  final logoutUrl = Uri.parse('http://192.168.0.101:4000/api/auth/logout');
  final response = await http.post(logoutUrl);

  if (response.statusCode == 200) {
    // Logout successful, you can perform any necessary actions here
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()), // Navegar a la pantalla de inicio de sesión
    );
  } else {
    // Handle error if logout was not successful
    print('Logout failed');
  }
}

}
