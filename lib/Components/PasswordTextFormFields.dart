import 'package:flutter/material.dart';

class Passwordtextfield extends StatefulWidget {
  String placeholder;
  var pre_icon;
  var suf_icon;
  var controller;
  final String? Function(String?)? validator;
  Passwordtextfield(this.placeholder, this.pre_icon, this.suf_icon,
      this.controller, this.validator);

  @override
  State<Passwordtextfield> createState() => _PasswordtextfieldState();
}

class _PasswordtextfieldState extends State<Passwordtextfield> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscure = !obscure;
              });
            },
            icon: Icon(obscure ? Icons.visibility : Icons.visibility_off)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        prefixIcon: Icon(widget.pre_icon),
        hintStyle: const TextStyle(color: Color(0xff868889), fontSize: 15),
        hintText: widget.placeholder,
      ),
      validator: widget.validator,
    );
  }
}

String? validatePassword(String? value) {
  var NewValu = value ?? '';
  if (NewValu.isEmpty) {
    return "Passowrd Required";
  } else if (NewValu.length < 6) {
    return "Password should be atleast 6 characters";
  } else if (NewValu.length > 15) {
    return "Password should not be greater than 15 characters";
  } else
    return null;
}
