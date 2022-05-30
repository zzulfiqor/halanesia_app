import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:profile/presentation/widget/profile_time.dart';
import 'package:profile/presentation/widget/profile_workhour.dart';
import '../controller/profile_store_controller.dart';
import '../widget/profile_item.dart';

class ProfileStorePage extends GetView<ProfileStoreController> {
  const ProfileStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Kelola Toko",
            style: TextStyle(color: black),
          ),
          iconTheme: const IconThemeData(color: black),
          backgroundColor: white,
        ),
        body: SafeArea(
            top: true,
            bottom: true,
            child: Column(
              children: [
                Container(
                  color: secondary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Obx(
                    () => Row(
                      children: [
                        loadImageProfile(controller.image.value, 50),
                        const SizedBox(width: 20),
                        Text(controller.name.value,
                            style: title1.copyWith(color: white)),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? Expanded(child: loadingCircle())
                      : Expanded(
                          child: ListView(
                            children: [
                              // const SizedBox(height: 20),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 20),
                              //   child: Text("Pengadaan Relevan", style: header),
                              // ),
                              // const SizedBox(height: 14),
                              // CarouselSlider(
                              //   carouselController:
                              //       controller.carouselController,
                              //   options: CarouselOptions(
                              //       height: 140,
                              //       viewportFraction: 1,
                              //       scrollDirection: Axis.horizontal,
                              //       autoPlay: true,
                              //       autoPlayInterval:
                              //           const Duration(seconds: 3),
                              //       onPageChanged: (index, reason) {
                              //         controller.currentCarousel.value = index;
                              //       }),
                              //   items: dataRequest
                              //       .map(
                              //         (e) => ProfileRequest(
                              //             name: e.name,
                              //             image: e.image,
                              //             request: e.request,
                              //             day: e.day,
                              //             price: e.price),
                              //       )
                              //       .toList(),
                              // ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children:
                              //       dataRequest.asMap().entries.map((entry) {
                              //     return Container(
                              //       width: 9.0,
                              //       height: 9.0,
                              //       margin: const EdgeInsets.symmetric(
                              //           vertical: 8.0, horizontal: 4.0),
                              //       decoration: BoxDecoration(
                              //           shape: BoxShape.circle,
                              //           color:
                              //               controller.currentCarousel.value ==
                              //                       entry.key
                              //                   ? secondary
                              //                   : neutralGrey),
                              //     );
                              //   }).toList(),
                              // ),
                              const SizedBox(height: 40),
                              ProfileItem(
                                image: "assets/images/profile_product.png",
                                title: "Daftar Produk",
                                onClicked: () {
                                  Get.toNamed(RouteName.storeInventory);
                                },
                              ),
                              // const SizedBox(height: 10),
                              // ProfileItem(
                              //   image: "assets/images/profile_transaction.png",
                              //   title: "Transaksi Toko",
                              //   onClicked: () {
                              //     Get.toNamed(RouteName.profileDocument);
                              //   },
                              // ),
                              const SizedBox(height: 10),
                              ProfileItem(
                                image: "assets/images/profile_store.png",
                                title: "Profil Toko",
                                onClicked: () {
                                  Get.toNamed(RouteName.profileStoreProfile);
                                },
                              ),
                              // const SizedBox(height: 10),
                              // ProfileItem(
                              //   image: "assets/images/profile_product_list.png",
                              //   title: "Daftar Produk yang Disediakan",
                              //   onClicked: () {
                              //     Get.toNamed(RouteName.profileProduct);
                              //   },
                              // ),
                              const SizedBox(height: 10),
                              ProfileItem(
                                image: "assets/images/profile_schedule.png",
                                title: "Atur Jadwal Toko",
                                onClicked: () {
                                  showScheduleStore(context);
                                },
                              ),
                              const SizedBox(height: 20),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      loadImageAssetSquare(
                                          controller.isOpen.value
                                              ? "assets/images/profile_status_open.png"
                                              : "assets/images/profile_status_close.png",
                                          20),
                                      const SizedBox(width: 25),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Status Toko",
                                                style: header.copyWith(
                                                    color: basic)),
                                            const SizedBox(height: 4),
                                            Text(
                                                controller.isOpen.value
                                                    ? "Buka"
                                                    : "Tutup",
                                                style: info1.copyWith(
                                                    color: basic)),
                                          ]),
                                      const SizedBox(width: 100),
                                      controller.isStatusLoading.value
                                          ? loadingSmallCircle()
                                          : FlutterSwitch(
                                              width: 30.0,
                                              height: 20.0,
                                              toggleSize: 15.0,
                                              value: controller.isOpen.value,
                                              borderRadius: 20.0,
                                              padding: 1.0,
                                              toggleColor:
                                                  controller.isOpen.value
                                                      ? secondary
                                                      : basic,
                                              switchBorder: Border.all(
                                                color: basic,
                                                width: 2.0,
                                              ),
                                              activeColor: white,
                                              inactiveColor: white,
                                              onToggle: (val) {
                                                controller.setStatus();
                                              },
                                            ),
                                    ],
                                  )),
                              const SizedBox(height: 20),
                              ProfileItem(
                                image:
                                    "assets/images/profile_transportation.png",
                                title: "Layanan Pengiriman",
                                onClicked: () {
                                  Get.toNamed(RouteName.profileCourier);
                                },
                              ),
                              // const SizedBox(height: 10),
                              // ProfileItem(
                              //   image: "assets/images/profile_review.png",
                              //   title: "Ulasan Toko",
                              //   onClicked: () {
                              //     Get.toNamed(
                              //         RouteName.profileReview + "/merchant");
                              //   },
                              // ),
                              // const SizedBox(height: 10),
                              // ProfileItem(
                              //   image: "assets/images/profile_bank.png",
                              //   title: "Akun Bank",
                              //   onClicked: () {
                              //     Get.toNamed(RouteName.profileBank);
                              //   },
                              // ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                ),
              ],
            )));
  }

  void showScheduleStore(BuildContext context) {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Obx(
          () => SingleChildScrollView(
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
                    Text("Atur Jadwal Toko",
                        style: header.copyWith(color: basic))
                  ],
                ),
                const SizedBox(height: 35),
                Text("Hari Buka Toko", style: header.copyWith(color: basic)),
                const SizedBox(height: 10),
                Row(children: [
                  Expanded(
                      child: ProfileWorkhour(
                          title: "Senin",
                          value: controller.monday.value.open!,
                          onSelect: () {
                            controller.monday.value.open =
                                !controller.monday.value.open!;
                            controller.monday.refresh();
                            // controller.setMonday(!controller.isMondayOpen.value);
                          })),
                  Expanded(
                    child: ProfileWorkhour(
                        title: "Jumat",
                        value: controller.friday.value.open!,
                        onSelect: () {
                          controller.friday.value.open =
                              !controller.friday.value.open!;
                          controller.friday.refresh();
                          // controller.setFriday(!controller.isFridayOpen.value);
                        }),
                  ),
                ]),
                Row(children: [
                  Expanded(
                      child: ProfileWorkhour(
                          title: "Selasa",
                          value: controller.tuesday.value.open!,
                          onSelect: () {
                            controller.tuesday.value.open =
                                !controller.tuesday.value.open!;
                            controller.tuesday.refresh();
                            // controller.setTuesday(!controller.isTuesdayOpen.value);
                          })),
                  Expanded(
                    child: ProfileWorkhour(
                        title: "Sabtu",
                        value: controller.saturday.value.open!,
                        onSelect: () {
                          controller.saturday.value.open =
                              !controller.saturday.value.open!;
                          controller.saturday.refresh();
                          // controller.setSaturday(!controller.isSaturdayOpen.value);
                        }),
                  ),
                ]),
                Row(children: [
                  Expanded(
                      child: ProfileWorkhour(
                          title: "Rabu",
                          value: controller.wednesday.value.open!,
                          onSelect: () {
                            controller.wednesday.value.open =
                                !controller.wednesday.value.open!;
                            controller.wednesday.refresh();
                            // controller.setWednesday(!controller.isWednesdayOpen.value);
                          })),
                  Expanded(
                    child: ProfileWorkhour(
                        title: "Minggu",
                        value: controller.sunday.value.open!,
                        onSelect: () {
                          controller.sunday.value.open =
                              !controller.sunday.value.open!;
                          controller.sunday.refresh();
                          // controller.setSunday(!controller.isSundayOpen.value);
                        }),
                  ),
                ]),
                Row(children: [
                  Expanded(
                      child: ProfileWorkhour(
                          title: "Kamis",
                          value: controller.thursday.value.open!,
                          onSelect: () {
                            controller.thursday.value.open =
                                !controller.thursday.value.open!;
                            controller.thursday.refresh();
                            // controller.setThursday(!controller.isThursdayOpen.value);
                          })),
                  Expanded(
                    child: Container(),
                  ),
                ]),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                        child: ProfileTime(
                            title: "Jam Buka",
                            time: controller.openTime.value,
                            onPressed: () {
                              controller.setTime(OPEN_TIME, context);
                            })),
                    Expanded(
                        child: ProfileTime(
                            title: "Jam Tutup",
                            time: controller.closeTime.value,
                            onPressed: () {
                              controller.setTime(CLOSE_TIME, context);
                            }))
                  ],
                ),
                const SizedBox(height: 30),
                Align(
                    alignment: Alignment.centerRight,
                    child: controller.isWorkhourLoading.value
                        ? loadingCircle()
                        : ButtonSolidBlueMedium(
                            text: "Simpan",
                            onPressed: () async {
                              controller.submitWorkhour();
                            })),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      elevation: 5.0,
      enableDrag: false,
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
