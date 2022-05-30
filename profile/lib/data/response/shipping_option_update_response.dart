class ShippingOptionUpdateResponse {
    ShippingOptionUpdateResponse({
        this.status,
        this.id,
    });

    String? status;
    int? id;

    factory ShippingOptionUpdateResponse.fromJson(Map<String, dynamic> json) => ShippingOptionUpdateResponse(
        status: json["status"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "id": id,
    };
}
