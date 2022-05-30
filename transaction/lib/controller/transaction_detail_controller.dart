import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:transaction/data/request/order_accept_response.dart';
import 'package:transaction/usecases/get_transaction_detail_usecase.dart';
import 'package:transaction/usecases/post_transaction_accept_usecase.dart';
import 'package:transaction/utility/enum/transactionStatus.dart';

import '../data/request/transaction_detail_response.dart';

class TransactionDetailController extends BaseController {
  // Usecases
  late final GetTransactionDetailUseCase getTransactionDetailUseCase;
  late final PostTransactionAcceptUseCase postTransactionAcceptUseCase;

  // is beli ?
  final _isBeli = true.obs;
  bool get isBeli => _isBeli.value;
  set isBeli(bool value) => _isBeli.value = value;

  // loading
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  // Refresh Controller
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  // transaction detail response
  final _transactionDetailResponse = TransactionDetailResponse().obs;
  TransactionDetailResponse get transactionDetailResponse =>
      _transactionDetailResponse.value;
  set transactionDetailResponse(TransactionDetailResponse value) =>
      _transactionDetailResponse.value = value;

  // Min Estimation & Max Estimation
  DateTime minEstimation = DateTime.now();
  DateTime maxEstimation = DateTime.now();

  // Status Color
  Color statusColor(String code) {
    if (code == TransactionStatus.WAITING_PAYMENT.name) {
      return isBeli ? black : good;
    } else if (code == TransactionStatus.EXPIRED.name) {
      return darkGrey;
    } else if (code == TransactionStatus.PAYMENT_SUCCESS.name) {
      return star;
    } else if (code == TransactionStatus.PROCESSED.name) {
      return star;
    } else if (code == TransactionStatus.PENDING.name) {
      return bad;
    } else if (code == TransactionStatus.SHIPPED.name) {
      return secondary;
    } else if (code == TransactionStatus.REJECTED.name) {
      return bad;
    } else if (code == TransactionStatus.RECEIVED.name) {
      return green;
    } else if (code == TransactionStatus.COMPLETED.name) {
      return darkGrey;
    } else if (code == TransactionStatus.REFUND.name) {
      return bad;
    } else {
      return darkGrey;
    }
  }

  // Action Button
  Widget actionButton(String code) {
    if (code == TransactionStatus.WAITING_PAYMENT.name) {
      return isBeli
          ? ButtonOutlineBlue(
              text: 'Batalkan Pesanan',
              onPressed: () {},
            )
          : ButtonSolidBlue(
              text: 'Terima Pesanan',
              onPressed: () {
                CommonDialog().showConfirmationDialog(
                    title: "Konfirmasi Terima Pesanan ?",
                    positiveTitle: "Terima",
                    negativeTitle: "Kembali",
                    positiveClick: () {
                      Get.back();
                      acceptOrder(transactionDetailResponse.orderId.toString());
                    });
              },
            );
    } else if (code == TransactionStatus.EXPIRED.name) {
      return const Center(
        child: Text('Transaksi sudah kadaluarsa'),
      );
    } else if (code == TransactionStatus.PAYMENT_SUCCESS.name) {
      return ButtonSolidBlue(
        text: 'Chat Penjual',
        onPressed: () {},
      );
    } else if (code == TransactionStatus.PROCESSED.name) {
      return isBeli
          ? ButtonSolidBlue(
              text: 'Chat Penjual',
              onPressed: () {},
            )
          : ButtonSolidBlue(
              text: 'Masukkan No. Resi',
              onPressed: () {},
            );
    } else if (code == TransactionStatus.PENDING.name) {
      return const Text('Transaksi Ditunda');
    } else if (code == TransactionStatus.SHIPPED.name) {
      return ButtonSolidBlue(
        text: 'Lacak',
        onPressed: () {},
      );
    } else if (code == TransactionStatus.REJECTED.name) {
      return const Text('Transaksi Ditolak');
    } else if (code == TransactionStatus.RECEIVED.name) {
      return isBeli
          ? ButtonSolidBlue(
              text: 'Pesanan Selesai',
              onPressed: () {},
            )
          : Container();
    } else if (code == TransactionStatus.COMPLETED.name) {
      return const Text('Transaksi Telah Selesai');
    } else if (code == TransactionStatus.REFUND.name) {
      return ButtonSolidBlue(
        text: 'Chat Penjual',
        onPressed: () {},
      );
    } else {
      return const Center(
        child: Text('Terjadi Kesalahan'),
      );
    }
  }

  // Status Description
  String statusDescription(String code) {
    if (code == TransactionStatus.WAITING_PAYMENT.name) {
      return isBeli ? 'Menunggu Pembayaran' : 'Pesanan Baru';
    } else if (code == TransactionStatus.EXPIRED.name) {
      return 'Transaksi telah kadaluarsa';
    } else if (code == TransactionStatus.PAYMENT_SUCCESS.name) {
      return 'Pembayaran berhasil';
    } else if (code == TransactionStatus.PROCESSED.name) {
      return 'Transaksi diproses';
    } else if (code == TransactionStatus.PENDING.name) {
      return 'Transaksi ditunda';
    } else if (code == TransactionStatus.SHIPPED.name) {
      return 'Dalam Pengiriman';
    } else if (code == TransactionStatus.REJECTED.name) {
      return 'Transaksi ditolak';
    } else if (code == TransactionStatus.RECEIVED.name) {
      return 'Transaksi Diterima';
    } else if (code == TransactionStatus.COMPLETED.name) {
      return 'Selesai';
    } else if (code == TransactionStatus.REFUND.name) {
      return 'Transaksi dikembalikan';
    } else {
      return 'Terjadi kesalahan';
    }
  }

  @override
  void onInit() {
    // usecase
    getTransactionDetailUseCase = Get.find();
    postTransactionAcceptUseCase = Get.find();

    // isBeli
    isBeli = Get.arguments;

    getTransactionDetail(Get.parameters['id']!);

    super.onInit();
  }

  // get transaction detail
  Future<void> getTransactionDetail(String transactionId) async {
    isLoading = true;
    final response =
        await getTransactionDetailUseCase(int.parse(transactionId));

    safeCallApi<TransactionDetailResponse>(response, onSuccess: (response) {
      transactionDetailResponse = response ?? TransactionDetailResponse();

      //Set Min Estimation & Max Estimation
      minEstimation = DateTime.now().add(
          Duration(days: transactionDetailResponse.orderShipping?.minDay ?? 0));
      maxEstimation = DateTime.now().add(
          Duration(days: transactionDetailResponse.orderShipping?.maxDay ?? 0));

      isLoading = false;
    }, onError: (code, message) {
      isLoading = false;
      showCommonDialog(message);
    });
  }

  // accept order (seller)
  Future<void> acceptOrder(String transactionId) async {
    isLoading = true;
    final response =
        await postTransactionAcceptUseCase(int.parse(transactionId));

    safeCallApi<OrderAcceptResponseData>(response, onSuccess: (response) {
      showCommonDialog("Pesanan diterima.");
      getTransactionDetail(transactionId);
    }, onError: (code, message) {
      showCommonDialog(message);
    });
    isLoading = false;
  }
}
