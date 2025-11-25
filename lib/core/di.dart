import 'package:api_ecommerce_app/features/auth/data/repos/auth_repo.dart';
import 'package:api_ecommerce_app/features/auth/data/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt  getIt = GetIt.instance;

setupDependencyInjection() {
  _setupAuth();
}

_setupAuth(){
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<AuthService>(AuthService(getIt<Dio>()));
  getIt.registerSingleton<AuthRepo>(AuthRepo(service: getIt<AuthService>()));
    
  
} 