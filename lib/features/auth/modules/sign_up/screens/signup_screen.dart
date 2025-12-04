import 'package:api_ecommerce_app/core/di.dart';
import 'package:api_ecommerce_app/features/auth/modules/sign_up/cubit/register_cubit.dart';
import 'package:api_ecommerce_app/features/auth/modules/sign_up/widget/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(repo: getIt()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                registerHeader(), // 🔹 نفس شكل الهيدر تبع Login
                const SizedBox(height: 40),
                const RegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget registerHeader() {
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
      children: const [
        SizedBox(height: 50),
        Text(
          "Create Your Account ✨",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Fill in your information below to get started.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54, fontSize: 14),
        ),
      ],
    ),
  );
}
