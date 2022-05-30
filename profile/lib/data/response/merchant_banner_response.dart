class MerchantBannerResponse {
    MerchantBannerResponse({
        this.statusCode,
        this.data,
        this.message,
    });

    String? statusCode;
    MerchantBannerData? data;
    String? message;

    factory MerchantBannerResponse.fromJson(Map<String, dynamic> json) => MerchantBannerResponse(
        statusCode: json["statusCode"],
        data: json["data"] == null ? null : MerchantBannerData.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": data == null ? null : data?.toJson(),
        "message": message,
    };
}

class MerchantBannerData {
    MerchantBannerData({
        this.banner,
    });

    String? banner;

    factory MerchantBannerData.fromJson(Map<String, dynamic> json) => MerchantBannerData(
        banner: json["banner"],
    );

    Map<String, dynamic> toJson() => {
        "banner": banner,
    };
}
