import 'package:api_ecommerce_app/core/networking/api_error_model.dart'; 
import 'package:api_ecommerce_app/features/auth/data/models/login_request_body.dart';
import 'package:api_ecommerce_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repo}) : super(LoginInitial());
  //data
  final AuthRepo repo;
  //function
  login(LoginRequestBody body) async {
    emit(LoginLoading());
    final result = await repo.login(body);
    result.when(
      onSuccess: (data) {
        emit(LoginSuccess());
      },
      onError: (error) {
        emit(LoginFailure(error: error));
      },
    ); 
  }
}
