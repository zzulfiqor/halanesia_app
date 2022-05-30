class UserInfoRequest {
  UserInfoRequest({
    this.fullname,
    this.email,
    this.phone,
  });

  String? fullname;
  String? email;
  String? phone;

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "email": email,
        "phone": phone,
      };
}
