class OtpRequest {
  String email;
  String otp;

  OtpRequest({required this.email, required this.otp});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['otp'] = otp;
    return data;
  }
}