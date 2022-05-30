class RegisterRequest {
  String email;
  String fullName;
  String password;

  RegisterRequest(
      {required this.email, required this.fullName, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['fullname'] = fullName;
    data['password'] = password;
    return data;
  }
}
