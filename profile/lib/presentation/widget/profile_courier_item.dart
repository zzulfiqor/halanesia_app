import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:profile/data/response/shipping_option_response.dart';

class ProfileCourier extends StatelessWidget {

  final ShippingOptionResponse courier;
  final Function(int) onSelect;
  
  const ProfileCourier({ Key? key, required this.courier, required this.onSelect }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: const BorderRadius.all(Radius.circular(12)), 
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                courier.name ?? "-",
                style: header.copyWith(color: basic)
              ),
            ),
            const SizedBox(height: 18),
            ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: courier.options?.length ?? 0,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    onSelect(index);
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      loadImageAssetSquare(
                        courier.options?[index].isChecked ?? false
                          ? "assets/images/checkbox_checked.png"
                          : "assets/images/checkbox_unchecked.png",
                        20
                      ),
                      const SizedBox(width: 15,),
                      Expanded(
                        child: Text(
                          courier.options?[index].title ?? "-",
                          style: bodyText.copyWith(color: basic)
                        )
                      ),
                      InkWell(
                        onTap: (){
                          CommonDialog().showCourierInfo(
                            courier.options?[index].title ?? "-", 
                            courier.options?[index].desc ?? "-"
                          );
                        },
                        child: const Icon(Icons.info_outline_rounded,
                          size: 24,
                          color: neutralGrey
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child:  Divider(),
                );
              },
            ),
          ],
        ),
      )
    );
  }
}