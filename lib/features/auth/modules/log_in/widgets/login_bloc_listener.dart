import 'package:api_ecommerce_app/config/router/routes.dart';
import 'package:api_ecommerce_app/core/utils/app_dialog.dart';
import 'package:api_ecommerce_app/features/auth/modules/log_in/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      child: SizedBox.shrink(),
      listener: (context, state) {
      if (state is LoginFailure){ {
         AppDialog().showApiError(context, state.error);
      }}
      else if(state is LoginSuccess){
       // i want to navigate to HomeView using navigator  and remove all previous routes
       Navigator.of(context).pushNamedAndRemoveUntil(RoutesName.home, (route) => false);

      }
    });
  }
}