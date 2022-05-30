class MerchantBankResponse {
    MerchantBankResponse({
        this.createdDate,
        this.updatedDate,
        this.merchantBankId,
        this.bankId,
        this.accountName,
        this.accountNo,
        this.isPrimary,
        this.status,
        this.merchantId,
    });

    DateTime? createdDate;
    DateTime? updatedDate;
    int? merchantBankId;
    int? bankId;
    String? accountName;
    String? accountNo;
    bool? isPrimary;
    int? status;
    int? merchantId;

    factory MerchantBankResponse.fromJson(Map<String, dynamic> json) => MerchantBankResponse(
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        merchantBankId: json["merchant_bank_id"],
        bankId: json["bank_id"],
        accountName: json["account_name"],
        accountNo: json["account_no"],
        isPrimary: json["is_primary"],
        status: json["status"],
        merchantId: json["merchant_id"],
    );

    Map<String, dynamic> toJson() => {
        "created_date": createdDate!.toIso8601String(),
        "updated_date": updatedDate!.toIso8601String(),
        "merchant_bank_id": merchantBankId,
        "bank_id": bankId,
        "account_name": accountName,
        "account_no": accountNo,
        "is_primary": isPrimary,
        "status": status,
        "merchant_id": merchantId,
    };
}
