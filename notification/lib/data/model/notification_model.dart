class NotificationModel {
  int? id;
  String? title;
  String? subTitle;
  String? time;
  String? type;

  NotificationModel({
    this.id,
    this.title,
    this.subTitle,
    this.time,
    this.type,
  });
}

final notifications = <NotificationModel>[
  NotificationModel(
    id: 1,
    title: 'Ada transaksi yang belum dibayar',
    subTitle: 'Ayo segera bayar!',
    time: '14 Desember 2021, 13:03',
    type: 'User',
  ),
  NotificationModel(
    id: 2,
    title: 'Pesanan sudah sampai',
    subTitle: 'Ayo beri ulasan!',
    time: '14 Desember 2021, 13:03',
    type: 'User',
  ),
  NotificationModel(
    id: 3,
    title: 'Ada transaksi yang belum dibayar',
    subTitle: 'Ayo segera bayar!',
    time: '14 Desember 2021, 13:03',
    type: 'Merchant',
  ),
  NotificationModel(
    id: 4,
    title: 'Pesanan sudah sampai',
    subTitle: 'Ayo beri ulasan!',
    time: '14 Desember 2021, 13:03',
    type: 'Merchant',
  ),
  NotificationModel(
    id: 5,
    title: 'Ada transaksi yang belum dibayar',
    subTitle: 'Ayo segera bayar!',
    time: '14 Desember 2021, 13:03',
    type: 'Merchant',
  ),
];
