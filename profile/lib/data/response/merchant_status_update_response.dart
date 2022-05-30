class MerchantStatusUpdateResponse {
    MerchantStatusUpdateResponse({
        this.statusCode,
        this.data,
        this.message,
    });

    String? statusCode;
    MerchantStatusUpdateData? data;
    String? message;

    factory MerchantStatusUpdateResponse.fromJson(Map<String, dynamic> json) => MerchantStatusUpdateResponse(
        statusCode: json["statusCode"],
        data: json["data"] == null ? null : MerchantStatusUpdateData.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": data == null ? null : data?.toJson(),
        "message": message,
    };
}

class MerchantStatusUpdateData {
    MerchantStatusUpdateData({
        this.status,
        this.remark,
    });

    String? status;
    String? remark;

    factory MerchantStatusUpdateData.fromJson(Map<String, dynamic> json) => MerchantStatusUpdateData(
        status: json["status"],
        remark: json["remark"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "remark": remark,
    };
}
