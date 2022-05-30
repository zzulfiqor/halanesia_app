import 'package:core/core.dart';
import 'package:core/values/lottie_animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:transaction/controller/transaction_controller.dart';
import 'package:transaction/presentation/widget/transaction_item.dart';

class TransactionPage extends GetView<TransactionController> {
  const TransactionPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text(
          'Transaksi',
          style: TextStyle(
            color: black,
          ),
        ),
        iconTheme: const IconThemeData(color: black),
        backgroundColor: white,
        actions: [
          // Notification
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/images/ic_notification.png',
                height: 24,
                width: 24,
              ),
            ),
          ),

          // Favorite
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.favorite_outline_rounded)),
          ),
        ],
      ),

      // Body
      body: Column(
        children: [
          // Filter
          const SizedBox(height: 16),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: ["Beli", "Jual"]
                    .map((e) => GestureDetector(
                          child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: controller.selectedFilter != e
                                      ? neutralGrey
                                      : secondary,
                                  width: 2,
                                ),
                                color: white,
                              ),
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 4,
                              ),
                              child: Text(
                                e,
                                style: bodyText.copyWith(
                                  color: controller.selectedFilter != e
                                      ? neutralGrey
                                      : secondary,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          onTap: () {
                            controller.selectFilter(e);
                          },
                        ))
                    .toList(),
              ),
            ),
          ),

          // Transaction Item
          const SizedBox(height: 12),
          Expanded(
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              controller: controller.refreshController,
              onRefresh: () async {
                controller.getTransactionItem(
                    type: controller.selectedFilter == "Beli" ? "buy" : "sell");
                controller.refreshController.refreshCompleted();
              },
              child: ListView(
                children: [
                  // Transaction List
                  const SizedBox(height: 10),
                  Obx((() => controller.isTransactionLoading
                      ? SizedBox(
                          height: Get.height * .7,
                          child: Center(
                            child: loadingCircle(),
                          ),
                        )
                      : controller.transactionResponse.items!.isEmpty
                          ? SizedBox(
                              height: Get.height * .7,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Opacity(
                                      opacity: .5,
                                      child: Lottie.asset(
                                        LottieAnimations.emptyState,
                                        height: Get.height * .25,
                                        width: Get.width,
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: const Offset(0, -15),
                                      child: Text(
                                        'Belum ada transaksi',
                                        style: bodyText.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: darkGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount:
                                  controller.transactionResponse.items!.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final item = controller
                                    .transactionResponse.items![index];
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                        RouteName.transactionDetail +
                                            "/${item?.id}",
                                        arguments: controller.selectedFilter ==
                                            "Beli");
                                  },
                                  child: TransactionItem(
                                    transaction: item,
                                    isBeli: controller.selectedFilter == "Beli",
                                  ),
                                );
                              },
                            ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
