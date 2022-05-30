import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotation/controller/recent_quotation_controller.dart';
import 'package:quotation/presentation/widget/quotation_list_item.dart';

class RecentQuotationPage extends GetView<RecentQuotationController> {
  const RecentQuotationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        title: Text(
          'Permintaan Terbaru',
          style: header.copyWith(color: black),
        ),
        iconTheme: const IconThemeData(color: black),
        backgroundColor: white,
      ),

      // body
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: Obx(
            () => controller.isLoading
                ? SizedBox(
                    height: Get.height,
                    child: Center(
                      child: loadingCircle(),
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.quotationList.length,
                    padding: const EdgeInsets.only(top: 8),
                    itemBuilder: (context, index) {
                      final quotation = controller.quotationList[index];
                      return QuotationListItem(
                        quotation: quotation!,
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
