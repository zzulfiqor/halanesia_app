// class MerchantTypeResponse {
//     MerchantTypeResponse({
//         this.statusCode,
//         this.data,
//         this.message,
//     });

//     String? statusCode;
//     List<MerchantTypeData>? data;
//     String? message;

//     factory MerchantTypeResponse.fromJson(Map<String, dynamic> json) => MerchantTypeResponse(
//         statusCode: json["statusCode"],
//         data: json["data"] == null ? null : List<MerchantTypeData>.from(json["data"].map((x) => MerchantTypeData.fromJson(x))),
//         message: json["message"],
//     );

//     Map<String, dynamic> toJson() => {
//         "statusCode": statusCode,
//         "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
//         "message": message,
//     };
// }

class MerchantTypeResponse {
    MerchantTypeResponse({
        this.merchantTypeId,
        this.merchantTypeTitle,
        this.merchantTypeDesc,
        this.merchantTypeCode,
    });

    int? merchantTypeId;
    String? merchantTypeTitle;
    String? merchantTypeDesc;
    String? merchantTypeCode;

    factory MerchantTypeResponse.fromJson(Map<String, dynamic> json) => MerchantTypeResponse(
        merchantTypeId: json["merchant_type_id"],
        merchantTypeTitle: json["merchant_type_title"],
        merchantTypeDesc: json["merchant_type_desc"],
        merchantTypeCode: json["merchant_type_code"],
    );

    Map<String, dynamic> toJson() => {
        "merchant_type_id": merchantTypeId,
        "merchant_type_title": merchantTypeTitle,
        "merchant_type_desc": merchantTypeDesc,
        "merchant_type_code": merchantTypeCode,
    };
}
