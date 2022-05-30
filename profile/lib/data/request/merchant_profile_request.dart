class MerchantProfileRequest {
    MerchantProfileRequest({
        this.type,
        this.name,
        this.email,
        this.phone,
    });

    int? type;
    String? name;
    String? email;
    String? phone;

    Map<String, dynamic> toJson() => {
      "type": type,
      "name": name,
      "email": email,
      "phone": phone,
    };
}