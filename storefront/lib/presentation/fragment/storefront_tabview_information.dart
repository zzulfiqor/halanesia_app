import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/controller/fragment_information_controller.dart';
import 'package:storefront/presentation/widget/merchant_courier_item.dart';
import 'package:storefront/presentation/widget/merchant_information_item.dart';

class StorefrontTabviewInformation
    extends GetView<FragmentInformationController> {
  const StorefrontTabviewInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 24, top: 24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Deskripsi
            Text(
              "Menjual furniture rumah tangga dengan kualitas dan harga terbaik bla bla bla bla.",
              textAlign: TextAlign.center,
              style: title3,
            ),

            // Website
            const SizedBox(height: 16),
            Center(
              child: InkWell(
                onTap: (() {
                  controller.goToWebsite("http://www.google.com");
                }),
                child: Ink(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icon
                        Image.asset(
                          'assets/images/profile_web.png',
                          height: 24,
                        ),

                        // Website
                        const SizedBox(width: 16),
                        Text("www.blueblack-crafts.com",
                            style: subTitle3.copyWith(
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Store Details
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: Get.width,
              height: 1,
              color: lightGrey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Estabilished
                  const MerchantInformationItem(
                    title: "Berdiri Sejak",
                    value: "2019",
                  ),

                  // Omset/Tahun
                  const MerchantInformationItem(
                    title: "Omset/Tahun",
                    value: "Rp. 100.000.000",
                  ),

                  // Skala Usaha
                  const MerchantInformationItem(
                    title: "Skala Usaha",
                    value: "Usaha Mikro",
                    hasInfoButton: true,
                  ),

                  // Kegiatan Usaha
                  const MerchantInformationItem(
                    title: "Kegiatan Usaha",
                    value: "Produksi & Penjualan",
                  ),

                  // Skala Produksi
                  const MerchantInformationItem(
                    title: "Skala Produksi",
                    value: "Rumah Tangga",
                    hasInfoButton: true,
                  ),
                ],
              ),
            ),

            // Layanan Pengiriman
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Title
                  Text(
                    "Layanan Pengiriman",
                    style: title3,
                  ),

                  // List Courier
                  const SizedBox(height: 24),
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) => MerchantCourierItem()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
