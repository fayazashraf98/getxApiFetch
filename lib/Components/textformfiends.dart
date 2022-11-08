import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  String placeholder;
  var pre_icon;
  var controller;
  var keyboard;
  final String? Function(String?)? validatorText;
  textfield(this.placeholder, this.pre_icon, this.controller, this.keyboard,
      this.validatorText);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        prefixIcon: Icon(pre_icon),
        hintStyle: TextStyle(color: Color(0xff868889), fontSize: 15),
        hintText: placeholder,
      ),
      validator: validatorText,
    );
  }
}

String? validateEmail(String? value) {
  var NewValu = value ?? '';
  if (NewValu.isEmpty) {
    return 'Email Address Required';
  }
  if (!NewValu.contains('@')) {
    return 'Email Must Contains @';
  }
  return null;
}

String? validatePhone(String? value) {
  var NewValu = value ?? '';
  if (NewValu.isEmpty) {
    return 'Phone Number Required';
  }
  return null;
}
