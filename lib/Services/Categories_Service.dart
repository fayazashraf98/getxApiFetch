import 'dart:convert';

import 'package:e_shoping/Models/Categories_Response.dart';
import 'package:e_shoping/Models/Login_Response.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static var client = http.Client;

  static Future<CategoriesResponse> CategoryFetch() async {
    var response = await http.get(
        Uri.parse('http://ishaqhassan.com:2000/category'),
        headers: {'Authorization': 'Bearer ${LoginData().accessToken}'});
    var ResponseJson = jsonDecode(response.body);
    // var ResponseJson = CategoriesResponse.fromJson(jsonDecode(response.body));
    return CategoriesResponse.fromJson(ResponseJson);
  }
}
