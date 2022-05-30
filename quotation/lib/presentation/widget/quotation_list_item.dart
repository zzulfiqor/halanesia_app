import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:quotation/data/remote/quotation_list_response.dart';
import 'package:cached_network_image/cached_network_image.dart';


class QuotationListItem extends StatelessWidget {
  final QuotationEntity quotation;
  const QuotationListItem({Key? key, required this.quotation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          // Company & Remaining Days
          Container(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title
                Text(
                  quotation.merchant?.name ?? "Unnamed Store",
                  style: bodyText.copyWith(
                      color: secondary, fontWeight: FontWeight.bold),
                ),

                // Remaining
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: note,
                  ),
                  child: Text(
                    "Berakhir dalam ${DateTime.parse(quotation.deadline!).difference(DateTime.now()).inDays} hari",
                    style: subTitle2.copyWith(color: white),
                  ),
                ),
              ],
            ),
          ),

          // Logo & Description
          Container(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                quotation.merchant?.picture == null
                    ? Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: lightGrey.withOpacity(.3), width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.only(right: 25),
                        child: Image.asset(
                          'assets/images/no-image.png',
                          width: 65,
                          height: 65,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        height: 65,
                        width: 65,
                        margin: const EdgeInsets.only(right: 25),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: lightGrey.withOpacity(.3), width: 1),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              quotation.merchant?.picture ?? "",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                // Description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        quotation.desc!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: bodyText,
                      ),

                      // Price
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "Anggaran : ",
                            style: title2.copyWith(color: darkGrey),
                          ),
                          Text(
                            formatCurrencyWithDecimal(int.parse(quotation
                                .budget!
                                .substring(0, quotation.budget!.length - 3))),
                            style: title2.copyWith(color: green),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
