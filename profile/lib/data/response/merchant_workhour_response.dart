class MerchantWorkhourResponse {
    MerchantWorkhourResponse({
        this.monday,
        this.tuesday,
        this.wednesday,
        this.thursday,
        this.friday,
        this.saturday,
        this.sunday,
    });

    MerchantDay? monday;
    MerchantDay? tuesday;
    MerchantDay? wednesday;
    MerchantDay? thursday;
    MerchantDay? friday;
    MerchantDay? saturday;
    MerchantDay? sunday;

    factory MerchantWorkhourResponse.fromJson(Map<String, dynamic> json) => MerchantWorkhourResponse(
        monday: json["monday"] == null ? null : MerchantDay.fromJson(json["monday"]),
        tuesday: json["tuesday"] == null ? null : MerchantDay.fromJson(json["tuesday"]),
        wednesday: json["wednesday"] == null ? null : MerchantDay.fromJson(json["wednesday"]),
        thursday: json["thursday"] == null ? null : MerchantDay.fromJson(json["thursday"]),
        friday: json["friday"] == null ? null : MerchantDay.fromJson(json["friday"]),
        saturday: json["saturday"] == null ? null : MerchantDay.fromJson(json["saturday"]),
        sunday: json["sunday"] == null ? null : MerchantDay.fromJson(json["sunday"]),
    );
}

class MerchantDay {
    MerchantDay({
        this.open,
        this.startHour,
        this.endHour,
    });

    bool? open;
    String? startHour;
    String? endHour;

    factory MerchantDay.fromJson(Map<String, dynamic> json) => MerchantDay(
        open: json["open"],
        startHour: json["start_hour"] == null ? "00:00" : json["start_hour"],
        endHour: json["end_hour"] == null ? "00:00" : json["end_hour"],
    );

    Map<String, dynamic> toJson() => {
        "open": open,
        "start_hour": startHour,
        "end_hour": endHour,
    };
}
