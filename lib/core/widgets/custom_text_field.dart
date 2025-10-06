import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.textInputType = TextInputType.text,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
