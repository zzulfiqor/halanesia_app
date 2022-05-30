import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:store/controller/product_review_controller.dart';
import 'package:store/data/product_review_response.dart';
import 'package:store/presentation/widget/review_list.dart';

class ProductReviewPage extends GetView<ProductReviewController> {

  const ProductReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          "Ulasan",
          style: TextStyle(color: black),
        ),
        iconTheme: const IconThemeData(color: black),
        backgroundColor: white,
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
              : Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: ReviewList(
                  data: controller.review,
                  onImageTap: (value){
                    Get.toNamed(RouteName.storeProductReviewImage);
                  },
                  isDetail: true,
                  onReport: (value){
                    showReviewReport(value);
                  },
                ),
              ),
          )
        )
      )
    );
  }

  void showReviewReport(ReviewItem value) {
    Get.bottomSheet( 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Get.back();
              },
              child: const Icon(Icons.close,
                color: basic,
                size: 24
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: (){
                Get.back();
                controller.commonDialog.showConfirmationDialog(
                  title: "Laporkan Ulasan Ini",
                  positiveTitle: "Laporkan",
                  negativeTitle: "Kembali",
                  positiveClick: (){
                    Get.back();
                  }
                );
              },
              child: Row(
                children: [
                  const Icon(Icons.info_outline_rounded,
                    color: basic,
                    size: 24
                  ),
                  const SizedBox(width: 21),
                  Text("Laporkan Ulasan",
                    style: header.copyWith(color: basic)
                  )
                ],
              ),
            ),
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
        )
      ),
    );
  }
}
