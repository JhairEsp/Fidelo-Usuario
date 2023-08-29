import "dart:convert";
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


  
}