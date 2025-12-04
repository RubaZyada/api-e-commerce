import 'package:api_ecommerce_app/core/networking/api_error_model.dart';
import 'package:api_ecommerce_app/features/auth/data/repos/auth_repo.dart';
import 'package:api_ecommerce_app/features/auth/data/models/signup_request_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.repo}) : super(RegisterInitial());

  final AuthRepo repo;

  /// REGISTER USER
  Future<void> register(SignUpRequestBody body) async {
    emit(RegisterLoading());

    final result = await repo.register(body);

    result.when(
      onSuccess: (_) => emit(RegisterSuccess(body.email)),
      onError: (error) => emit(RegisterFailure(error: error)),
    );
  }

  /// VERIFY OTP
  Future<void> verifyOtp({required String email, required String otp}) async {
    emit(RegisterLoading());

    final result = await repo.verifyEmail(email: email, otp: otp);

    result.when(
      onSuccess: (_) => emit(OtpSuccess()),
      onError: (error) => emit(RegisterFailure(error: error)),
    );
  }
}
