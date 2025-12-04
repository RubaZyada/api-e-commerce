part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final String email;
  RegisterSuccess(this.email);
}

class OtpSuccess extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final ApiErrorModel error;
  RegisterFailure({required this.error});
}
