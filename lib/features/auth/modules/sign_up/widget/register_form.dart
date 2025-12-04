import 'package:api_ecommerce_app/core/common/widgets/app_elevated_button.dart';
import 'package:api_ecommerce_app/core/common/widgets/custom_text_filed.dart';
import 'package:api_ecommerce_app/features/auth/data/models/signup_request_body.dart';
import 'package:api_ecommerce_app/features/auth/modules/common/password_text_field.dart';
import 'package:api_ecommerce_app/features/auth/modules/sign_up/cubit/register_cubit.dart';
import 'package:api_ecommerce_app/features/auth/modules/sign_up/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        /// ❌ Register Failure
        if (state is RegisterFailure) {
          print("ERROR MESSAGE: ${state.error.errorMessage}");
          print("ERRORS LIST: ${state.error.errors}");

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error.errors.isNotEmpty
                    ? state.error.errors.first
                    : (state.error.errorMessage ?? "Error"),
              ),
              backgroundColor: const Color.fromARGB(255, 224, 127, 121),
            ),
          );
        }

        /// ✔ Register Success → Move to OTP
        if (state is RegisterSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<RegisterCubit>(),
                child: OtpScreen(email: state.email),
              ),
            ),
          );
        }

        /// ✔ OTP Success → Move to login
        if (state is OtpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('OTP Verification Successful!'),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.pushReplacementNamed(context, "/homeScreen");
        }
      },

      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// First Name
              CustomTextField(
                labelText: "First Name",
                hintText: "Enter your first name",
                controller: firstnameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "First name is required";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              /// Last Name
              CustomTextField(
                labelText: "Last Name",
                hintText: "Enter your last name",
                controller: lastnameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Last name is required";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              /// Email
              CustomTextField(
                labelText: "Email",
                hintText: "Enter your email",
                controller: emailController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email is required";
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              /// Password
              PasswordTextField(
                controller: passwordController,
                isConfirm: false,
              ),

              const SizedBox(height: 20),

              /// Confirm Password
              PasswordTextField(
                controller: confirmPasswordController,
                isConfirm: true,
                passwordToMatch: passwordController,
              ),

              const SizedBox(height: 30),

              /// Register Button
              AppElevatedButton(
                title: "Register",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<RegisterCubit>().register(
                      SignUpRequestBody(
                        firstName: firstnameController.text.trim(),
                        lastName: lastnameController.text.trim(),
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      ),
                    );
                  }
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
