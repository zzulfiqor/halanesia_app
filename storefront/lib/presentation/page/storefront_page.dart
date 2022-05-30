import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/controller/storefront_controller.dart';
// import 'package:storefront/presentation/fragment/storefront_tabview_information.dart';
import 'package:storefront/presentation/fragment/storefront_tabview_quotation.dart';
import 'package:storefront/presentation/fragment/storefront_tabview_product.dart';
import 'package:storefront/presentation/widget/fab_to_top.dart';

class StorefrontPage extends GetView<StorefrontController> {
  StorefrontPage({Key? key}) : super(key: key);

  final List<Tab> storefrontTabs = [
    // const Tab(
    //   text: "Informasi",
    // ),
    const Tab(
      text: "Produk",
    ),
    const Tab(
      text: "Pengadaan",
    ),
  ];

  final List<Widget> storefrontTabviews = [
    // const StorefrontTabviewInformation(),
    const StorefrontTabviewProduk(),
    const StorefrontTabviewQuotation(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Temporary Appbar
      extendBodyBehindAppBar: false,
      appBar: HomeAppBar(
        onSearchChanged: (val) {},
        usebackButton: true,
      ),

      body: NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels > 0 && notification.metrics.atEdge) {
            controller.onScrollEnd(controller.storefrontTabController!.index);
          }
          return true;
        },
        child: Obx(
          () => controller.merchantDetailLoading == true
              ? loadingSmallCircle()
              : NestedScrollView(
                  controller: controller.scrollController,

                  // header
                  headerSliverBuilder: (context, _) {
                    return [
                      // Store Info
                      SliverList(
                          delegate: SliverChildListDelegate([
                        const SizedBox(height: 16),
                        // Image, Name, Location, Share Badge
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                // Photo
                                const SizedBox(width: 25),
                                Obx(() => CircleAvatar(
                                      radius: 35,
                                      backgroundImage: controller.merchantDetail
                                                  .profilePicture ==
                                              null
                                          ? Image.asset(
                                                  'assets/images/image_placeholder.png')
                                              .image
                                          : NetworkImage(
                                              controller.merchantDetail
                                                  .profilePicture!,
                                            ),
                                    )),

                                // Name & Location
                                const SizedBox(width: 25),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Name
                                    Obx(() => Text(
                                        controller.merchantDetail.name ?? "",
                                        style: title1)),

                                    // Location
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        // Icon Pin / Location
                                        Image.asset(
                                            'assets/images/storefront_location.png'),

                                        // Location Name
                                        const SizedBox(width: 8),
                                        Obx(() => Text(
                                              controller.merchantDetail.address
                                                      ?.city ??
                                                  '',
                                              style: subTitle3.copyWith(
                                                color: basic,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),

                            // Share Badge
                            GestureDetector(
                              onTap: () {
                                controller.share("www.google.com");
                              },
                              child: Container(
                                height: 25,
                                padding: const EdgeInsets.only(
                                    top: 4, bottom: 4, right: 10, left: 10),
                                decoration: const BoxDecoration(
                                  color: secondary,
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(8)),
                                ),
                                child: Image.asset(
                                  'assets/images/share.png',
                                ),
                              ),
                            )
                          ],
                        ),

                        // Rating, Jadwal, Chat
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Rating
                            InkWell(
                              onTap: () => Get.toNamed(
                                  RouteName.storefrontReview +
                                      '/${Get.parameters["id"]}',
                                  arguments: controller.merchantRating),
                              child: Row(
                                children: [
                                  // Icon
                                  const Icon(
                                    Icons.star,
                                    color: star,
                                    size: 20,
                                  ),

                                  // Value
                                  const SizedBox(width: 4),
                                  Obx(
                                    () => controller.merchantRatingLoading
                                        ? loadingSmallCircle()
                                        : Text(
                                            "${controller.merchantRating}/5",
                                            style: subTitle3.copyWith(
                                              color: basic,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                  ),

                                  // Arrow Right
                                  const Icon(
                                    Icons.keyboard_arrow_right,
                                    color: secondary,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),

                            // Jadwal
                            InkWell(
                              onTap: () {
                                CommonDialog().showDetailInfo("Jadwal Toko",
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Hari Buka
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // title
                                            Text(
                                              "Jam Buka Toko:",
                                              style: info1,
                                            ),

                                            // value
                                            Obx(() => Text(
                                                  "${controller.merchantWorkhour.startHour} WIB sampai ${controller.merchantWorkhour.endHour} WIB",
                                                  style: info1,
                                                )),
                                          ],
                                        ),

                                        // Jam Buka
                                        const SizedBox(height: 12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // title
                                            Text(
                                              "Hari Buka Toko:",
                                              style: info1,
                                            ),

                                            // value
                                            Obx(
                                              () => Row(
                                                children: controller
                                                    .merchantWorkday
                                                    .map(
                                                  (e) {
                                                    int index = controller
                                                        .merchantWorkday
                                                        .indexOf(e);
                                                    return Text(index ==
                                                            (controller
                                                                    .merchantWorkday
                                                                    .length -
                                                                1)
                                                        ? e
                                                        : "$e, ");
                                                  },
                                                ).toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ));
                              },
                              child: Obx(() => Ink(
                                    child: controller.merchantWorkdateLoading
                                        ? loadingSmallCircle()
                                        : Row(
                                            children: [
                                              // Icon
                                              Image.asset(
                                                  'assets/images/profile_schedule_black.png'),

                                              // Value
                                              const SizedBox(width: 4),
                                              Obx(
                                                () => controller
                                                            .merchantWorkhour
                                                            .startHour ==
                                                        null
                                                    ? Text(
                                                        "Toko sedang tutup",
                                                        style: info1,
                                                      )
                                                    : Text(
                                                        "${controller.merchantWorkhour.startHour} - ${controller.merchantWorkhour.endHour}",
                                                        style: info1,
                                                      ),
                                              ),
                                            ],
                                          ),
                                  )),
                            ),

                            // Chat
                            GestureDetector(
                              onTap: () {
                                // TODO : Implement Chat
                              },
                              child: Row(
                                children: [
                                  // Icon
                                  Image.asset(
                                    'assets/images/chat.png',
                                    height: 14,
                                  ),

                                  // Value
                                  const SizedBox(width: 4),
                                  Text(
                                    "Chat",
                                    style: subTitle3.copyWith(
                                      color: secondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                      ])),
                    ];
                  },

                  // body
                  body: Stack(children: [
                    Column(
                      children: [
                        // TabBar
                        TabBar(
                          unselectedLabelColor: darkGrey,
                          labelColor: secondary,
                          indicatorColor: secondary,
                          controller: controller.storefrontTabController,
                          indicatorWeight: 4,
                          tabs: storefrontTabs,
                        ),
                        Container(height: 1, color: lightGrey),

                        // TabBar View
                        Expanded(
                          child: TabBarView(
                            controller: controller.storefrontTabController,
                            children: storefrontTabviews,
                          ),
                        ),
                      ],
                    ),

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
                  ]),
                ),
        ),
      ),
    );
  }
}
