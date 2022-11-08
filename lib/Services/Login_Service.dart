import 'dart:convert';

import 'package:e_shoping/Models/Login_Response.dart';
import 'package:e_shoping/Models/Signup_Response.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  static var client = http.Client;

  static Future<LoginResponse> LoginUser(
      String emailUser, String PasswordUser) async {
    var response = await http
        .post(Uri.parse('http://ishaqhassan.com:2000/user/signin'), body: {
      'email': emailUser,
      'password': PasswordUser,
    });
    var JsonResponse = jsonDecode(response.body);
    return LoginResponse.fromJson(JsonResponse);
  }
}
