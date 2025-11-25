import 'package:api_ecommerce_app/core/common/widgets/app_elevated_button.dart';
import 'package:api_ecommerce_app/core/common/widgets/custom_text_filed.dart';
import 'package:api_ecommerce_app/features/auth/data/models/login_request_body.dart';
import 'package:api_ecommerce_app/features/auth/modules/common/password_text_field.dart';
import 'package:api_ecommerce_app/features/auth/modules/log_in/cubit/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // EMAIL TEXT FIELD
          CustomTextField(
            labelText: 'Email',
            hintText: 'dfewqwef@gmail.com',
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // PASSWORD TEXT FIELD
          PasswordTextField(controller: passwordController),
          // REMEMBER ME AND FORGOT PASSWORD
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (val) {},
                  activeColor: Colors.blue,
                ),
                const Text("Remember Me", style: TextStyle(fontSize: 11)),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(color: Colors.red, fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // LOGIN BUTTON
          AppElevatedButton(onPressed: () {
            if (!formKey.currentState!.validate()) {
              context.read<LoginCubit>().login(
                 LoginRequestBody(
                   email: emailController.text,
                   password: passwordController.text,
                 )
                );
            }
            
            
          }, title: 'Log in'),
          const SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don’t have an account? "),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
