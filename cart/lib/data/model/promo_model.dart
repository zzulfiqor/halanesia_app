class PromoModel {
  int? id;
  String? title;
  DateTime? endDate;

  PromoModel({
    this.id,
    this.title,
    this.endDate,
  });
}

List<PromoModel> promoList = [
  PromoModel(
    id: 1,
    title: 'Promo 1',
    endDate: DateTime.now().add(Duration(days: 10)),
  ),
  PromoModel(
    id: 2,
    title: 'Promo 2',
    endDate: DateTime.now().add(Duration(days: 15)),
  ),
  PromoModel(
    id: 3,
    title: 'Promo 3',
    endDate: DateTime.now().add(Duration(days: 20)),
  ),
  PromoModel(
    id: 4,
    title: 'Promo 4',
    endDate: DateTime.now().add(Duration(days: 25)),
  ),
];
