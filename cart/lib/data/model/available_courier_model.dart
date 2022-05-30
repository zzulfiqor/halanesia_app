class AvailableCourierModel {
  int? id;
  String? name;
  int? price;
  DateTime? estimationTimeBegin;
  DateTime? estimationTimeEnd;

  AvailableCourierModel({
    this.name,
    this.price,
    this.estimationTimeBegin,
    this.estimationTimeEnd,
    this.id,
  });
}

List<AvailableCourierModel> availableCourier = [
  AvailableCourierModel(
    id: 1,
    name: 'Reguler',
    price: 42000,
    estimationTimeBegin: DateTime.now(),
    estimationTimeEnd: DateTime.now(),
  ),
  AvailableCourierModel(
    id: 2,
    name: 'Ekonomi',
    price: 30000,
    estimationTimeBegin: DateTime.now(),
    estimationTimeEnd: DateTime.now(),
  ),
  AvailableCourierModel(
    id: 3,
    name: 'Kargo',
    price: 12000,
    estimationTimeBegin: DateTime.now(),
    estimationTimeEnd: DateTime.now(),
  ),
  AvailableCourierModel(
    id: 4,
    name: 'Kargo',
    price: 60000,
    estimationTimeBegin: DateTime.now(),
    estimationTimeEnd: DateTime.now(),
  ),
];
