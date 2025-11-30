import 'package:api_ecommerce_app/core/networking/api_error_model.dart';
import 'package:api_ecommerce_app/core/networking/local_states_codes.dart';
import 'package:flutter/material.dart';

class ApiErrorFactory {
   static ApiErrorModel get defaultError => ApiErrorModel(
        errorMessage: "Something went wrong",
        statuscode: LocalStatusCodes.defaultError,
        icon: Icons.error,
         errors: ["Error Occured!"]
      );
}