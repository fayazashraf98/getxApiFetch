import 'dart:convert';

import 'package:e_shoping/Models/Signout_Response.dart';
import 'package:http/http.dart' as http;

class SignoutServices {
  static var client = http.Client;
  static Future<SignoutResponse> SignoutUser(String token) async {
    var response = await http
        .get(Uri.parse('http://ishaqhassan.com:2000/user/signout'), headers: {
      "Authorization": "Bearer ${{token}}"
    });
    var JsonResponse = json.decode(response.body);
    return SignoutResponse.fromJson(JsonResponse);
  }
}
