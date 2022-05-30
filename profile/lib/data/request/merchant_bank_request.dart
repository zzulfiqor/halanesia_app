class MerchantBankRequest {
    MerchantBankRequest({
        this.bankId,
        this.accountName,
        this.accountNo,
        this.isPrimary,
    });

    int? bankId;
    String? accountName;
    String? accountNo;
    bool? isPrimary;

    Map<String, dynamic> toJson() => {
        "bank_id": bankId,
        "account_name": accountName,
        "account_no": accountNo,
        "is_primary": isPrimary,
    };
}
