
import 'package:api_ecommerce_app/core/networking/api_error_model.dart';
import 'package:api_ecommerce_app/core/networking/local_states_codes.dart';
import 'package:flutter/material.dart';

class ApiErrorFactory {
   static ApiErrorModel get defaultError => ApiErrorModel(
        errorMessage: "An unexpected error occurred.",
        statuscode: LocalStatusCodes.defaultError,
        icon: Icons.error,
      );
}