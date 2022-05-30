import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home/controller/home_controller.dart';
import 'package:store/controller/product_detail_controller.dart';
import 'package:store/presentation/widget/desc_product.dart';
import 'package:store/presentation/widget/product_certified.dart';
import 'package:store/presentation/widget/product_other_list.dart';
import 'package:store/presentation/widget/review_image_list.dart';
import 'package:store/presentation/widget/review_list.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.onBackPressed();
        return false;
      },
      child: Scaffold(
          backgroundColor: backgroundGrey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: Obx(
              () => HomeAppBar(
                onSearchChanged: (val) {},
                usebackButton: true,
                onBackTapped: () => controller.onBackPressed(),
                cartCount: Get.find<HomeController>().cartCount,
              ),
            ),
          ),
          body: SafeArea(
              top: true,
              bottom: true,
              child: Obx(
                () => controller.isLoading.value
                    ? loadingCircle()
                    : Column(
                        children: [
                          Expanded(
                              child: ListView(children: [
                            Stack(
                              children: [
                                CarouselSlider(
                                    carouselController:
                                        controller.carouselController,
                                    options: CarouselOptions(
                                        height:
                                            MediaQuery.of(context).size.width,
                                        viewportFraction: 1,
                                        scrollDirection: Axis.horizontal,
                                        autoPlay: false,
                                        autoPlayInterval:
                                            const Duration(seconds: 3),
                                        onPageChanged: (index, reason) {
                                          controller.currentCarousel.value =
                                              index;
                                        }),
                                    items: controller.imageData.value
                                        .map((e) => loadImageSquare(
                                              e,
                                              MediaQuery.of(context).size.width,
                                            ))
                                        .toList()),
                                Positioned(
                                  bottom: 20,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: controller.imageData.value
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      return Container(
                                        width: 9.0,
                                        height: 9.0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: controller.currentCarousel
                                                        .value ==
                                                    entry.key
                                                ? secondary
                                                : neutralGrey),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 25),
                              color: white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(controller.productName.value,
                                        style: bodyText.copyWith(
                                            fontSize: 25, color: basic)),
                                  ),
                                  const SizedBox(height: 24),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      children: [
                                        Text(controller.productPrice.value,
                                            style: title1.copyWith(
                                                fontSize: 20, color: basic)),
                                        const SizedBox(width: 24),
                                        Text(controller.productRealPrice.value,
                                            style: bodyText.copyWith(
                                                color: darkGrey,
                                                decoration: TextDecoration
                                                    .lineThrough)),
                                        const SizedBox(width: 10),
                                        Text(
                                            controller
                                                .productDiscountPrice.value,
                                            style:
                                                bodyText.copyWith(color: bad)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.star_rate_rounded,
                                            size: 22, color: star),
                                        Text(controller.productRate.value,
                                            style:
                                                info1.copyWith(color: basic)),
                                        const SizedBox(width: 20),
                                        Text(controller.productSold.value,
                                            style:
                                                info1.copyWith(color: basic)),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            controller.share("www.google.com");
                                          },
                                          child: const Icon(
                                            Icons.share_outlined,
                                            size: 30,
                                            color: secondary,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        InkWell(
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.favorite_outline_rounded,
                                            size: 30,
                                            color: red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  controller.isShowTag.value
                                      ? ProductCertified(
                                          color: controller.tagText.value
                                                  .contains("MUI")
                                              ? good
                                              : bad,
                                          text: controller.tagText.value)
                                      : Container()
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 14),
                              color: white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      // Image Profile
                                      loadImageProfile(
                                          controller.merchantProfileImage.value,
                                          50),

                                      // Merchant Name & Merchant Location
                                      const SizedBox(width: 25),
                                      Expanded(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Merchant Name
                                              Text(
                                                  controller.merchantName.value,
                                                  style: header.copyWith(
                                                      color: basic)),

                                              // Merchant Location
                                              const SizedBox(height: 5),
                                              Row(children: [
                                                const Icon(
                                                    Icons.location_on_outlined,
                                                    size: 20,
                                                    color: darkGrey),
                                                const SizedBox(height: 5),
                                                Text(
                                                    controller
                                                        .merchantLocation.value,
                                                    style: info1.copyWith(
                                                        color: darkGrey)),
                                              ])
                                            ]),
                                      ),

                                      // Chevron Right Merchant
                                      const SizedBox(width: 10),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(RouteName.storefront +
                                              '/${controller.merchantId.value}');
                                        },
                                        child: const Icon(
                                            Icons.chevron_right_rounded,
                                            size: 50,
                                            color: secondary),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  const Divider(
                                    color: neutralGrey,
                                    thickness: 1,
                                  ),
                                  const SizedBox(height: 16),
                                  Text("Produk Lainnya",
                                      style: header.copyWith(color: basic)),
                                  const SizedBox(height: 24),
                                  Container(
                                    child: controller.isRelatedLoading.value
                                        ? loadingCircle()
                                        : ProductOtherList(
                                            data:
                                                controller.imageListData.value,
                                            onProductTap: (value) {
                                              Get.toNamed(
                                                  RouteName.storeProductDetail +
                                                      "/${value.productId}");
                                            }),
                                  ),
                                  const SizedBox(height: 35),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Text("Lihat Produk Toko",
                                          style: secondary3Bold.copyWith(
                                              fontSize: 14, color: secondary)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              color: white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Detail Produk",
                                      style: header.copyWith(color: basic)),
                                  const SizedBox(height: 30),
                                  DescProduct(
                                    title: "Minimum Pemesanan",
                                    value: controller.minOrder.value.toString(),
                                  ),
                                  DescProduct(
                                      title: "Stok",
                                      value: controller.stock.value.toString()),
                                  DescProduct(
                                      title: "Kategori",
                                      value: controller.category.value,
                                      isHighlight: true),
                                  controller.desc.value == "-"
                                      ? Container()
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: CustomPaint(
                                            foregroundPainter:
                                                FadingEffectPainer(),
                                            child: Text(
                                              controller.desc.value,
                                              style: bodyText.copyWith(
                                                  color: basic),
                                              textAlign: TextAlign.justify,
                                              maxLines: 3,
                                            ),
                                          ),
                                        ),
                                  const SizedBox(height: 10),
                                  InkWell(
                                      onTap: () {
                                        showProductDesc();
                                      },
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Lihat Selengkapnya",
                                              style: secondary3Bold.copyWith(
                                                  fontSize: 14,
                                                  color: secondary),
                                            ),
                                            const SizedBox(width: 10),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(top: 5.0),
                                              child: Icon(
                                                  Icons.expand_less_rounded,
                                                  size: 24,
                                                  color: secondary),
                                            )
                                          ]))
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              color: white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Ulasan",
                                          style: header.copyWith(color: basic)),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(
                                              RouteName.storeProductReview +
                                                  "/${controller.id.value}");
                                        },
                                        child: Text("Lihat Semua",
                                            style: secondary3Bold.copyWith(
                                                fontSize: 14,
                                                color: secondary)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.star_rate_rounded,
                                          size: 24, color: star),
                                      const SizedBox(width: 10),
                                      Text(controller.productRate.value,
                                          style: info1.copyWith(color: basic)),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  controller.isImageLoading.value
                                      ? loadingCircle()
                                      : controller.imageReviewData.value.isEmpty
                                          ? Container()
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                      child: ReviewImageList(
                                                          data: controller
                                                              .imageReviewData
                                                              .value,
                                                          onImageTap: (value) {
                                                            Get.toNamed(
                                                                RouteName
                                                                    .storeProductReviewImage,
                                                                arguments: value
                                                                    .toJson());
                                                          })),
                                                  const SizedBox(width: 20),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.toNamed(RouteName
                                                              .storeProductReviewImageAll +
                                                          "/${controller.id.value}");
                                                    },
                                                    child: const Icon(
                                                        Icons
                                                            .chevron_right_rounded,
                                                        size: 50,
                                                        color: secondary),
                                                  ),
                                                  const SizedBox(width: 20),
                                                ],
                                              ),
                                            ),
                                  controller.isReviewLoading.value
                                      ? loadingCircle()
                                      : controller.reviewList.value.isEmpty
                                          ? Center(
                                              child: Text("Belum Ada Ulasan",
                                                  style: header.copyWith(
                                                      color: darkGrey)))
                                          : ReviewList(
                                              data: controller.reviewList.value,
                                              onImageTap: (value) {
                                                Get.toNamed(RouteName
                                                    .storeProductReviewImage);
                                              },
                                            )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          ])),
                          Material(
                              elevation: 30,
                              color: white,
                              child: Container(
                                color: white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 20),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: ButtonOutlineBlueMedium(
                                            text: "Beli",
                                            onPressed: () {
                                              controller.checkoutCart();
                                            }),
                                      ),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      Expanded(
                                        child: ButtonSolidBlueMedium(
                                            text: "Keranjang",
                                            icon: Icons.add,
                                            onPressed: () {
                                              controller.addCart();
                                            }),
                                      ),
                                    ]),
                              ))
                        ],
                      ),
              ))),
    );
  }

  void showProductDesc() {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.close, color: basic, size: 24),
                ),
                const SizedBox(width: 12),
                Text("Detail Produk", style: header.copyWith(color: basic))
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(shrinkWrap: true, children: [
                const SizedBox(height: 10),
                DescProduct(
                    title: "Minimum Pemesanan",
                    value: controller.minOrder.value.toString()),
                DescProduct(
                    title: "Stok", value: controller.stock.value.toString()),
                DescProduct(
                    title: "Kategori",
                    value: controller.category.value,
                    isHighlight: true),
                const SizedBox(height: 15),
                Text(
                  controller.desc.value,
                  style: bodyText.copyWith(color: basic),
                  textAlign: TextAlign.justify,
                ),
              ]),
            )
          ],
        ),
      ),
      elevation: 5.0,
      enableDrag: true,
      isDismissible: false,
      backgroundColor: white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      )),
    );
  }
}
