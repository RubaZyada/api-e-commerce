import 'package:api_ecommerce_app/core/common/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isPasswordVisible = false; // moved outside build
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'Password',
      hintText: '********',
      controller: widget.controller,
      isPassword: !isPasswordVisible,
      suffixIcon: IconButton(
        icon: Icon(
          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: () {
          setState(() {
            isPasswordVisible = !isPasswordVisible;
          });
        },
      ),
    );
  }
}
