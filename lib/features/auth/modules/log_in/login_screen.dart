import 'package:api_ecommerce_app/core/common/widgets/app_elevated_button.dart';
import 'package:api_ecommerce_app/core/common/widgets/custom_text_filed.dart';
import 'package:api_ecommerce_app/features/auth/modules/common/password_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final TextEditingController passwordController=TextEditingController();
   final TextEditingController emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // TOP CURVED HEADER
              top_header(),
              const SizedBox(height: 40),
              // EMAIL TEXT FIELD
              CustomTextField(labelText: 'Email', hintText: 'dfewqwef@gmail.com', controller: emailController),
              const SizedBox(height: 20),
              // PASSWORD TEXT FIELD
              PasswordTextField(controller: passwordController),
              const SizedBox(height: 30),
              // LOGIN BUTTON
              AppElevatedButton(onPressed: () {  }, title: 'Log in'),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

Widget top_header() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFBFD7FF), Color(0xFFEAF2FF)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
    ),
    child: Column(
      children: [
        
        const SizedBox(height: 50),
        const Text(
          "Hello, Welcome Back 👋",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Happy to see you again, please login here.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54, fontSize: 14),
        ),
      ],
    ),
  );
}
