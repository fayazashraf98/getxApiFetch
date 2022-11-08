import 'package:e_shoping/Views/Dashboard_View.dart';
import 'package:e_shoping/Views/Login_View.dart';
import 'package:e_shoping/Views/Splashscreen_View.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Views/Signup_View.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginUser(),
        '/singUp': (context) => SignUp(),
        '/Dashboard': (context) => Dashboard(),
      },
    );
  }
}
