
class LoginResponse {
  final String accessToken;
  final DateTime expiresAtUtc;
  final String refreshToken;

  LoginResponse({
    required this.accessToken,
    required this.expiresAtUtc,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'],
      expiresAtUtc: DateTime.parse(json['expiresAtUtc']),
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'expiresAtUtc': expiresAtUtc.toIso8601String(),
      'refreshToken': refreshToken,
    };
  }
}