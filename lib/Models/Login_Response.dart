// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  String message;
  int statusCode;
  LoginData data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        statusCode: json["statusCode"],
        data: LoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "data": data.toJson(),
      };
}

class LoginData {
  LoginData({
    this.id,
    this.email,
    this.phone,
    this.password,
    this.accessToken,
  });

  int? id;
  String? email;
  String? phone;
  String? password;
  String? accessToken;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone": phone,
        "password": password,
        "accessToken": accessToken,
      };
}
