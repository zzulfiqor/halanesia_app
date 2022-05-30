import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_balance_controller.dart';
import '../widget/profile_transaction_item.dart';

class ProfileBalancePage extends GetView<ProfileBalanceController> {
  const ProfileBalancePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      appBar: AppBar(
        title: const Text(
          "Saldo Saya",
          style: TextStyle(color: black
          ),
        ),
        iconTheme: const IconThemeData(
          color: black
        ),
        backgroundColor: white,
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Obx(() =>
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical:28),
                color: white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Saldo",
                      style: header.copyWith(color: basic)
                    ),
                    const SizedBox(height: 25),
                    Center(
                      child: Text(controller.balance.value,
                        style: bodyText.copyWith(color: secondary, fontSize: 25)
                      ),
                    ),
                    const SizedBox(height: 50),
                    ButtonSolidBlue(
                      text: "Tarik Saldo",
                      onPressed: (){
                        Get.toNamed(RouteName.profileWithdraw);
                      }
                    ),
                  ]
                )
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  color: white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Transaksi",
                        style: header.copyWith(color: basic)
                      ),
                      const SizedBox(height: 10),
                      const Expanded(
                        child: ProfileTransactionItem()
                      )
                    ],
                  )
                )
              )
            ],
          ),
        )
      )
    );
  }
}