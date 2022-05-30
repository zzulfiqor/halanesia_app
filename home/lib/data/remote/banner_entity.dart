class BannerEntity {
  int? id;
  String? title;
  String? desc;
  String? banner;
  String? url;
  DateTime? expiredAt;

  BannerEntity({
    this.id,
    this.title,
    this.desc,
    this.banner,
    this.url,
    this.expiredAt,
  });

  factory BannerEntity.fromJson(Map<String, dynamic> json) => BannerEntity(
        id: json["id"],
        title: json["title"],
        desc: json["desc"],
        banner: json["banner"],
        url: json["url"],
        expiredAt: DateTime.parse(json["expired_at"]).toLocal(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "desc": desc,
        "banner": banner,
        "url": url,
        "expired_at": expiredAt,
      };
}
