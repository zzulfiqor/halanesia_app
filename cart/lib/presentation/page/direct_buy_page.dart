import 'package:cart/controller/direct_buy_page_controller.dart';
import 'package:cart/data/remote/checkout_response.dart';
import 'package:cart/presentation/widget/direct_buy_product_item.dart';
import 'package:core/core.dart';
import 'package:core/values/lottie_animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DirectBuyPage extends GetView<DirectBuyPageController> {
  const DirectBuyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        iconTheme: const IconThemeData(color: basic),
        backgroundColor: white,
        title: const Text(
          'Beli Langsung',
          style: TextStyle(
            color: black,
          ),
        ),
      ),

      // body
      body: Obx(
        () => controller.checkoutData.merchant == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.isGeneratePaymentLoading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                            height: Get.height * 0.35,
                            child:
                                Lottie.asset(LottieAnimations.loadingCheckout)),
                      ),
                      Transform.translate(
                        offset: Offset(5, -Get.height * 0.05),
                        child: Center(
                          child: Text(
                            'Memproses pembayaran...',
                            style: bodyText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 24, bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Merchant Info
                        Row(
                          children: [
                            // Store Icon
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Image.asset(
                                'assets/images/profile_store.png',
                                height: 20,
                                width: 20,
                              ),
                            ),

                            // Merchant Name
                            const SizedBox(width: 8),
                            Text(
                              controller.checkoutData.merchant?.name ?? " ",
                              style: title3,
                            ),
                          ],
                        ),

                        // Items
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: controller.checkoutData.products
                                    ?.map((e) => DirectBuyProductItem(
                                        data: e ??
                                            CheckoutResponseDataProducts()))
                                    .toList() ??
                                [],
                          ),
                        ),

                        // Shipping Option Pick
                        const SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              Obx(() => BottomSheetAvailableShipping(
                                    onSelected: (val) {
                                      controller.selectedCourier = val;
                                      controller
                                          .updateShipping(val.detail?.id ?? 0);
                                    },
                                    availableCourier: controller.courierList,
                                    selectedCourier: controller.selectedCourier,
                                  )),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: secondary, width: 1.5),
                            ),
                            padding: const EdgeInsets.all(12.0),
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: Obx(
                              () => controller.selectedCourier.id != null
                                  // If selected courier
                                  ? CourierItem(
                                      courier: controller.selectedCourier,
                                      isSelected: true,
                                      useBorder: false,
                                    )

                                  // If no courier selected
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Pilih metode pengiriman",
                                          style: bodyText.copyWith(
                                              color: transparentGrey),
                                        ),
                                        Image.asset(
                                            'assets/images/chevron_top_blue.png')
                                      ],
                                    ),
                            ),
                          ),
                        ),

                        // Divider
                        const SizedBox(height: 24),
                        Container(
                          height: 10,
                          width: Get.width,
                          color: backgroundGrey,
                        ),

                        // Address Section
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Address Title
                              Text(
                                "Alamat Pengiriman",
                                style: header,
                              ),

                              // Address
                              const SizedBox(height: 12),
                              Obx(
                                () => controller.checkoutData.address != null
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Name & Phone
                                          Row(
                                            children: [
                                              // Name
                                              Text(
                                                controller
                                                        .checkoutData
                                                        .address?[0]
                                                        ?.addressName ??
                                                    "Andika Rahman",
                                                style: subTitle3.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),

                                          // Address Detail
                                          const SizedBox(height: 8),
                                          Text(
                                              "${controller.checkoutData.address?[0]?.address_1} , ${controller.checkoutData.address?[0]?.city ?? ""}, ${controller.checkoutData.address?[0]?.state ?? ""} ${controller.checkoutData.address?[0]?.postalCode ?? ""}"),

                                          // Note
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              // Name
                                              Text(
                                                "Catatan",
                                                style: subTitle3.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),

                                              // Phone
                                              Text(
                                                " [${controller.checkoutData.address?[0]?.address_2}]",
                                                style: subTitle3,
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "Belum ada alamat pengiriman",
                                          style: bodyText.copyWith(
                                              color: transparentGrey),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),

                        // Divider
                        const SizedBox(height: 24),
                        Container(
                          height: 10,
                          width: Get.width,
                          color: backgroundGrey,
                        ),

                        // Summary
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Summary Title
                              Text(
                                "Ringkasan Pembayaran",
                                style: header,
                              ),

                              // Total Barang
                              const SizedBox(height: 24),
                              Obx(() => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // title
                                      Text(
                                        "Total Barang",
                                        style: subTitle3.copyWith(
                                            color: basic,
                                            fontWeight: FontWeight.w400),
                                      ),

                                      // value
                                      Text(
                                        formatCurrencyWithDecimal(controller
                                                .checkoutData
                                                .pricing
                                                ?.totalItemsPrice ??
                                            0),
                                        style: bodyText,
                                      ),
                                    ],
                                  )),

                              // Total Pengiriman
                              const SizedBox(height: 4),
                              Obx(() => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // title
                                      Text(
                                        "Total Pengiriman",
                                        style: subTitle3.copyWith(
                                            color: basic,
                                            fontWeight: FontWeight.w400),
                                      ),

                                      // value
                                      Text(
                                        formatCurrencyWithDecimal(controller
                                                .checkoutData
                                                .pricing
                                                ?.shippingPrice ??
                                            0),
                                        style: bodyText,
                                      ),
                                    ],
                                  )),

                              // Asuransi Pengiriman
                              const SizedBox(height: 4),
                              Obx(() => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // title
                                      Text(
                                        "Asuransi Pengiriman",
                                        style: subTitle3.copyWith(
                                            color: basic,
                                            fontWeight: FontWeight.w400),
                                      ),

                                      // value
                                      Text(
                                        formatCurrencyWithDecimal(controller
                                                .checkoutData
                                                .pricing
                                                ?.insurancePrice ??
                                            0),
                                        style: bodyText,
                                      ),
                                    ],
                                  )),

                              // Voucher Discount
                              Obx(
                                () => controller.checkoutData.pricing
                                            ?.voucherDiscount !=
                                        0
                                    ? Column(
                                        children: [
                                          const SizedBox(height: 4),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // title
                                              Text(
                                                "Diskon Voucher",
                                                style: subTitle3.copyWith(
                                                    color: basic,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),

                                              // value
                                              Text(
                                                "- " +
                                                    formatCurrencyWithDecimal(
                                                        controller
                                                                .checkoutData
                                                                .pricing
                                                                ?.voucherDiscount ??
                                                            0),
                                                style: bodyText,
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ),

                              // Divider
                              const SizedBox(height: 8),
                              const Divider(
                                thickness: 1,
                                color: neutralGrey,
                              ),

                              // Total Pesanan
                              const SizedBox(height: 4),
                              Obx(() => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // title
                                      Text(
                                        "Total Pesanan",
                                        style: subTitle3.copyWith(
                                            color: basic,
                                            fontWeight: FontWeight.w600),
                                      ),

                                      // value
                                      Text(
                                        formatCurrencyWithDecimal((controller
                                                    .checkoutData
                                                    .pricing
                                                    ?.insurancePrice ??
                                                0) +
                                            (controller.checkoutData.pricing
                                                    ?.shippingPrice ??
                                                0) +
                                            (controller.checkoutData.pricing
                                                    ?.totalItemsPrice ??
                                                0) -
                                            (controller.checkoutData.pricing
                                                    ?.voucherDiscount ??
                                                0)),
                                        style: bodyText,
                                      ),
                                    ],
                                  )),

                              // Biaya Layanan
                              const SizedBox(height: 4),
                              Obx(() => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // title
                                      Text(
                                        "Biaya Layanan",
                                        style: subTitle3.copyWith(
                                            color: basic,
                                            fontWeight: FontWeight.w400),
                                      ),

                                      // value
                                      Text(
                                        formatCurrencyWithDecimal(controller
                                                .checkoutData
                                                .pricing
                                                ?.layananPrice ??
                                            0),
                                        style: bodyText,
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        Container(
                          height: 100,
                          width: Get.width,
                          color: backgroundGrey,
                        ),
                      ],
                    ),
                  ),
      ),

      // bottom
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(
        () => controller.isGeneratePaymentLoading
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Promo Dropdown
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.bottomSheet(
                      //       PromoBottomSheet(
                      //         promoList: controller.couponItems,
                      //         onTapUse: () {},
                      //         onItemTap: (val) {
                      //           controller.selectedCoupon = val;
                      //           controller.updateCoupon(int.parse(val.id ?? "0"));
                      //         },
                      //         selectedItem: controller.selectedCoupon.id == null
                      //             ? controller.checkoutData.address == null
                      //                 ? null
                      //                 : GetCouponResponseData(
                      //                     id: controller.checkoutData.coupon?.id,
                      //                     name: controller.checkoutData.coupon?.name
                      //                         .toString(),
                      //                   )
                      //             : controller.selectedCoupon,
                      //       ),
                      //       isScrollControlled: true,
                      //     );
                      //   },
                      //   child: controller.isGeneratePaymentLoading
                      //       ? Container()
                      //       : controller.selectedCoupon.id == null
                      //           ? Container(
                      //               margin:
                      //                   const EdgeInsets.symmetric(horizontal: 16),
                      //               decoration: BoxDecoration(
                      //                 color: white,
                      //                 borderRadius: BorderRadius.circular(5),
                      //                 border: Border.all(width: 2, color: secondary),
                      //               ),
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(8.0),
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.spaceBetween,
                      //                   children: [
                      //                     // Select Promo
                      //                     Text(
                      //                       "Promo",
                      //                       style:
                      //                           bodyText.copyWith(color: neutralGrey),
                      //                     ),

                      //                     // Arrow Up
                      //                     Image.asset(
                      //                         'assets/images/chevron_top_blue.png'),
                      //                   ],
                      //                 ),
                      //               ),
                      //             )
                      //           : PromoItem(
                      //               promoItem: controller.selectedCoupon,
                      //               isSelected: true,
                      //             ),
                      // ),

                      // // Divider
                      // Container(
                      //   margin: const EdgeInsets.only(top: 12, bottom: 24),
                      //   height: 1,
                      //   width: Get.width,
                      //   color: neutralGrey,
                      // ),

                      // Total Price & Checkout
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Subtotal
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Total Pesanan",
                                  style: header.copyWith(color: basic),
                                ),

                                // subtotal
                                const SizedBox(height: 12),
                                Obx(() => controller.isGeneratePaymentLoading
                                    ? Container()
                                    : Text(
                                        formatCurrencyWithDecimal(controller
                                                .checkoutData
                                                .pricing
                                                ?.totalPrice ??
                                            0),
                                        style: subTitle1.copyWith(
                                            color: basic,
                                            fontWeight: FontWeight.bold),
                                      )),
                              ],
                            ),

                            // Button Buy
                            SizedBox(
                              width: 120,
                              child: Obx(
                                () => controller.isGeneratePaymentLoading
                                    ? Container()
                                    : ButtonSolidBlue(
                                        text: "Beli",
                                        onPressed: controller
                                                    .selectedCourier.id !=
                                                null
                                            ? () {
                                                controller.generatePaymentUrl();
                                              }
                                            : null,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
