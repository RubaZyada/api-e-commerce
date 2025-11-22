
import 'package:flutter/material.dart';

class ApiErrorModel {
  final String errorMessage;
  final int statuscode;
  final IconData icon;

  ApiErrorModel({
    required this.errorMessage,
    required this.statuscode,
    required this.icon,
  });
}
