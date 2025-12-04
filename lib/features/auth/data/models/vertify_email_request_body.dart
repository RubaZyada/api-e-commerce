class VertifyEmailRequestBody {
  final String email;
  final String otp;

  VertifyEmailRequestBody({
    required this.email,
    required this.otp,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
    };
  }
}