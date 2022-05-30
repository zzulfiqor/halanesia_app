import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_store_register_controller.dart';
import '../widget/profile_dropdown_merchant_type.dart';
import '../widget/profile_text_field.dart';

class ProfileStoreRegisterPage extends GetView<ProfileStoreRegisterController> {
  
  const ProfileStoreRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pendaftaran Toko",
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
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const SizedBox(height: 35),
                    ProfileTextField(
                      title: "Nama Toko*",
                      hint: "Masukkan Nama Toko",
                      controller: controller.nameController,
                      onSaved: (value){
                        controller.name.value = value!;
                      },
                      validator:(value){
                        return validateEmpty(value!, "Nama Toko");
                      }
                    ),
                    const SizedBox(height: 35),
                    Obx(() =>
                      ProfileDropdownMerchantType(
                        title: "Jenis Usaha*",
                        hint: "Perseorangan atau Badan Usaha",
                        isLoading: controller.isTypeLoading.value,
                        selectedItem: controller.selectedTypes.value,
                        items: controller.listTypes.value,
                        validator: (value) {
                          return validateEmpty(value?.merchantTypeTitle, "Jenis Usaha");
                        },
                        onChanged: (value){
                          controller.selectedTypes.value = value;
                        },
                        onSaved: (value){
                          controller.typeId.value = value!.merchantTypeId!;
                        },
                      ),
                    ),
                    const SizedBox(height: 35),
                    ProfileTextField(
                      title: "Alamat Email*",
                      hint: "Isi Alamat Email",
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      onSaved: (value){
                        controller.email.value = value!;
                      },
                      validator:(value){
                        return validateEmail(value, "Alamat Email");
                      }
                    ),
                    const SizedBox(height: 35),
                    ProfileTextField(
                      title: "Nomor HP*",
                      hint: "Nomor HP",
                      keyboardType: TextInputType.number,
                      controller: controller.phoneController,
                      onSaved: (value){
                        controller.phone.value = value!;
                      },
                      validator:(value){
                        return validatePhone(value!, "Nomor HP");
                      }
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(() =>
                  controller.isSubmitLoading.value
                  ? loadingCircle()
                  : ButtonSolidBlue(
                    text: "Daftarkan Toko",
                    onPressed: (){
                      controller.submit();
                    }
                  ),
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