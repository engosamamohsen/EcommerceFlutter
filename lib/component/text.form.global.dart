import 'package:flutter/material.dart';

class TextFormGlobal extends StatelessWidget {
  const TextFormGlobal(
      {super.key,
      required this.hint,
      required this.textInputType,
      required this.obscureText,
      required this.controller});

  final String hint;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7),
          ]),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: textInputType,
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            labelStyle: const TextStyle(color: Colors.grey, height: 1)),
      ),
    );
  }
}
