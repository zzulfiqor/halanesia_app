class MerchantWorkhourUpdateResponse {
    MerchantWorkhourUpdateResponse({
        this.status,
        this.id,
    });

    String? status;
    int? id;

    factory MerchantWorkhourUpdateResponse.fromJson(Map<String, dynamic> json) => MerchantWorkhourUpdateResponse(
        status: json["status"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "id": id,
    };
}
