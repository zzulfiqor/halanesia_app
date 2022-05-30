class MerchantWorkHourResponse {
    MerchantWorkHourResponse({
        this.monday,
        this.tuesday,
        this.wednesday,
        this.thursday,
        this.friday,
        this.saturday,
        this.sunday,
    });

    Day? monday;
    Day? tuesday;
    Day? wednesday;
    Day? thursday;
    Day? friday;
    Day? saturday;
    Day? sunday;

    factory MerchantWorkHourResponse.fromJson(Map<String, dynamic> json) => MerchantWorkHourResponse(
        monday: json["monday"] != null ? Day.fromJson(json["monday"]) : Day(),
        tuesday:  json["tuesday"] != null ? Day.fromJson(json["tuesday"]) : Day(),
        wednesday:  json["wednesday"] != null ? Day.fromJson(json["wednesday"]) : Day(),
        thursday: json["thursday"] != null ? Day.fromJson(json["thursday"]) : Day(),
        friday:  json["friday"] != null ?  Day.fromJson(json["friday"]) : Day(),
        saturday:  json["saturday"] != null ? Day.fromJson(json["saturday"]) : Day(),
        sunday:  json["sunday"] != null ? Day.fromJson(json["sunday"]) : Day(),
    );

    Map<String, dynamic> toJson() => {
        "monday": monday?.toJson(),
        "tuesday": tuesday?.toJson(),
        "wednesday": wednesday?.toJson(),
        "thursday": thursday?.toJson(),
        "friday": friday?.toJson(),
        "saturday": saturday?.toJson(),
        "sunday": sunday?.toJson(),
    };
}

class Day {
    Day({
        this.open,
        this.startHour,
        this.endHour,
    });

    bool? open;
    String? startHour;
    String? endHour;

    factory Day.fromJson(Map<String, dynamic> json) => Day(
        open: json["open"],
        startHour: json["start_hour"],
        endHour: json["end_hour"],
    );

    Map<String, dynamic> toJson() => {
        "open": open,
        "start_hour": startHour,
        "end_hour": endHour,
    };
}
