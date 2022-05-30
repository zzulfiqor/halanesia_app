class MerchantStatusRequest {
    MerchantStatusRequest({
        this.status,
    });

    int? status;

    Map<String, dynamic> toJson() => {
      "status": status,
    };
}