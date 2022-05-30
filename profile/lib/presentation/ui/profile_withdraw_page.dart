import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_withdraw_controller.dart';
import '../widget/profile_text_field.dart';

class ProfileWithdrawPage extends GetView<ProfileWithdrawController> {
  const ProfileWithdrawPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tarik Saldo",
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
        child: Form(
          key: controller.formKey,
          child: Obx(() =>
            ListView(
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
                      ProfileTextField(
                        title: "Jumlah Penarikan",
                        hint: "Rp. ",
                        controller: controller.withdrawController,
                        keyboardType: TextInputType.number,
                        isCurrency: true,
                        onSaved: (value){
                          controller.withdraw.value = value!;
                        },
                        validator:(value){
                          return validateEmpty(value!, "Jumlah Penarikan");
                        }
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Minimal penarikan Rp. 10.000",
                            style: subTitle2.copyWith(color: darkGrey, fontSize: 11)
                          ),
                          InkWell(
                            onTap: (){
        
                            },
                            child: Text("Tarik Semua",
                              style: textButtonBlue.copyWith(color: secondary, fontSize: 14)
                            ),
                          ),
                        ]
                      ),
                      const SizedBox(height: 50),
                      const Divider(
                        color: neutralGrey
                      ),
                      const SizedBox(height: 35),
                      Text("Akun Bank",
                        style: header.copyWith(color: basic)
                      ),
                      const SizedBox(height: 35),
                      Text(controller.bankName.value,
                        style: info1.copyWith(color: basic)
                      ),
                      const SizedBox(height: 5),
                      Text(controller.name.value,
                        style: subTitle2.copyWith(color: basic)
                      ),
                      const SizedBox(height: 5),
                      Text(controller.bankNumber.value,
                        style: secondary3Bold.copyWith(color: basic)
                      ),
                      const SizedBox(height: 100),
                      ButtonSolidBlue(
                        text: "Tarik Saldo",
                        onPressed: (){
                          controller.withdrawBalance();
                        }
                      ),
                    ]
                  )
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}