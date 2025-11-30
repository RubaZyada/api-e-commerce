
import 'package:api_ecommerce_app/config/cache/cache_constants.dart';
import 'package:api_ecommerce_app/config/cache/cache_helper.dart';
import 'package:api_ecommerce_app/config/router/app_router.dart';
import 'package:api_ecommerce_app/config/router/routes.dart';
import 'package:api_ecommerce_app/core/di.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
void main() async {
  setupDependencyInjection();
   WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
   final String ? accessToken=await CacheHelper.getSecureData(key: CacheConstants.accessToken);
   log(accessToken?? "null");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.login,
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}
