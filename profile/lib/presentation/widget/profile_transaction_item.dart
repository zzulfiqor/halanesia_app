import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ProfileTransactionItem extends StatelessWidget {
  const ProfileTransactionItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hasil Penjualan",
                style: secondary3Bold.copyWith(color: basic, fontSize: 14)
              ),
              const SizedBox(height: 15),
              Text("+Rp. 1.285.000",
                style: bodyText.copyWith(color: good, fontSize: 14)
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("14 Desember 2021, 14.37 WIB",
                    style: subTitle2.copyWith(color: darkGrey, fontSize: 11)
                  ),
                  Text("ECOM/20210112/092830418",
                    style: subTitle2.copyWith(color: secondary, fontSize: 11)
                  ),
                ]
              ),
              const SizedBox(height: 10),
              const Divider(
                color: neutralGrey
              )
            ],
          ),
        );
      },
    );
  }
}