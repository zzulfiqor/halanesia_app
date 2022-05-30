class MerchantBankDataResponse {
    MerchantBankDataResponse({
        this.bankId,
        this.bankCode,
        this.bankName,
        this.bankDesc,
        this.status,
        this.seq,
        this.createdDate,
        this.updatedDate,
    });

    int? bankId;
    String? bankCode;
    String? bankName;
    String? bankDesc;
    int? status;
    int? seq;
    DateTime? createdDate;
    DateTime? updatedDate;

    factory MerchantBankDataResponse.fromJson(Map<String, dynamic> json) => MerchantBankDataResponse(
        bankId: json["bank_id"],
        bankCode: json["bank_code"],
        bankName: json["bank_name"],
        bankDesc: json["bank_desc"],
        status: json["status"],
        seq: json["seq"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
    );

    Map<String, dynamic> toJson() => {
        "bank_id": bankId,
        "bank_code": bankCode,
        "bank_name": bankName,
        "bank_desc": bankDesc,
        "status": status,
        "seq": seq,
        "created_date": createdDate!.toIso8601String(),
        "updated_date": updatedDate!.toIso8601String(),
    };
}
