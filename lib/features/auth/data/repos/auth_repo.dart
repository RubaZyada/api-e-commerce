import 'package:api_ecommerce_app/config/cache/cache_constants.dart';
import 'package:api_ecommerce_app/config/cache/cache_helper.dart';
import 'package:api_ecommerce_app/core/networking/api_result.dart';
import 'package:api_ecommerce_app/features/auth/data/models/login_request_body.dart';
import 'package:api_ecommerce_app/features/auth/data/models/login_response.dart';
import 'package:api_ecommerce_app/features/auth/data/models/signup_request_body.dart';
import 'package:api_ecommerce_app/features/auth/data/models/vertify_email_request_body.dart';
import 'package:api_ecommerce_app/features/auth/data/services/auth_service.dart';

class AuthRepo {
  final AuthService service;
  AuthRepo({required this.service});
  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await service.login(body: body);
      await CacheHelper.setSecureData(
        key: CacheConstants.accessToken,
        value: response.accessToken,
      );
      await CacheHelper.setSecureData(
        key: CacheConstants.refreshToken,
        value: response.refreshToken,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  Future<ApiResult<void>> register(SignUpRequestBody body) async {
    try {
      final response = await service.register(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  Future<ApiResult<void>> verifyEmail({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await service.verifyEmail(
        body: VertifyEmailRequestBody(email: email, otp: otp),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }
}
