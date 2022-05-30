class LoginResponse {
  LoginResponse(
      {required this.accessToken,
        required this.refreshToken,
        required this.expiresIn,
        required this.refreshExpiresIn,
        required this.tokenType});

  late final String accessToken;
  late final String refreshToken;
  late final String expiresIn;
  late final String refreshExpiresIn;
  late final String tokenType;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    expiresIn = json['expires_in'];
    refreshExpiresIn = json['refresh_expires_in'];
    tokenType = json['token_type'];
  }
}
