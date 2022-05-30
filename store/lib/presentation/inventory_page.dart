import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/inventory_controller.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:store/presentation/widget/change_price_dialog.dart';
import 'package:store/presentation/widget/change_stok_dialog.dart';
import 'package:core/widget/image_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class InventoryPage extends GetView<InventoryController> {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      appBar: AppBar(
        title: const Text(
          "Daftar Produk",
          style: TextStyle(color: black),
        ),
        iconTheme: const IconThemeData(color: black),
        backgroundColor: white,
      ),
      body: Obx(() => !controller.hasProduct.value
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Ayo tambah produk dan mulai berjualan!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonSolidBlue(
                      text: "Tambah Produk",
                      onPressed: () {
                        Get.toNamed(RouteName.storeInventoryAdd);
                      }),
                ),
              ],
            )
          : Stack(
              children: [
                LazyLoadScrollView(
                    onEndOfPage: () async {
                      await controller.loadMore();
                    },
                    isLoading: controller.lastPage,
                    child: controller.isFirstLoad
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.only(bottom: 70),
                            itemCount: controller.product.length,
                            itemBuilder: (context, index) => GestureDetector(
                                  child: Card(
                                    margin: const EdgeInsets.only(
                                        left: 0, right: 0, bottom: 10),
                                    elevation: 0,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 10,
                                                    bottom: 20),
                                            leading: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                minWidth: 100,
                                                minHeight: 100,
                                                maxWidth: 100,
                                                maxHeight: 100,
                                              ),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (_) {
                                                    return ImageSlider(
                                                        imageList: controller
                                                            .product[index]
                                                            .productImage);
                                                  }));
                                                },
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.contain,
                                                  imageUrl: controller
                                                      .product[index]
                                                      .productImage[0]
                                                      .imagePath
                                                      .orEmpty(),
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                                controller
                                                    .product[index].productName,
                                                style: const TextStyle(
                                                    fontSize: 16)),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5)),
                                                Text(
                                                    formatCurrencyWithDecimal(
                                                        controller
                                                            .product[index]
                                                            .productPrice),
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: basic)),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5)),
                                                Text(
                                                    'Stok: ${controller.product[index].productStock}',
                                                    style: info1),
                                              ],
                                            )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            ButtonOutlineBlueMedium(
                                              text: 'Ubah Harga',
                                              onPressed: () {
                                                changePriceDialog(
                                                    context: context,
                                                    id: controller
                                                        .product[index]
                                                        .productId,
                                                    price: controller
                                                        .product[index]
                                                        .productPrice,
                                                    onPressed:
                                                        (String id, int price) {
                                                      controller
                                                          .updateProductPrice(
                                                              int.parse(id),
                                                              price);
                                                    });
                                              },
                                            ),
                                            const SizedBox(width: 15),
                                            ButtonOutlineBlueMedium(
                                              text: 'Ubah Stock',
                                              onPressed: () {
                                                changeStockDialog(
                                                    context,
                                                    controller.product[index]
                                                        .productId,
                                                    controller.product[index]
                                                        .productStock,
                                                    (productId, stock) {
                                                  controller.updateProductStock(
                                                      productId, stock);
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                                child: Icon(Icons.more_vert))
                                          ],
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.all(10)),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(RouteName.storeInventoryAdd,
                                        arguments: {
                                          'product': controller.product[index]
                                        });
                                  },
                                ))),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                    child: ButtonSolidBlue(
                      text: 'Tambah Produk',
                      onPressed: () async {
                        var result =
                            await Get.toNamed(RouteName.storeInventoryAdd);
                        if (result != null) {
                          controller.initialLoad();
                        }
                      },
                    ),
                  ),
                )
              ],
            )),
    );
  }
}
