
import 'package:api_ecommerce_app/core/networking/api_error_factory.dart';
import 'package:api_ecommerce_app/core/networking/api_error_model.dart';
import 'package:api_ecommerce_app/core/networking/dio_extention_exceptio_type.dart';
import 'package:api_ecommerce_app/core/networking/local_states_codes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiErrorHandler {
  static ApiErrorModel handleError(dynamic e) {
   
    if (e is DioException) {
      return e.when(
        connectionError: () {
          return ApiErrorModel(
            errorMessage: "No internet connection.",
            statuscode: LocalStatusCodes.connectionError,
            icon: Icons.wifi_off,
          );
        },
        connectionTimeout: () {
          return ApiErrorModel(
            errorMessage: "Connection timeout.",
            statuscode: LocalStatusCodes.connectionTimeout,
            icon: Icons.timer_off,
          );
        },
        sendTimeout: () {
          return ApiErrorModel(
            errorMessage: "Send timeout.",
            statuscode: LocalStatusCodes.sendTimeout,
            icon: Icons.upload,
          );
        },
        receiveTimeout: () {
          return ApiErrorModel(
            errorMessage: "Receive timeout.",
            statuscode: LocalStatusCodes.receiveTimeout,
            icon: Icons.download,
          );
        },
        badCertificate: () {
          return ApiErrorModel(
            errorMessage: "Bad certificate.",
            statuscode: LocalStatusCodes.badCertificate,
            icon: Icons.security,
          );
        },
        badResponse: () {
          final code = e.response?.statusCode ?? LocalStatusCodes.badResponse;
          return ApiErrorModel(
            errorMessage:
                "Server returned an unexpected response. Please try again.",
            statuscode: code,
            icon: Icons.warning,
          );
        },
        cancel: () {
          return ApiErrorModel(
            errorMessage: "Request cancelled.",
            statuscode: LocalStatusCodes.cancel,
            icon: Icons.cancel,
          );
        },
        unknown: () {
          return ApiErrorModel(
            errorMessage: "Unexpected error occurred.",
            statuscode: LocalStatusCodes.unknown,
            icon: Icons.error,
          );
        },
      );
    } 
    
    return ApiErrorFactory.defaultError;
  }
}
