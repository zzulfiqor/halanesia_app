import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:store/controller/product_review_all_image_controller.dart';

class ProductReviewAllImagePage extends GetView<ProductReviewAllImageController> {
  const ProductReviewAllImagePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey,
      appBar: AppBar(
        title: const Text("Galeri"),
        iconTheme: const IconThemeData(color: white),
        backgroundColor: secondary,
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Obx(() =>
          LazyLoadScrollView(
            onEndOfPage: () async {
              await controller.loadMore();
            },
            isLoading: controller.lastPage,
            child: 
              controller.isFirstLoad 
              ? loadingCircle()
              : GridView.builder(
                itemCount: controller.review.length,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 32.0,
                  crossAxisSpacing: 32.0,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Get.toNamed(RouteName.storeProductReviewImage, arguments: controller.review[index].toJson());
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(12)), 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: controller.review[index],
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                              child: loadImageSquare(
                                controller.review[index].imagePath ?? "", 
                                (MediaQuery.of(context).size.width/2)-40
                              )
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                const Icon(Icons.star_rate_rounded,
                                  size: 16,
                                  color: star
                                ),
                                const SizedBox(width: 5),
                                Text("${controller.review[index].rate ?? 1}/5",
                                  style: info1.copyWith(color: darkGrey)
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 14),
                        ],
                      )
                    ),
                  );
                },
              ),
          )
        )
      )
    );
  }
}