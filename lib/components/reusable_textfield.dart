import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? errorText;

  ReusableTextField(
      {required this.hintText,
        required this.controller,
        required this.obscureText,
        required this.keyboardType,
        required this.textInputAction,
        this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true,
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          errorText: errorText,
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: Colors.grey),
              borderRadius: BorderRadius.circular(15.0))),
    );
  }
}