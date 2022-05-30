class OtpResponse {
  OtpResponse({required this.status});

  late final bool status;

  OtpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }
}
