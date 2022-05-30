import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:storefront/controller/merchant_review_controller.dart';
import 'package:storefront/presentation/widget/fab_to_top.dart';
import 'package:storefront/presentation/widget/merchant_review_item.dart';

class MerchantReviewPage extends GetView<MerchantReviewController> {
  const MerchantReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        iconTheme: const IconThemeData(color: basic),
        backgroundColor: white,
        title: const Text('Ulasan Toko', style: TextStyle(color: basic)),
      ),
      body: Stack(
        children: [

          // Main
          Column(
            children: [
              Obx(() => controller.isFirstLoad
                  ? Expanded(child: Center(child: loadingCircle()))
                  : Expanded(
                      child: LazyLoadScrollView(
                        onEndOfPage: () async {
                          await controller.loadMore();
                        },
                        child: ListView.builder(
                            controller: controller.scrollController,
                            itemCount: controller.listReview.length,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  const SizedBox(height: 16),
                                  index == 0
                                      ?
                                      // Overall Rating
                                      Container(
                                          margin: const EdgeInsets.only(
                                              left: 16, right: 16, bottom: 24),
                                          child: Row(
                                            children: [
                                              // Icon Star
                                              const Icon(Icons.star,
                                                  color: star, size: 24),

                                              // From Overall Review
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Obx(() => Text(
                                                      "${controller.rating}/5 berdasarkan ${controller.totalReview} Ulasan",
                                                      style: header,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        )
                                      : MerchantReviewItem(
                                          data: controller.listReview[index]),
                                ],
                              );
                            })),
                      ),
                    ))
            ],
          ),
        
          // FAB
          // Positioned
                    Obx(() => AnimatedPositioned(
                        bottom: controller.isFabVisible ? 20 : -50,
                        right: 20,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: FabToTop(
                          onTap: () {
                            controller.backToTop();
                          },
                        )))
        ],
      ),
    );
  }
}
