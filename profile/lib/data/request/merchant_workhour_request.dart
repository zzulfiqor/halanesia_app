import '../response/merchant_workhour_response.dart';

class MerchantWorkhourRequest {
    MerchantWorkhourRequest({
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