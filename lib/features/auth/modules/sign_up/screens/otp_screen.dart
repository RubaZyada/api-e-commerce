import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../cubit/register_cubit.dart';

class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Email"), centerTitle: true),

      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          /// ❌ FAILURE
          if (state is RegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error.errors.isNotEmpty
                      ? state.error.errors.first
                      : (state.error.errorMessage ?? "Something went wrong"),
                ),
                backgroundColor: Colors.red,
              ),
            );
          }

          /// ✔ SUCCESS
          if (state is OtpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("OTP Verified Successfully!"),
                backgroundColor: Colors.green,
              ),
            );

            Navigator.pushReplacementNamed(context, "/login");
          }
        },

        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Enter the 6-digit code sent to:\n${widget.email}",
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                /// OTP Field
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  onChanged: (value) => otpCode = value,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 55,
                    fieldWidth: 45,
                    inactiveColor: Colors.grey,
                    activeColor: Colors.blue,
                    selectedColor: Colors.blue,
                  ),
                ),

                const SizedBox(height: 30),

                /// VERIFY BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: state is RegisterLoading
                        ? null
                        : () {
                            if (otpCode.length == 6) {
                              context.read<RegisterCubit>().verifyOtp(
                                email: widget.email,
                                otp: otpCode,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Please enter the 6-digit code",
                                  ),
                                ),
                              );
                            }
                          },
                    child: state is RegisterLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Verify",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
