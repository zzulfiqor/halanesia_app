class RegisterResponse {
  RegisterResponse(
      {required this.email});

  late final String email;

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }
}
