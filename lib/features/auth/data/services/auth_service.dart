import 'package:api_ecommerce_app/core/networking/api_constants.dart';
import 'package:api_ecommerce_app/features/auth/data/models/login_response.dart';
import 'package:api_ecommerce_app/features/auth/data/models/login_request_body.dart';
import 'package:api_ecommerce_app/features/auth/data/models/signup_request_body.dart';
import 'package:api_ecommerce_app/features/auth/data/models/vertify_email_request_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST("auth/login")
  Future<LoginResponse> login({@Body() required LoginRequestBody body});
//@post indpoint
    @POST("auth/register")
  Future<void> register({@Body() required SignUpRequestBody body});

 @POST("auth/verify-email")
  Future<void> verifyEmail({@Body() required VertifyEmailRequestBody body});
}