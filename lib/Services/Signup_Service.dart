import 'dart:convert';
import 'package:e_shoping/Models/Signup_Response.dart';
import 'package:http/http.dart' as http;

class SignupService {
  static var client = http.Client;
  static Future<SignupResponse> signupUser(
      String email, String phone, String password) async {
    var response =
        await http.post(Uri.parse('http://ishaqhassan.com:2000/user'), body: {
      'email': email,
      'phone': phone,
      'password': password,
    });
    var JsonResponse = jsonDecode(response.body);
    return SignupResponse.fromJson(JsonResponse);
  }
}
