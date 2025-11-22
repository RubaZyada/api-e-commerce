import 'package:api_ecommerce_app/config/router/router_transitions.dart';
import 'package:api_ecommerce_app/config/router/routes.dart';
import 'package:api_ecommerce_app/features/auth/modules/login/login_screen.dart';
import 'package:api_ecommerce_app/features/home/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case RoutesName.login:
        return RouterTransitions.build(LoginScreen());
      case RoutesName.home:
      return RouterTransitions.buildHorizontal(HomeScreen());  
      default: return RouterTransitions.build(Scaffold(
        body:Center(
          child: Text("No Route"),
        ),
      ));
    }
  }
}