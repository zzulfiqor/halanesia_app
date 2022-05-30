import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_product_controller.dart';
import '../widget/profile_dropdown_string.dart';
import '../widget/profile_text_field.dart';

class ProfileProductPage extends GetView<ProfileProductController> {
  const ProfileProductPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daftar Produk yang Disediakan",
            style: TextStyle(color: black),
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
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const SizedBox(height: 15),
                    ProfileDropdownString(
                      hint: "Produk",
                      selectedItem: controller.product.value,
                      items: const [
                        "Kemasan & Alat Kantor",
                      ],
                      validator: (value) {
                        return validateEmpty(value, "Produk");
                      },
                      onSaved: (value){
                        controller.product.value = value!;
                      },
                    ),
                    ProfileTextField(
                      hint: "Tulis deskripsi produk",
                      controller: controller.productDescController,
                      keyboardType: TextInputType.multiline,
                      minLines: 3,
                      maxLines: null,
                      onSaved: (value){
                        controller.productDesc.value = value!;
                      },
                      validator:(value){
                        return validateEmpty(value!, "Deskripsi Produk");
                      }
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ButtonOutlineBlueSmall(
                        width: 100,
                        text: "Hapus",
                        onPressed: () async {
                        }
                      )
                    ),
                    const SizedBox(height: 50),
                    ProfileDropdownString(
                      title: "Kategori*",
                      hint: "Pilih kategori yang sesuai",
                      selectedItem: controller.category.value,
                      items: const [
                        "Kemasan & Alat Kantor",
                      ],
                      validator: (value) {
                        return validateEmpty(value, "Kategori");
                      },
                      onSaved: (value){
                        controller.category.value = value!;
                      },
                    ),
                    const SizedBox(height: 30),
                    ProfileTextField(
                      title: "Daftar Barang Sesuai Kategori",
                      hint: "Tulis daftar barang sesuai kategori yang dipilih",
                      controller: controller.categoryDescController,
                      keyboardType: TextInputType.multiline,
                      minLines: 3,
                      maxLines: null,
                      onSaved: (value){
                        controller.categoryDesc.value = value!;
                      },
                      validator:(value){
                        return validateEmpty(value!, "Deskripsi Kategori");
                      }
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ButtonSolidBlueSmall(
                        width: 100,
                        text: "Tambah",
                        onPressed: () async {
                        }
                      )
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonSolidBlue(
                  text: "Simpan",
                  onPressed: (){
                    controller.submit();
                  }
                ),
              ),
              const SizedBox(height: 50),
            ],
          )
        )
      )
    );
  }
}