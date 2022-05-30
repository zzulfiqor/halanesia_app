import 'package:cart/controller/cart_page_controller.dart';
import 'package:cart/data/remote/wishlist_response_model.dart';
import 'package:cart/presentation/widget/cart_favorite_product_item.dart';
import 'package:cart/presentation/widget/cart_item.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CartPage extends GetView<CartPageController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        title: const Text(
          'Keranjang',
          style: TextStyle(
            color: black,
          ),
        ),
        iconTheme: const IconThemeData(color: black),
        backgroundColor: white,
        actions: [
          // Notification
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/notification.png',
              height: 20,
              width: 45,
            ),
          ),

          // Favorite
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/favorite.png',
              height: 20,
              width: 40,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),

      // body
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () {
          controller.onRefresh();
          controller.refreshController.refreshCompleted();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: Get.height * .2, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cart Items
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Cart Item
                      const SizedBox(height: 16),

                      // merchants
                      controller.cartItemLoading() == true &&
                              controller.isInitLoad == true
                          ? loadingSmallCircle()
                          : Column(
                              children: controller.cartItems.isNotEmpty
                                  ? controller.cartItems
                                      .map((element) => Column(
                                            children: [
                                              //Merchant Name
                                              Row(
                                                children: [
                                                  // Store Icon
                                                  Image.asset(
                                                    'assets/images/profile_store.png',
                                                    height: 20,
                                                    width: 20,
                                                  ),

                                                  // Merchant Name
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    element.merchant?.name ??
                                                        " ",
                                                    style: title3,
                                                  ),
                                                ],
                                              ),

                                              // Spacer
                                              const SizedBox(height: 16),

                                              // Merchant Products
                                              Column(
                                                children: element.merchant !=
                                                        null
                                                    ? element.merchant!
                                                                .product !=
                                                            null
                                                        ? element
                                                            .merchant!.product!
                                                            .map(
                                                                (e) => CartItem(
                                                                      data: e!,
                                                                    ))
                                                            .toList()
                                                        : []
                                                    : [],
                                              ),
                                            ],
                                          ))
                                      .toList()
                                  : [
                                      Center(
                                        child: Text(
                                            "Tidak ada item di keranjang",
                                            style: subTitle3),
                                      ),

                                      // Belanja Sekarang
                                      const SizedBox(height: 16),
                                      SizedBox(
                                        height: 32,
                                        child: ButtonSolidBlueSmall(
                                          text: "Belanja Sekarang",
                                          onPressed: () {
                                            Get.back();
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                    ],
                            ),
                    ],
                  ),
                ),
              ),

              // Divider
              const SizedBox(height: 16),
              Container(
                height: 10,
                width: Get.width,
                color: backgroundGrey,
              ),

              // My Favorite Products
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Title
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text("Favorit Saya", style: header),
                  ),
                  const SizedBox(height: 16),
                  Obx(() => SizedBox(
                        height: Get.height * .385,
                        child: controller.wishlistItemLoading() == false
                            ? controller.wishlistItems().items != null
                                ? controller.wishlistItems().items!.isEmpty
                                    ? Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                "Kamu belum memiliki item di wishlist",
                                                style: subTitle3),
                                            const SizedBox(height: 16),
                                            SizedBox(
                                              height: 32,
                                              child: ButtonSolidBlueSmall(
                                                text: "Belanja Sekarang",
                                                onPressed: () {
                                                  Get.back();
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : ListView.builder(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return CartFavoriteProductItem(
                                              controller.wishlistItems.value
                                                      .items?[index] ??
                                                  WishlistResponseDataItems(),
                                              controller);
                                        },
                                        itemCount: controller.wishlistItems
                                                .value.items?.length ??
                                            0)
                                : loadingSmallCircle()
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Kamu belum memiliki item di wishlist",
                                        style: subTitle3),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      height: 32,
                                      child: ButtonSolidBlueSmall(
                                        text: "Belanja Sekarang",
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      )),
                ],
              ),

              // Divider
              const SizedBox(height: 16),
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
        () => Container(
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
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      Obx(
                        () => PromoBottomSheet(
                          promoList: controller.couponItems,
                          onTapUse: () {},
                          onItemTap: (val) {
                            controller.selectedCoupon = val;
                          },
                          selectedItem: controller.selectedCoupon.id == null
                              ? null
                              : controller.selectedCoupon,
                        ),
                      ),
                      isScrollControlled: true,
                    );
                  },
                  child: controller.selectedCoupon.id == null
                      ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 2, color: secondary),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Select Promo
                                Text(
                                  "Promo",
                                  style: bodyText.copyWith(color: neutralGrey),
                                ),

                                // Arrow Up
                                Image.asset(
                                    'assets/images/chevron_top_blue.png'),
                              ],
                            ),
                          ),
                        )
                      : PromoItem(
                          promoItem: controller.selectedCoupon,
                          isSelected: true,
                        ),
                ),

                // Divider
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 24),
                  height: 1,
                  width: Get.width,
                  color: neutralGrey,
                ),

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
                          Obx(() => Text(
                                controller.totalPriceValue == 0
                                    ? '-'
                                    : formatCurrencyWithDecimal(
                                        controller.totalPriceValue),
                                style: subTitle1.copyWith(
                                    color: basic, fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),

                      // Button Buy
                      SizedBox(
                        width: 120,
                        child: Obx(() => ButtonSolidBlue(
                              text: "Beli",
                              onPressed: controller.totalPriceValue == 0
                                  ? null
                                  : () {
                                      controller.checkoutCart();
                                    },
                            )),
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
