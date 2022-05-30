class MerchantResponse {
    MerchantResponse({
        this.status,
        this.merchantId,
        this.url,
    });

    String? status;
    int? merchantId;
    String? url;

    factory MerchantResponse.fromJson(Map<String, dynamic> json) => MerchantResponse(
        status: json["status"],
        merchantId: json["merchant_id"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "merchant_id": merchantId,
        "url": url,
    };
}
