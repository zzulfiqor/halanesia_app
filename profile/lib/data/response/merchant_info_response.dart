class MerchantInfoResponse {
    MerchantInfoResponse({
        this.name,
        this.email,
        this.profile,
        this.banner,
        this.status,
        this.remarkStatus,
    });

    String? name;
    String? email;
    dynamic? profile;
    String? banner;
    int? status;
    String? remarkStatus;

    factory MerchantInfoResponse.fromJson(Map<String, dynamic> json) => MerchantInfoResponse(
        name: json["name"],
        email: json["email"],
        profile: json["profile"],
        banner: json["banner"],
        status: json["status"],
        remarkStatus: json["remark_status"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "profile": profile,
        "banner": banner,
        "status": status,
        "remark_status": remarkStatus,
    };
}
