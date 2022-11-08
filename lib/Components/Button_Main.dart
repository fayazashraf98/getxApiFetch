import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonMain extends StatelessWidget {
  String placeholder;
  ButtonMain(this.placeholder);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color(0x406cc51d),
          Color(0xff6CC51D),
        ]),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            placeholder,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
