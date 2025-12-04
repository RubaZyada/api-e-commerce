import 'package:api_ecommerce_app/core/common/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;

  /// if this is a confirm password field
  final bool isConfirm;

  /// the original password controller to compare with
  final TextEditingController? passwordToMatch;

  const PasswordTextField({
    super.key,
    required this.controller,
    this.isConfirm = false,
    this.passwordToMatch,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.isConfirm
              ? 'Please confirm your password'
              : 'Please enter your password';
        }

        if (value.length < 6) {
          return 'Password must be at least 6 characters long';
        }

        /// 🔥 Validation خاص للـ Confirm Password
        if (widget.isConfirm) {
          if (value != widget.passwordToMatch?.text.trim()) {
            return 'Passwords do not match';
          }
        }

        return null;
      },
      labelText: widget.isConfirm ? 'Confirm Password' : 'Password',
      hintText: '********',
      controller: widget.controller,
      isPassword: !isPasswordVisible,
      suffixIcon: IconButton(
        icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            isPasswordVisible = !isPasswordVisible;
          });
        },
      ),
    );
  }
}
