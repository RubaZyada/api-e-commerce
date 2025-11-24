import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField ({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
     this.isPassword =false,
    this.errortext, this.suffixIcon,

  });
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword ;
  final String? errortext;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            
            style: const TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              errorText: errortext,
              hintText: hintText,
              suffixIcon: suffixIcon,
              hintStyle: const TextStyle(color: Colors.black54),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.black26),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.black87),
              ),
              filled: true,
              fillColor: const Color(0xFFF1F3F6),
            ),
          ),
        ),
      ],
    );
  }
}
