class ShippingOptionRequest {
    ShippingOptionRequest({
        this.options,
    });

    List<int>? options;

    factory ShippingOptionRequest.fromJson(Map<String, dynamic> json) => ShippingOptionRequest(
        options: List<int>.from(json["options"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "options": List<dynamic>.from(options!.map((x) => x)),
    };
}
