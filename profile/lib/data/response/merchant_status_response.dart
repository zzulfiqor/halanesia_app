class MerchantStatusResponse {
    MerchantStatusResponse({
        this.status,
        this.remark,
    });

    dynamic? status;
    String? remark;

    factory MerchantStatusResponse.fromJson(Map<String, dynamic> json) => MerchantStatusResponse(
        status: json["status"],
        remark: json["remark"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "remark": remark,
    };
}
