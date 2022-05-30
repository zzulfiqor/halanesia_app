import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_user_edit_controller.dart';
import '../widget/profile_dropdown_location.dart';
import '../widget/profile_text_field.dart';
import '../widget/profile_text_field_disable.dart';

class ProfileUserEditPage extends GetView<ProfileUserEditController> {
  const ProfileUserEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.backFormDialog();
        return Future.value(false);
      },
      child: Scaffold(

          // Appbar
          appBar: AppBar(
            title: const Text(
              "Ubah Profil Pengguna",
              style: TextStyle(color: black),
            ),
            iconTheme: const IconThemeData(color: black),
            backgroundColor: white,
            automaticallyImplyLeading: true,
          ),

          // Body
          body: SafeArea(
              top: true,
              bottom: true,
              child: Form(
                key: controller.formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const SizedBox(height: 35),
                    ProfileTextField(
                        title: "Nama Lengkap*",
                        hint: "Nama Lengkap",
                        controller: controller.nameController,
                        onSaved: (value) {
                          controller.name.value = value!;
                        },
                        validator: (value) {
                          return validateEmpty(value!, "Nama Lengkap");
                        }),
                    const SizedBox(height: 25),
                    ProfileTextFieldDisable(
                      title: "Alamat Email",
                      hint: "Alamat Email",
                      controller: controller.emailController,
                      onSaved: (value) {
                        controller.email.value = value!;
                      },
                    ),
                    const SizedBox(height: 25),
                    ProfileTextField(
                        title: "Nomor HP*",
                        hint: "Nomor HP",
                        keyboardType: TextInputType.number,
                        controller: controller.phoneController,
                        onSaved: (value) {
                          controller.phone.value = value!;
                        },
                        validator: (value) {
                          return validatePhone(value!, "Nomor HP");
                        }),
                    const SizedBox(height: 30),
                    ProfileTextField(
                        title: "Alamat Pengiriman*",
                        hint: "Alamat Pengiriman",
                        controller: controller.addressController,
                        onSaved: (value) {
                          controller.address.value = value!;
                        },
                        validator: (value) {
                          return validateEmpty(value!, "Alamat Pengiriman");
                        }),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Expanded(
                              child: ProfileDropdownLocation(
                                title: "Provinsi*",
                                hint: "Provinsi",
                                isLoading: controller.isProvinceLoading.value,
                                selectedItem:
                                    controller.selectedProvinces.value,
                                items: controller.listProvinces,
                                validator: (value) {
                                  return validateEmpty(value?.name, "Provinsi");
                                },
                                onChanged: (value) {
                                  controller.selectedProvinces.value = value;
                                  if (value != null) {
                                    controller.getCities(value.id!);
                                  }
                                },
                                onSaved: (value) {
                                  controller.selectedProvinces.value = value;
                                },
                              ),
                            )),
                        const SizedBox(width: 20),
                        Obx(() => Expanded(
                              child: ProfileDropdownLocation(
                                title: "Kota/Kabupaten*",
                                hint: "Kota/Kabupaten",
                                isLoading: controller.isCityLoading.value,
                                selectedItem: controller.selectedCities.value,
                                items: controller.listCities.value,
                                validator: (value) {
                                  return validateEmpty(
                                      value?.name, "Kota/Kabupaten");
                                },
                                onChanged: (value) {
                                  controller.selectedCities.value = value;
                                  if (value != null) {
                                    controller.getSuburbs(value.id!);
                                  }
                                },
                                onSaved: (value) {
                                  controller.selectedCities.value = value;
                                },
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Expanded(
                              child: ProfileDropdownLocation(
                                title: "Kecamatan*",
                                hint: "Kecamatan",
                                isLoading: controller.isSuburbLoading.value,
                                selectedItem: controller.selectedSuburbs.value,
                                items: controller.listSuburbs.value,
                                validator: (value) {
                                  return validateEmpty(
                                      value?.name, "Kecamatan");
                                },
                                onChanged: (value) {
                                  controller.selectedSuburbs.value = value;
                                  if (value != null) {
                                    controller.getAreas(value.id!);
                                  }
                                },
                                onSaved: (value) {
                                  controller.selectedSuburbs.value = value;
                                },
                              ),
                            )),
                        const SizedBox(width: 20),
                        Obx(() => Expanded(
                              child: ProfileDropdownLocation(
                                title: "Desa/Kelurahan*",
                                hint: "Desa/Kelurahan",
                                isLoading: controller.isAreaLoading.value,
                                selectedItem: controller.selectedAreas.value,
                                items: controller.listAreas.value,
                                validator: (value) {
                                  return validateEmpty(
                                      value?.name, "Desa/Kelurahan");
                                },
                                onChanged: (value) {
                                  controller.selectedAreas.value = value;
                                  if (value != null) {
                                    controller.getPostCode(value);
                                  }
                                },
                                onSaved: (value) {
                                  controller.selectedAreas.value = value;
                                },
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Expanded(
                              child: ProfileDropdownLocation(
                                title: "Kode Pos*",
                                hint: "Kode Pos",
                                isPostcode: true,
                                selectedItem:
                                    controller.selectedPostcodes.value,
                                items: controller.listPostcodes.value,
                                validator: (value) {
                                  return validateEmpty(value?.name, "Kode Pos");
                                },
                                onChanged: (value) {
                                  controller.selectedPostcodes.value = value;
                                },
                                onSaved: (value) {
                                  controller.selectedPostcodes.value = value;
                                },
                              ),
                            )),
                        const SizedBox(width: 20),
                        Expanded(child: Container()),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ProfileTextField(
                        title: "Catatan Alamat",
                        hint: "Catatan tambahan acuan lokasi",
                        controller: controller.addressNoteController,
                        onSaved: (value) {
                          controller.addressNote.value = value!;
                        },
                        validator: (value) {
                          return validateEmpty(value!, "Catatan Alamat");
                        }),
                    const SizedBox(height: 80),
                    Obx(
                      () => controller.isSubmitLoading.value
                          ? loadingCircle()
                          : Row(children: [
                              Expanded(
                                child: ButtonOutlineBlue(
                                    text: "Batal",
                                    onPressed: () {
                                      controller.backFormDialog();
                                    }),
                              ),
                              const SizedBox(width: 50),
                              Expanded(
                                child: ButtonSolidBlue(
                                    text: "Simpan",
                                    onPressed: () {
                                      controller.postAddress();
                                    }),
                              ),
                            ]),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ))),
    );
  }
}
