import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/product_review_image_controller.dart';

class ProductReviewImagePage extends GetView<ProductReviewImageController> {
  const ProductReviewImagePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey,
      appBar: AppBar(
        title: const Text(""),
        iconTheme: const IconThemeData(color: white),
        backgroundColor: secondary,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Obx(()=>
          ListView(
            children: [
              const SizedBox(height: 40),
              Hero(
                tag: controller.imageData.value,
                child: loadImageSquare(
                  controller.imageData.value.imagePath ?? "",
                  MediaQuery.of(context).size.width
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Text(controller.imageData.value.userName ?? "no name",
                  style: info1.copyWith(color: white)
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                child: Row(
                  children: [
                    const Icon(Icons.star_rate_rounded,
                      size: 22,
                      color: star
                    ),
                    const SizedBox(width: 6),
                    Text("${controller.imageData.value.rate ?? 1}/5",
                      style: info1.copyWith(color: white)
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Text(controller.imageData.value.comment ?? "Tidak Ada Komentar",
                  style: bodyText.copyWith(color: white),
                  textAlign: TextAlign.justify,
                ),
              ),
            ]
          ),
        )
      )
    );
  }
}