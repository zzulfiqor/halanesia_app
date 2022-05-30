import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/search_controller.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          backgroundColor: backgroundGrey,
          appBar: AppBar(
            title: SizedBox(
              width: double.infinity,
              height: 30,
              child: TextField(
                controller: controller.searchController,
                autofocus: true,
                textAlignVertical: TextAlignVertical.center,
                style: subTitle2,
                focusNode: controller.searchFocus,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Search",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child:
                        loadImageAssetSquare("assets/images/ic_search.png", 16),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: darkGrey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: secondary,
                        width: 2.0,
                      )),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                ),
              ),
            ),
            iconTheme: const IconThemeData(color: black),
            backgroundColor: white,
            actions: controller.isFocus.value
                ? <Widget>[]
                : <Widget>[
                    InkWell(
                        child: loadImageAssetSquare(
                            "assets/images/ic_notification.png", 24),
                        onTap: () {}),
                    const SizedBox(width: 20),
                    InkWell(
                        child: loadImageAssetSquare(
                            "assets/images/ic_cart.png", 24),
                        onTap: () {}),
                    const SizedBox(width: 10),
                    IconButton(
                        icon: const Icon(Icons.favorite_outline_rounded),
                        color: basic,
                        onPressed: () {}),
                  ],
          ),
          body: SafeArea(
              top: true,
              bottom: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    // Category
                    // GridView.builder(
                    //   shrinkWrap: true,
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //       crossAxisCount: 3,
                    //       childAspectRatio: MediaQuery.of(context).size.width /
                    //           (MediaQuery.of(context).size.height / 6)),
                    //   itemCount: controller.searchOptions.length,
                    //   itemBuilder: (context, index) {
                    //     return Card(
                    //       shape: RoundedRectangleBorder(
                    //           side: BorderSide(
                    //               color:
                    //                   controller.searchOptions[index].isSelected
                    //                       ? secondary
                    //                       : neutralGrey,
                    //               width: 2.0),
                    //           borderRadius: BorderRadius.circular(15.0)),
                    //       color: Colors.white,
                    //       elevation: 0,
                    //       child: InkWell(
                    //         splashColor: secondary,
                    //         onTap: () {
                    //           controller.setOption(index);
                    //         },
                    //         child: Center(
                    //           child: Container(
                    //             margin: const EdgeInsets.symmetric(
                    //                 horizontal: 10.0),
                    //             child: Text(
                    //                 controller.searchOptions.value[index].title,
                    //                 style: title2.copyWith(
                    //                     color: controller.searchOptions
                    //                             .value[index].isSelected
                    //                         ? secondary
                    //                         : neutralGrey)),
                    //           ),
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
                    GridView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.49,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 20.0,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(RouteName.storeProductReviewImage);
                            },
                            child: Material(
                                elevation: 5,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12)),
                                        child: loadImageSquare(
                                            "https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg",
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                36)),
                                    const SizedBox(height: 10),
                                    Container(
                                      height: 35,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        "Kursi Kayu dan Kursi Plastik",
                                        style: info1.copyWith(color: basic),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        "Rp. 100.000",
                                        style: title3.copyWith(color: basic),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        "Toko Kursi",
                                        style: info1.copyWith(color: secondary),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(children: [
                                          const Icon(Icons.location_on_outlined,
                                              size: 16),
                                          const SizedBox(width: 6),
                                          Text(
                                            "Jakarta Pusat",
                                            style: subTitle3.copyWith(
                                                color: darkGrey),
                                          ),
                                        ])),
                                    const SizedBox(height: 7),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.star_rate_rounded,
                                              size: 16, color: star),
                                          const SizedBox(width: 5),
                                          Text("3/5",
                                              style: subTitle2.copyWith(
                                                  color: darkGrey)),
                                          const Spacer(),
                                          const Icon(
                                              Icons.favorite_border_rounded,
                                              size: 16,
                                              color: bad),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                  ],
                                )),
                          ),
                        );
                      },
                    ),

                    // Expanded(child: Builder(builder: (BuildContext context) {
                    //   if (controller.category.value == 1) {
                    //     return storeData;
                    //   } else if (controller.category.value == 2) {
                    //     return procurementData;
                    //   } else {
                    //     return productData;
                    //   }
                    // })),
                  ],
                ),
              ))),
    );
  }

  Widget get productData {
    return Obx(
      () => controller.isFocus.value
          ? ListView(children: [
              // Autocomplete
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: controller.searchAutoComplete.value.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(children: [
                      loadImageAssetSquare("assets/images/ic_search.png", 24),
                      const SizedBox(width: 22),
                      Text(
                        controller.searchAutoComplete.value[index],
                        style: info1.copyWith(color: basic),
                      )
                    ]),
                  );
                },
              ),

              // Recomendation
              const SizedBox(height: 10),
              Text(
                "Rekomendasi",
                style: header.copyWith(color: basic),
              ),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: controller.searchAutoComplete.value.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(children: [
                        Material(
                            elevation: 5,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                child: loadImageSquare(
                                    "https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg",
                                    40))),
                        const SizedBox(width: 13),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rekomendasi",
                                style: info1.copyWith(color: basic),
                              ),
                              Text(
                                "Rekomendasi",
                                style: title3.copyWith(color: basic),
                              ),
                            ])
                      ]),
                    );
                  },
                ),
              ),
            ])
          : // Item Products
          GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.49,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 20.0,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.storeProductReviewImage);
                    },
                    child: Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                child: loadImageSquare(
                                    "https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg",
                                    (MediaQuery.of(context).size.width / 2) -
                                        36)),
                            const SizedBox(height: 10),
                            Container(
                              height: 35,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Kursi Kayu dan Kursi Plastik",
                                style: info1.copyWith(color: basic),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Rp. 100.000",
                                style: title3.copyWith(color: basic),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Toko Kursi",
                                style: info1.copyWith(color: secondary),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(children: [
                                  const Icon(Icons.location_on_outlined,
                                      size: 16),
                                  const SizedBox(width: 6),
                                  Text(
                                    "Jakarta Pusat",
                                    style: subTitle3.copyWith(color: darkGrey),
                                  ),
                                ])),
                            const SizedBox(height: 7),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  const Icon(Icons.star_rate_rounded,
                                      size: 16, color: star),
                                  const SizedBox(width: 5),
                                  Text("3/5",
                                      style:
                                          subTitle2.copyWith(color: darkGrey)),
                                  const Spacer(),
                                  const Icon(Icons.favorite_border_rounded,
                                      size: 16, color: bad),
                                ],
                              ),
                            ),
                            const SizedBox(height: 14),
                          ],
                        )),
                  ),
                );
              },
            ),
    );
  }

  Widget get storeData {
    return Obx(() => controller.isFocus.value
        ? // Store
        ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: controller.searchAutoComplete.value.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(children: [
                  loadImageProfile(
                      "https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg",
                      40),
                  const SizedBox(width: 13),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rekomendasi",
                          style: secondary3Bold.copyWith(
                              color: basic, fontSize: 14),
                        ),
                        const SizedBox(height: 3),
                        Row(children: [
                          const Icon(Icons.location_on_outlined, size: 16),
                          const SizedBox(width: 6),
                          Text(
                            "Rekomendasi",
                            style: subTitle3.copyWith(color: darkGrey),
                          ),
                        ])
                      ])
                ]),
              );
            },
          )
        : // Item Store
        ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                height: 110,
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                child: InkWell(
                  onTap: () {},
                  child: Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 24),
                          loadImageProfile(
                              "https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg",
                              75),
                          const SizedBox(width: 30),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Pengrajin Kursi",
                                    style: header.copyWith(color: secondary)),
                                const SizedBox(height: 4),
                                Row(children: [
                                  const Icon(Icons.location_on_outlined,
                                      size: 16),
                                  const SizedBox(width: 6),
                                  Text(
                                    "Jakarta Pusat",
                                    style: subTitle3.copyWith(color: darkGrey),
                                  ),
                                ]),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    const Icon(Icons.star_rate_rounded,
                                        size: 16, color: star),
                                    const SizedBox(width: 5),
                                    Text("3/5",
                                        style: subTitle2.copyWith(
                                            color: darkGrey)),
                                  ],
                                )
                              ]),
                          const Spacer(),
                          const Icon(Icons.chevron_right_rounded,
                              size: 40, color: secondary),
                          const SizedBox(width: 24),
                        ],
                      )),
                ),
              );
            },
          ));
  }

  Widget get procurementData {
    return Obx(() => controller.isFocus.value
        ? // pengadaan
        ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: controller.searchAutoComplete.value.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(children: [
                  loadImageAssetSquare("assets/images/ic_doc.png", 24),
                  const SizedBox(width: 26),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rekomendasi",
                          style: secondary3Bold.copyWith(
                              color: basic, fontSize: 14),
                        ),
                        const SizedBox(height: 3),
                        Row(children: [
                          const Icon(Icons.location_on_outlined, size: 16),
                          const SizedBox(width: 6),
                          Text(
                            "Rekomendasi",
                            style: subTitle3.copyWith(color: darkGrey),
                          ),
                        ])
                      ])
                ]),
              );
            },
          )
        : // Item Quotation
        ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                height: 165,
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                child: InkWell(
                  onTap: () {},
                  child: Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "PT. Unilever Tbk.",
                                  style: subTitle3.copyWith(color: secondary),
                                ),
                              ),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: note,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: Text("Berakhir Dalam: 27 Hari",
                                      style: subTitle2.copyWith(color: white)))
                            ],
                          ),
                          Row(children: [
                            const Icon(Icons.location_on_outlined, size: 16),
                            const SizedBox(width: 6),
                            Text(
                              "Jakarta Pusat",
                              style: subTitle3.copyWith(color: darkGrey),
                            ),
                          ]),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              loadImageProfile(
                                  "https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg",
                                  50),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      child: Text(
                                        "Penyediaan Kursi Kantor dan Meja Kantor",
                                        style: info1.copyWith(color: basic),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "Anggaran: ",
                                            style: info1.copyWith(
                                                color: darkGrey)),
                                        TextSpan(
                                          text: formatCurrencyWithDecimal(
                                              3000000),
                                          style: info1.copyWith(color: good),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ));
  }
}
