import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/data/request/quotation_list_response.dart';

class MerchantQuotationItem extends StatelessWidget {
  final QuotationEntity quotation;
  final bool isActive;

  const MerchantQuotationItem(
      {Key? key, required this.quotation, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: GestureDetector(
        onTap: () {
          // TODO : IMPLEMENT GO TO QUOTATION DETAIL
        },
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: lightGrey.withOpacity(.3), width: 1),
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 5,
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Due Date
              isActive
                  ? Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      color: note,
                      alignment: Alignment.center,
                      width: Get.width,
                      child: quotation.deadline != null ? Text(
                        "Berakhir Dalam: ${DateTime.parse(quotation.deadline!).difference(DateTime.now()).inDays} Hari",
                        style: title3.copyWith(color: white),
                      ) : const Text('Tidak ada batas waktu'),
                    )
                  : Container(),

              // Quotation Name, Budget, Desc
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      quotation.name.toString(),
                      style:
                          header.copyWith(color: isActive ? black : darkGrey),
                    ),

                    // Budget
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            "Anggaran: ",
                            style: info1.copyWith(color: darkGrey),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            quotation.budget == null
                                ? "-"
                                : formatCurrencyWithDecimal(quotation.budget!),
                            style: info1.copyWith(
                                color: isActive ? green : darkGrey),
                          ),
                        ],
                      ),
                    ),

                    // Desc
                    Text(
                      quotation.desc!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: info1.copyWith(color: isActive ? black : darkGrey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
