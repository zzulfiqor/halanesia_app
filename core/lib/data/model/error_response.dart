class ErrorResponse {
    ErrorResponse({
        this.statusCode,
        this.errorCode,
        this.errorDesc,
    });

    String? statusCode;
    String? errorCode;
    String? errorDesc;

    factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        statusCode: json["statusCode"],
        errorCode: json["errorCode"],
        errorDesc: json["errorDesc"],
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "errorCode": errorCode,
        "errorDesc": errorDesc,
    };
}
