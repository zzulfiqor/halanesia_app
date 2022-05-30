import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:store/data/product_related_response.dart';

class ProductOtherList extends StatelessWidget {

  final List<RelatedItem> data;
  final Function(RelatedItem) onProductTap;

  const ProductOtherList({ Key? key, required this.data, required this.onProductTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              onProductTap(data[index]);
            },
            child: Container(
              width: 125,
              padding: const EdgeInsets.only(right: 25, bottom: 10, left: 2),
              child: Material(
                elevation: 5,
                borderRadius: const BorderRadius.all(Radius.circular(12)), 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                      child: SizedBox(
                        height: 100,
                        child: loadImageSquare(data[index].productImage ?? "", 100)
                      )
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(data[index].productTitle ?? "-",
                        style: subTitle2.copyWith(color: basic),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(formatCurrencyWithDecimal(data[index].price ?? 0),
                        style: title3.copyWith(color: basic),
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.star_rate_rounded,
                            size: 22,
                            color: star
                          ),
                          const SizedBox(width: 5),
                          Text("${data[index].rating ?? 1}/5",
                            style: subTitle2.copyWith(color: basic)
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ),
            ),
          );
        },
      ),
    );
  }
}