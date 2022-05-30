import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:transaction/controller/transaction_detail_controller.dart';
import 'package:transaction/utility/enum/transactionStatus.dart';

class TransactionDetailPage extends GetView<TransactionDetailController> {
  const TransactionDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        title: const Text(
          'Detail Pesanan',
          style: TextStyle(
            color: black,
          ),
        ),
        iconTheme: const IconThemeData(color: black),
        backgroundColor: white,
      ),

      // Body
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        // header: const WaterDropMaterialHeader(),
        controller: controller.refreshController,
        onRefresh: () async {
          controller.getTransactionDetail(Get.parameters['id'].toString());
          controller.refreshController.refreshCompleted();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Obx(
              () => controller.isLoading
                  ? SizedBox(
                      height: Get.height - 100,
                      child: Center(
                        child: loadingCircle(),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Transaction Status
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.statusDescription(controller
                                    .transactionDetailResponse.statusCode
                                    .toString()),
                                style: header,
                              ),
                            ],
                          ),
                        ),

                        // Transaction Status Line
                        const SizedBox(height: 4),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: controller.statusColor(controller
                                    .transactionDetailResponse.statusCode ??
                                ''),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: 3,
                          width: Get.width,
                        ),

                        // if menunggu pembayaran show payment expired date
                        controller.transactionDetailResponse.statusCode ==
                                TransactionStatus.WAITING_PAYMENT.name
                            ? controller.isBeli
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: note,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 8),
                                          alignment: Alignment.center,
                                          child: controller
                                                      .transactionDetailResponse
                                                      .paymentExpiryDate !=
                                                  null
                                              ? Text(
                                                  "Bayar Sebelum : ${formatDateWithHourString(DateTime.parse(controller.transactionDetailResponse.paymentExpiryDate!))}",
                                                  style: subTitle3.copyWith(
                                                      color: white),
                                                )
                                              : const Text(
                                                  'Tidak ada batas waktu'),
                                        )
                                      ],
                                    ),
                                  )
                                : Container()
                            : Container(),

                        // Id Transaksi
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Title
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'ID Transaksi',
                                style: subTitle3.copyWith(color: darkGrey),
                              ),
                            ),

                            // Id
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                '${controller.transactionDetailResponse.orderId}',
                                style: subTitle3.copyWith(color: black),
                              ),
                            ),
                          ],
                        ),

                        // Tanggal Transaksi
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Title
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Tanggal Transaksi',
                                style: subTitle3.copyWith(color: darkGrey),
                              ),
                            ),

                            // Tanggal
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                formatDateCompleteString(DateTime.parse(
                                    controller.transactionDetailResponse
                                            .createdDate ??
                                        '')),
                                style: subTitle3.copyWith(color: black),
                              ),
                            ),
                          ],
                        ),

                        controller.isBeli == false
                            ? const SizedBox(height: 16)
                            : Container(),

                        controller.isBeli == false
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Title
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(
                                      'Nama Pemesan',
                                      style:
                                          subTitle3.copyWith(color: darkGrey),
                                    ),
                                  ),

                                  // Nama
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(
                                      'Zuhair',
                                      style: subTitle3.copyWith(color: black),
                                    ),
                                  ),
                                ],
                              )
                            : Container(),

                        // if menunggu pembayaran show Payment instruction link
                        controller.transactionDetailResponse.statusCode ==
                                TransactionStatus.WAITING_PAYMENT.name
                            ? controller.isBeli
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                RouteName.paymentWebView,
                                                arguments: [
                                                  controller
                                                      .transactionDetailResponse
                                                      .paymentUrl,
                                                  RouteName.transactionDetail
                                                ]);
                                          },
                                          child: Text(
                                            "Cara melakukan pembayaran >",
                                            style: subTitle3.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: secondary,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : Container(
                                    height: 12,
                                  )
                            : Container(
                                height: 12,
                              ),

                        // Section Divider
                        Container(
                          height: 15,
                          width: Get.width,
                          color: neutralGrey.withOpacity(.25),
                        ),

                        // Order Detail
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Detail Pesanan',
                                style: header,
                              ),
                            ],
                          ),
                        ),

                        // Order Detail List
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Item List
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller
                                        .transactionDetailResponse
                                        .orderProduct
                                        ?.length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          // Product Images
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              "${controller.transactionDetailResponse.orderProduct?[index]?.images?.first?.url}",
                                              height: 60,
                                              width: 60,
                                              fit: BoxFit.cover,
                                            ),
                                          ),

                                          // Product Name + Price * qty
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Product Name
                                                Text(
                                                    "${controller.transactionDetailResponse.orderProduct?[index]?.productName}"),

                                                // Product qty
                                                Text(
                                                  "Qty x ${controller.transactionDetailResponse.orderProduct?[index]?.quantity}",
                                                  style: subTitle3.copyWith(
                                                    color: black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),

                                  // Divider
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: const Divider(
                                      thickness: 1,
                                      color: lightGrey,
                                    ),
                                  ),

                                  // Text Total Barang
                                  Text(
                                    "Total Barang",
                                    style: subTitle3,
                                  ),

                                  // Total Barang
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                      formatCurrencyWithDecimal(controller
                                              .transactionDetailResponse
                                              .amount ??
                                          0),
                                      style: header.copyWith(
                                        color: black,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Section Divider
                        const SizedBox(height: 16),
                        Container(
                          height: 15,
                          width: Get.width,
                          color: neutralGrey.withOpacity(.25),
                        ),

                        // Section Detail Pengiriman
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Text(
                                'Detail Pengiriman',
                                style: header,
                              ),

                              // Detail Pengiriman Kurir
                              const SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title
                                  SizedBox(
                                    width: Get.width * 0.3,
                                    child: Text(
                                      'Kurir',
                                      style: bodyText.copyWith(color: darkGrey),
                                    ),
                                  ),

                                  // Content
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Jenis
                                        Text(
                                            "${controller.transactionDetailResponse.orderShipping?.shippingOptionType}"),

                                        // Estimasi
                                        controller.minEstimation.month == controller.maxEstimation.month &&
                                                controller.minEstimation.year ==
                                                    controller
                                                        .maxEstimation.year &&
                                                controller.minEstimation.day ==
                                                    controller.maxEstimation.day
                                            ? Text("Estimasi tiba ${controller.minEstimation.day} ${getMonthNameFromDate(controller.minEstimation)} ${controller.minEstimation.year}",
                                                style: subTitle3.copyWith(
                                                    color: black,
                                                    fontWeight:
                                                        FontWeight.bold))
                                            : controller.minEstimation.month ==
                                                        controller.maxEstimation
                                                            .month &&
                                                    controller.minEstimation.year ==
                                                        controller
                                                            .maxEstimation.year
                                                ? Text("Estimasi tiba ${controller.minEstimation.day}-${controller.maxEstimation.day} ${getMonthNameFromDate(controller.minEstimation)} ${controller.minEstimation.year}",
                                                    style: subTitle3.copyWith(
                                                        color: black,
                                                        fontWeight:
                                                            FontWeight.bold))
                                                : controller.minEstimation.month ==
                                                            controller
                                                                .maxEstimation
                                                                .month &&
                                                        controller.minEstimation.year !=
                                                            controller.maxEstimation.year
                                                    ? Text("Estimasi tiba ${controller.minEstimation.day} ${getMonthNameFromDate(controller.minEstimation)} ${controller.minEstimation.year} - ${controller.maxEstimation.day} ${getMonthNameFromDate(controller.minEstimation)} ${controller.maxEstimation.year}", style: subTitle3.copyWith(color: black, fontWeight: FontWeight.bold))
                                                    : Text("Estimasi tiba ${controller.minEstimation.day} ${getMonthNameFromDate(controller.minEstimation)} -${controller.maxEstimation.day} ${getMonthNameFromDate(controller.minEstimation)} ${controller.minEstimation.year}", style: subTitle3.copyWith(color: black, fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  )
                                ],
                              ),

                              // Detail Pengiriman Alamat
                              const SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title
                                  SizedBox(
                                    width: Get.width * 0.3,
                                    child: Text(
                                      'Alamat',
                                      style: bodyText.copyWith(color: darkGrey),
                                    ),
                                  ),

                                  // Content
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Jenis
                                        Text(
                                          "${controller.transactionDetailResponse.orderAddress?.addressName}",
                                          style: bodyText.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        // Estimasi
                                        Text(
                                          "${controller.transactionDetailResponse.orderAddress?.address_1}, ${controller.transactionDetailResponse.orderAddress?.suburb ?? ''}, ${controller.transactionDetailResponse.orderAddress?.city}, ${controller.transactionDetailResponse.orderAddress?.suburb ?? ''}, ${controller.transactionDetailResponse.orderAddress?.state}",
                                          style: bodyText.copyWith(
                                            color: black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Section Divider
                        const SizedBox(height: 24),
                        Container(
                          height: 15,
                          width: Get.width,
                          color: neutralGrey.withOpacity(.25),
                        ),

                        // Section Detail Harga
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // title Detail Harga
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Detail Harga',
                                style: header,
                              ),
                            ),

                            // Detail Harga
                            Obx(
                              () => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  children: [
                                    // Total Barang
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Title
                                        SizedBox(
                                          width: Get.width * 0.4,
                                          child: Text(
                                            'Total Barang',
                                            style: bodyText.copyWith(
                                                color: darkGrey),
                                          ),
                                        ),

                                        // Content
                                        Text(
                                          formatCurrencyWithDecimal(controller
                                                  .transactionDetailResponse
                                                  .totalItemPrice ??
                                              0),
                                          style: bodyText.copyWith(
                                            color: black,
                                          ),
                                        )
                                      ],
                                    ),

                                    // Total Pengiriman
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Title
                                        SizedBox(
                                          width: Get.width * 0.4,
                                          child: Text(
                                            'Total Pengiriman',
                                            style: bodyText.copyWith(
                                                color: darkGrey),
                                          ),
                                        ),

                                        // Content
                                        Text(
                                          formatCurrencyWithDecimal(controller
                                                  .transactionDetailResponse
                                                  .shippingPrice ??
                                              0),
                                          style: bodyText.copyWith(
                                            color: black,
                                          ),
                                        )
                                      ],
                                    ),

                                    // Diskon Pengiriman
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Title
                                        SizedBox(
                                          width: Get.width * 0.4,
                                          child: Text(
                                            'Diskon Pengiriman',
                                            style: bodyText.copyWith(
                                                color: darkGrey),
                                          ),
                                        ),

                                        // Content
                                        Text(
                                          formatCurrencyWithDecimal(controller
                                                  .transactionDetailResponse
                                                  .voucherDiscount ??
                                              0),
                                          style: bodyText.copyWith(
                                            color: black,
                                          ),
                                        )
                                      ],
                                    ),

                                    // Asuransi Pengiriman
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Title
                                        SizedBox(
                                          width: Get.width * 0.4,
                                          child: Text(
                                            'Asuransi Pengiriman',
                                            style: bodyText.copyWith(
                                                color: darkGrey),
                                          ),
                                        ),

                                        // Content
                                        Text(
                                          formatCurrencyWithDecimal(controller
                                                  .transactionDetailResponse
                                                  .insurancePrice ??
                                              0),
                                          style: bodyText.copyWith(
                                            color: black,
                                          ),
                                        )
                                      ],
                                    ),

                                    // Biaya Layanan
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Title
                                        SizedBox(
                                          width: Get.width * 0.4,
                                          child: Text(
                                            'Biaya Layanan',
                                            style: bodyText.copyWith(
                                                color: darkGrey),
                                          ),
                                        ),

                                        // Content
                                        Text(
                                          formatCurrencyWithDecimal(controller
                                                  .transactionDetailResponse
                                                  .layananPrice ??
                                              0),
                                          style: bodyText.copyWith(
                                            color: black,
                                          ),
                                        )
                                      ],
                                    ),

                                    // Divider
                                    const SizedBox(height: 16),
                                    Container(
                                      height: 1,
                                      width: Get.width,
                                      color: neutralGrey,
                                    ),
                                    const SizedBox(height: 16),

                                    // Total Pembayaran
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Title
                                        SizedBox(
                                          width: Get.width * 0.4,
                                          child: Text(
                                            'Total Pembayaran',
                                            style: header.copyWith(
                                                color: darkGrey),
                                          ),
                                        ),

                                        // Content
                                        Text(
                                          formatCurrencyWithDecimal(controller
                                                  .transactionDetailResponse
                                                  .amount ??
                                              0),
                                          style: header.copyWith(
                                            color: black,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),

      // bottom action bar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(
        () => controller.isLoading
            ? Container()
            : Container(
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: Get.width,
                height: Get.height * 0.1,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                alignment: Alignment.center,
                child: SizedBox(
                  width: Get.width * 0.75,
                  child: controller.actionButton(
                      controller.transactionDetailResponse.statusCode ?? ''),
                ),
              ),
      ),
    );
  }
}
