import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/presentation/widget/profile_dropdown_bank.dart';

import '../controller/profile_bank_controller.dart';
import '../widget/profile_text_field.dart';

class ProfileBankPage extends GetView<ProfileBankController> {
  
  const ProfileBankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Akun Bank",
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
            Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      const SizedBox(height: 35),
                      Text("Akun Bank Anda",
                        style: header,
                      ),
                      const SizedBox(height: 26),
                      ProfileDropdownBank(
                        title: "Nama Bank",
                        hint: "Pilih nama bank anda",
                        isLoading: controller.isBankLoading.value,
                        selectedItem: controller.selectedBank.value,
                        items: controller.listBanks.value,
                        validator: (value) {
                          return validateEmpty(value?.bankName, "Bank");
                        },
                        onChanged: (value){
                          controller.selectedBank.value = value;
                        },
                        onSaved: (value){
                          controller.selectedBank.value = value;
                        },
                      ),
                      const SizedBox(height: 26),
                      ProfileTextField(
                        title: "Nomor Rekening",
                        hint: "Masukkan nomor rekening",
                        controller: controller.numberController,
                        keyboardType: TextInputType.number,
                        onSaved: (value){
                          controller.number.value = value!;
                        },
                        validator:(value){
                          return validateEmpty(value!, "Nomor Rekening");
                        }
                      ),
                      const SizedBox(height: 26),
                      ProfileTextField(
                        title: "Nama Pemilik Rekening",
                        hint: "Masukkan nama yg tertera pada rekening",
                        controller: controller.nameController,
                        onSaved: (value){
                          controller.name.value = value!;
                        },
                        validator:(value){
                          return validateEmpty(value!, "Nama Pemilik Rekening");
                        }
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: controller.isLoading.value
                    ? loadingCircle() 
                    : ButtonSolidBlue(
                      text: "Simpan",
                      onPressed: (){
                        controller.submit();
                      }
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          )
        )
      )
    );
  }
}