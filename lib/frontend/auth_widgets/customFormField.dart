import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customFormField(
    {bool isPassword = false,
    required TextEditingController controller,
    required String hint,
    required String Function(String) validator}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Vx.gray300,
    ),
    child: TextFormField(
      validator: validator as String? Function(String?),
      controller: controller,
      obscureText: isPassword,
      style: TextStyle(fontSize: 22, color: Colors.grey[800]),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    ),
  );
}
