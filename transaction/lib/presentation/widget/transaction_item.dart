import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction/controller/transaction_controller.dart';
import 'package:transaction/data/request/transaction_response.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:transaction/utility/enum/transactionStatus.dart';

class TransactionItem extends StatelessWidget {
  final TransactionResponseDataItems? transaction;
  final bool? isBeli;

  const TransactionItem(
      {Key? key, required this.transaction, required this.isBeli})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget statusButton() {
      if (transaction?.status?.code == TransactionStatus.WAITING_PAYMENT.name) {
        return isBeli!
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: note,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      alignment: Alignment.center,
                      child: transaction?.paymentExpiryDate != null
                          ? Text(
                              "Bayar Sebelum : ${formatDateWithHourString(DateTime.parse(transaction?.paymentExpiryDate ?? ""))}",
                              style: subTitle3.copyWith(
                                  color: white, fontSize: 12),
                            )
                          : const Text('Tidak ada batas waktu'),
                    )
                  ],
                ),
              )
            : SizedBox(
                height: 35,
                width: Get.width * .25,
                child: ButtonSolidBlueMedium(
                  text: "Terima",
                  onPressed: () {
                    CommonDialog().showConfirmationDialog(
                        title: "Konfirmasi Terima Pesanan ?",
                        positiveTitle: "Terima",
                        negativeTitle: "Kembali",
                        positiveClick: () {
                          Get.back();
                          Get.find<TransactionController>()
                              .acceptOrder(transaction?.id ?? '');
                        });
                  },
                ),
              );

        // Is Expired
      } else if (transaction?.status?.code == TransactionStatus.EXPIRED.name) {
        return Container();

        // Is Payment Success
      } else if (transaction?.status?.code ==
          TransactionStatus.PAYMENT_SUCCESS.name) {
        return Container();

        // Is Processed
      } else if (transaction?.status?.code ==
          TransactionStatus.PROCESSED.name) {
        return isBeli!
            ? Container()
            : SizedBox(
                height: 35,
                width: Get.width * .25,
                child: ButtonSolidBlueMedium(
                  text: "Kirim",
                  onPressed: () {},
                ),
              );

        // Is Pending
      } else if (transaction?.status?.code == TransactionStatus.PENDING.name) {
        return Container();

        // Is Shipped
      
      
      } else if (transaction?.status?.code == TransactionStatus.SHIPPED.name) {
        return ButtonOutlineBlue(
          text: "Lacak",
          onPressed: () {},
        );
      } else if (transaction?.status?.code == TransactionStatus.REJECTED.name) {
        return Container();
      } else if (transaction?.status?.code == TransactionStatus.RECEIVED.name) {
        return isBeli! ? ButtonSolidBlue(
          text: "Selesai",
          onPressed: () {},
        ) : Container();
      } else if (transaction?.status?.code ==
          TransactionStatus.COMPLETED.name) {
        return ButtonSolidBlue(
          text: "Beli Lagi",
          onPressed: () {},
        );
      } else if (transaction?.status?.code == TransactionStatus.REFUND.name) {
        return Container();
      } else {
        return Container();
      }
    }

    Color statusColor() {
      if (transaction?.status?.code == TransactionStatus.WAITING_PAYMENT.name) {
        return isBeli! ? Colors.black : good;
      } else if (transaction?.status?.code == TransactionStatus.EXPIRED.name) {
        return Colors.grey;
      } else if (transaction?.status?.code ==
          TransactionStatus.PAYMENT_SUCCESS.name) {
        return star;
      } else if (transaction?.status?.code ==
          TransactionStatus.PROCESSED.name) {
        return star;
      } else if (transaction?.status?.code == TransactionStatus.PENDING.name) {
        return bad;
      } else if (transaction?.status?.code == TransactionStatus.SHIPPED.name) {
        return secondary;
      } else if (transaction?.status?.code == TransactionStatus.REJECTED.name) {
        return bad;
      } else if (transaction?.status?.code == TransactionStatus.RECEIVED.name) {
        return green;
      } else if (transaction?.status?.code ==
          TransactionStatus.COMPLETED.name) {
        return darkGrey;
      } else if (transaction?.status?.code == TransactionStatus.REFUND.name) {
        return bad;
      } else {
        return darkGrey;
      }
    }

    String statusDescription() {
      if (transaction?.status?.code == TransactionStatus.WAITING_PAYMENT.name) {
        return isBeli! ? "Menunggu Pembayaran" : "Pesanan Baru";
      } else if (transaction?.status?.code == TransactionStatus.EXPIRED.name) {
        return "Kadaluarsa";
      } else if (transaction?.status?.code ==
          TransactionStatus.PAYMENT_SUCCESS.name) {
        return "Pembayaran Berhasil";
      } else if (transaction?.status?.code ==
          TransactionStatus.PROCESSED.name) {
        return "Pesanan Diproses";
      } else if (transaction?.status?.code == TransactionStatus.PENDING.name) {
        return "Pesanan Ditolak";
      } else if (transaction?.status?.code == TransactionStatus.SHIPPED.name) {
        return "Pesanan Dikirim";
      } else if (transaction?.status?.code == TransactionStatus.REJECTED.name) {
        return "Pesanan Ditolak";
      } else if (transaction?.status?.code == TransactionStatus.RECEIVED.name) {
        return "Pesanan Selesai";
      } else if (transaction?.status?.code ==
          TransactionStatus.COMPLETED.name) {
        return "Pesanan Selesai";
      } else if (transaction?.status?.code == TransactionStatus.REFUND.name) {
        return "Pesanan Dikembalikan";
      } else {
        return "Pesanan Dikembalikan";
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: white,
        boxShadow: [
          BoxShadow(
            color: darkGrey.withOpacity(.25),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: Get.width,
      child: Column(
        children: [
          // Status Name & Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Status Name
              Row(
                children: [
                  // Shopping Bag Icon
                  Image.asset(
                    'assets/images/ic_shopping_bag_blue.png',
                    height: 22,
                  ),

                  // Status Name
                  const SizedBox(width: 10),
                  Text(toBeginningOfSentenceCase(statusDescription())!,
                      style: subTitle3.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 16)),
                ],
              ),

              // Date
              Text(
                formatDateString(DateTime.parse(transaction!.updatedDate!)),
                style: subTitle3.copyWith(
                  color: darkGrey,
                ),
              ),
            ],
          ),

          // Status Line
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: statusColor(),
              borderRadius: BorderRadius.circular(5),
            ),
            height: 3,
            width: Get.width,
          ),

          // Product Name & Qty
          const SizedBox(height: 4),
          Row(
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: transaction?.thumbnail == null
                    ? Image.asset(
                        'assets/images/no-image.png',
                        height: 75,
                      )
                    : Image.network(
                        transaction?.thumbnail ?? '',
                        height: 75,
                        width: 75,
                        fit: BoxFit.cover,
                      ),
              ),

              // Name & Product Quantity in Transaction
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    transaction?.products?[0]?.name ?? "",
                    style: bodyText.copyWith(fontWeight: FontWeight.bold),
                  ),

                  // QTY
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${transaction?.products?.length ?? 0} Barang",
                    style: subTitle3,
                  ),
                ],
              )
            ],
          ),

          // Total Price & Action Button
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Total Belanja Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Total Belanja Text
                  Text(
                    "Total Belanja :",
                    style: subTitle3.copyWith(color: darkGrey),
                  ),

                  // Harga Total
                  const SizedBox(height: 4),
                  Text(
                    formatCurrencyWithDecimal(transaction?.amount ?? 0),
                    style: bodyText.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // Action Button
              statusButton(),
            ],
          ),
        ],
      ),
    );
  }
}
