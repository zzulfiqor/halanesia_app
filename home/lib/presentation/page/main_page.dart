import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/controller/home_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:home/presentation/widget/home_product_card.dart';
import 'package:home/presentation/widget/page_indicator.dart';
import 'package:home/presentation/widget/quotation_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainPage extends GetView<HomeController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RefreshController refreshController =
        RefreshController(initialRefresh: false);

    return Scaffold(
      // appbar
      appBar: PreferredSize(
        preferredSize: controller.bottomNavbarIndex != 0
            ? const Size(0, 0)
            : Size.fromHeight(AppBar().preferredSize.height),
        child: Obx(
          () => HomeAppBar(
            onSearchChanged: (value) {},
            cartCount: controller.cartCount,
          ),
        ),
      ),

      body: Obx(
        () => NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            controller: refreshController,
            onRefresh: () async {
              controller.initHomeDataLoad();
              refreshController.refreshCompleted();
            },
            child: ListView(
              children: [
                //  Menus
                const SizedBox(height: 10),
                // SingleChildScrollView(
                //   padding: const EdgeInsets.symmetric(horizontal: 12),
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       // Promo
                //       HomeMenu(
                //           child: Image.asset('assets/images/ic_menu_promo.png'),
                //           title: "Cari\nPromo",
                //           onTap: () {}),

                //       // Quotation
                //       HomeMenu(
                //           child: Image.asset(
                //               'assets/images/ic_menu_quotation.png'),
                //           title: "Buat Permintaan",
                //           onTap: () {}),

                //       // Sell
                //       HomeMenu(
                //           child:
                //               Image.asset('assets/images/ic_menu_shopping.png'),
                //           title: "Mulai Berbelanja",
                //           onTap: () {}),

                //       // Categories
                //       HomeMenu(
                //           child: Image.asset(
                //               'assets/images/ic_menu_categories.png'),
                //           title: "Semua Kategori",
                //           onTap: () {}),

                //       // Sell
                //       HomeMenu(
                //           child: Image.asset('assets/images/ic_menu_call.png'),
                //           title: "Hubungi Kami",
                //           onTap: () {}),
                //     ],
                //   ),
                // ),

                // Banner Top
                const SizedBox(height: 15),
                controller.listBanner.isEmpty
                    // Empty Banner
                    ? Container(
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: backgroundGrey,
                        ),
                        height: 150,
                        width: Get.width,
                        child: loadingSmallCircle())

                    // If has banner
                    : Container(
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        height: 150,
                        width: Get.width,
                        child: CachedNetworkImage(
                          imageUrl: '${controller.listBanner[0].banner}',
                          fit: BoxFit.cover,
                        ),
                      ),

                // Recent Quotation
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      // Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Title
                            Text(
                              'Permintaan Terbaru',
                              style: header,
                            ),

                            // Lihat Semua
                            TextButton(
                              onPressed: () {
                                Get.toNamed(RouteName.recentQuotation);
                              },
                              child: Text(
                                'Lihat Semua',
                                style: textButtonBlue,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // List Quotation
                      Obx(
                        () => controller.quotaionLoading.value
                            ? Center(
                                child: loadingSmallCircle(),
                              )
                            : Column(
                                children: [
                                  // List Quotation
                                  SizedBox(
                                    height: 285,
                                    child: PageView.builder(
                                      itemCount:
                                          controller.splittedQuotation.length,
                                      onPageChanged: ((pageIndex) {
                                        controller.setPageQuotation(pageIndex);
                                      }),
                                      itemBuilder: ((context, index) {
                                        var data =
                                            controller.splittedQuotation[index];
                                        return Column(
                                          children: data.map((element) {
                                            return QuotationCard(
                                                quotation: element);
                                          }).toList(),
                                        );
                                      }),
                                    ),
                                  ),

                                  // Indicator
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      PageIndicator(
                                          totalPages: controller
                                              .splittedQuotation.length,
                                          currentIndex: controller
                                              .listQuotationPageIndex),
                                    ],
                                  ),
                                ],
                              ),
                      )
                    ],
                  ),
                ),

                // Latest Products
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: [
                      // Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Title
                            Text(
                              'Produk Terbaru',
                              style: header,
                            ),

                            // Lihat Semua
                            TextButton(
                              onPressed: () {
                                Get.toNamed(RouteName.search);
                              },
                              child: Text(
                                'Lihat Semua',
                                style: textButtonBlue,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // List product
                      controller.recentProductLoading.value == true
                          ? loadingSmallCircle()
                          : controller.recentProducts.isNotEmpty
                              ? MasonryGridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  itemCount:
                                      controller.recentProducts.length > 4
                                          ? 4
                                          : controller.recentProducts.length,
                                  padding: const EdgeInsets.only(
                                      left: 18, right: 18, top: 8, bottom: 12),
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 14,
                                  itemBuilder: (count, index) {
                                    return HomeProductCard(
                                      data: controller.recentProducts[index],
                                    );
                                  })
                              : Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: Text(
                                      'Tidak ada produk terbaru',
                                      style:
                                          title3.copyWith(color: neutralGrey),
                                    ),
                                  ),
                                ),
                    ],
                  ),
                ),

                // Banner Center
                controller.listBanner.isEmpty
                    // Empty Banner
                    ? Container(
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          color: backgroundGrey,
                        ),
                        height: 150,
                        width: Get.width,
                        child: loadingSmallCircle())

                    // If has banner
                    : Container(
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(),
                        height: 150,
                        width: Get.width,
                        child: CachedNetworkImage(
                          imageUrl: '${controller.listBanner[1].banner}',
                          fit: BoxFit.cover,
                        ),
                      ),

                // Spacer
                const SizedBox(
                  height: 25,
                ),

                // Recomendation Buyer
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: const [
                // Title
                // Padding(
                //   padding:
                //       const EdgeInsets.only(left: 20, right: 20, top: 24),
                //   child: Row(
                //     children: [
                //       Text("Rekomendasi Pembeli", style: header),
                //     ],
                //   ),
                // ),

                // List Recomendation
                // const SizedBox(height: 12),
                // Obx(
                //   () => controller.recomendationBuyerLoading.value
                //       ? Center(
                //           child: loadingSmallCircle(),
                //         )
                //       : Column(
                //           children: [
                //             // List Recomendation
                //             SizedBox(
                //               height: 285,
                //               child: PageView.builder(
                //                 itemCount: controller
                //                     .splittedRecomendationBuyer.length,
                //                 onPageChanged: ((pageIndex) {
                //                   controller
                //                       .setPageRecomendationBuyer(pageIndex);
                //                 }),
                //                 itemBuilder: ((context, index) {
                //                   var data = controller
                //                       .splittedRecomendationBuyer[index];
                //                   return MasonryGridView.builder(
                //                       shrinkWrap: true,
                //                       physics:
                //                           const NeverScrollableScrollPhysics(),
                //                       gridDelegate:
                //                           const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                //                               crossAxisCount: 3),
                //                       itemCount: data.length,
                //                       padding: const EdgeInsets.only(
                //                           left: 18,
                //                           right: 18,
                //                           top: 8,
                //                           bottom: 12),
                //                       itemBuilder: (count, index) {
                //                         var item = data[index];
                //                         return RecomendationItem(
                //                           image: item.imgPath,
                //                           title: item.merchantName,
                //                         );
                //                       });
                //                 }),
                //               ),
                //             ),

                //             // Indicator
                //             controller.splittedRecomendationBuyer.length <=
                //                     1
                //                 ? Container()
                //                 : Row(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.center,
                //                     children: [
                //                       PageIndicator(
                //                           totalPages: controller
                //                               .splittedRecomendationBuyer
                //                               .length,
                //                           currentIndex: controller
                //                               .recomendationBuyerPageIndex),
                //                     ],
                //                   ),
                //           ],
                //         ),
                // ),
              ],
            ),

            // Recomendation Suplier
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     // Title
            //     Padding(
            //       padding:
            //           const EdgeInsets.only(left: 20, right: 20, top: 14),
            //       child: Row(
            //         children: [
            //           Text("Rekomendasi Supplier", style: header),
            //         ],
            //       ),
            //     ),

            //     // List Recomendation
            //     const SizedBox(height: 12),
            //     Obx(
            //       () => controller.recomendationSupplierLoading.value
            //           ? Center(
            //               child: loadingSmallCircle(),
            //             )
            //           : Column(
            //               children: [
            //                 // List Recomendation
            //                 SizedBox(
            //                   height: 285,
            //                   child: PageView.builder(
            //                     itemCount: controller
            //                         .splittedRecomendationSupplier.length,
            //                     onPageChanged: ((pageIndex) {
            //                       controller.setPageRecomendationSupplier(
            //                           pageIndex);
            //                     }),
            //                     itemBuilder: ((context, index) {
            //                       var data = controller
            //                           .splittedRecomendationSupplier[index];
            //                       return MasonryGridView.builder(
            //                           shrinkWrap: true,
            //                           physics:
            //                               const NeverScrollableScrollPhysics(),
            //                           gridDelegate:
            //                               const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            //                                   crossAxisCount: 3),
            //                           itemCount: data.length,
            //                           padding: const EdgeInsets.only(
            //                               left: 18,
            //                               right: 18,
            //                               top: 8,
            //                               bottom: 12),
            //                           itemBuilder: (count, index) {
            //                             var item = data[index];
            //                             return RecomendationItem(
            //                               image: item.imgPath,
            //                               title: item.merchantName,
            //                             );
            //                           });
            //                     }),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //     ),

            //     // Indicator
            //     controller.splittedRecomendationSupplier.length <= 1
            //         ? Container()
            //         : Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               PageIndicator(
            //                   totalPages: controller
            //                       .splittedRecomendationSupplier.length,
            //                   currentIndex: controller
            //                       .recomendationSupplierPageIndex),
            //             ],
            //           ),
            //   ],
            // ),
            //   // ],
            // ),
          ),
        ),
      ),
    );
  }
}
