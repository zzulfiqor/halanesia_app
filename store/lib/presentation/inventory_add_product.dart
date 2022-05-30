import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:store/controller/add_inventory_controller.dart';
import 'package:store/presentation/widget/image_upload_picker.dart';
import '../data/add_product_request.dart';

class InventoryAddProduct extends GetView<AddInventoryController> {
  const InventoryAddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tambah Produk",
            style: TextStyle(color: black),
          ),
          iconTheme: const IconThemeData(color: black),
          backgroundColor: white,
        ),
        body: SafeArea(
            child: Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 35),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Foto Produk*",
                                      style: info1.copyWith(color: darkGrey),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        controller.imageLoadingFirst.value
                                            ? const SizedBox(
                                                child:
                                                    CircularProgressIndicator(),
                                                height: 70.0,
                                                width: 70.0,
                                              )
                                            : ImageUploadPicker(
                                                imagePath: controller
                                                    .imageUrlFirst.value,
                                                onChangeClicked: () {
                                                  controller
                                                      .showImageChooser(1);
                                                }),
                                        const Padding(
                                            padding: EdgeInsets.only(left: 10)),
                                        controller.imageLoadingSecond.value
                                            ? const SizedBox(
                                                child:
                                                    CircularProgressIndicator(),
                                                height: 70.0,
                                                width: 70.0,
                                              )
                                            : ImageUploadPicker(
                                                imagePath: controller
                                                    .imageUrlSecond.value,
                                                onChangeClicked: () {
                                                  controller
                                                      .showImageChooser(2);
                                                }),
                                        const Padding(
                                            padding: EdgeInsets.only(left: 10)),
                                        controller.imageLoadingThird.value
                                            ? const SizedBox(
                                                child:
                                                    CircularProgressIndicator(),
                                                height: 70.0,
                                                width: 70.0,
                                              )
                                            : ImageUploadPicker(
                                                imagePath: controller
                                                    .imageUrlThird.value,
                                                onChangeClicked: () {
                                                  controller
                                                      .showImageChooser(3);
                                                }),
                                        const Padding(
                                            padding: EdgeInsets.only(left: 10)),
                                        controller.imageLoadingFourth.value
                                            ? const SizedBox(
                                                child:
                                                    CircularProgressIndicator(),
                                                height: 70.0,
                                                width: 70.0,
                                              )
                                            : ImageUploadPicker(
                                                imagePath: controller
                                                    .imageUrlFourth.value,
                                                onChangeClicked: () {
                                                  controller
                                                      .showImageChooser(4);
                                                })
                                      ],
                                    )
                                  ]),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Text('Nama Produk*',
                              style: info1.copyWith(color: darkGrey)),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          SizedBox(
                            height: 42,
                            child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return validateEmpty(value!, "Nama Produk");
                                },
                                controller: controller.productName,
                                autocorrect: false,
                                maxLines: 1,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: const InputDecoration(
                                  hintText: "Nama Produk",
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 11, vertical: 8),
                                )),
                          ),
                          const SizedBox(height: 20),
                          Text('Harga Produk*',
                              style: info1.copyWith(color: darkGrey)),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          SizedBox(
                            height: 42,
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return validateEmpty(value!, "Harga Produk");
                                },
                                inputFormatters: <TextInputFormatter>[
                                  controller.productPrice
                                ],
                                autocorrect: false,
                                maxLines: 1,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: const InputDecoration(
                                  hintText: "Rp. ",
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 11, vertical: 8),
                                )),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Stok Produk*",
                                          style:
                                              info1.copyWith(color: darkGrey)),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 10)),
                                      SizedBox(
                                        height: 40,
                                        child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              return validateEmpty(
                                                  value!, "Stok Produk");
                                            },
                                            controller: controller.productStock,
                                            autocorrect: false,
                                            maxLines: 1,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            decoration: const InputDecoration(
                                                hintText: "Jumlah Stok",
                                                border: OutlineInputBorder(),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 11))),
                                      )
                                    ]),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Minimum Pesanan",
                                          style:
                                              info1.copyWith(color: darkGrey)),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 10)),
                                      SizedBox(
                                        height: 40,
                                        child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              return validateEmpty(
                                                  value!, "Minimum Pesanan");
                                            },
                                            controller:
                                                controller.productMinOrder,
                                            autocorrect: false,
                                            maxLines: 1,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            decoration: const InputDecoration(
                                                hintText: "0",
                                                border: OutlineInputBorder(),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 11))),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text('Masukkan Kategori Produk*',
                              style: info1.copyWith(color: darkGrey)),
                          Obx(() => DropdownButtonFormField<CategoryId>(
                                value: controller.dropdownValue,
                                onChanged: (CategoryId? newValue) {
                                  controller.setSelected(newValue?.name ?? '');
                                  controller.selectedCategoryId =
                                      newValue?.id ?? 0;
                                  controller.update();
                                },
                                items: controller.listType.map((selectedType) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      selectedType.name,
                                    ),
                                    value: selectedType,
                                  );
                                }).toList(),
                              )),
                          const SizedBox(height: 20),
                          Text("Deskripsi Produk",
                              style: info1.copyWith(color: darkGrey)),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                return validateEmpty(
                                    value!, "Deskripsi Produk");
                              },
                              controller: controller.productDesc,
                              autocorrect: false,
                              keyboardType: TextInputType.multiline,
                              minLines: 3,
                              maxLines: null,
                              decoration: const InputDecoration(
                                hintText:
                                    "Tulis deskripsi atau informasi umum produk",
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 11, vertical: 8),
                              )),
                          const SizedBox(height: 20),
                          Text("Detail Pengiriman",
                              style: header.copyWith(color: darkGrey)),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Berat*",
                                        style: info1.copyWith(color: darkGrey)),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 10)),
                                    Row(children: [
                                      SizedBox(
                                        width: 150,
                                        height: 40,
                                        child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              return validateEmpty(
                                                  value!, "Berat");
                                            },
                                            controller:
                                                controller.productWeight,
                                            autocorrect: false,
                                            maxLines: 1,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            decoration: const InputDecoration(
                                                hintText: "Berat",
                                                border: OutlineInputBorder(),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 11))),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(left: 10)),
                                      Text('Gram',
                                          style:
                                              info1.copyWith(color: darkGrey))
                                    ])
                                  ]),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dimensi",
                                  style: info1.copyWith(color: darkGrey)),
                              const Padding(padding: EdgeInsets.only(top: 10)),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 35,
                                          height: 35,
                                          child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: (value) {
                                                return validateEmpty(
                                                    value!, "Dimensi Panjang");
                                              },
                                              controller:
                                                  controller.productDimX,
                                              autocorrect: false,
                                              maxLines: 1,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 11))),
                                        ),
                                        const Icon(Icons.close),
                                        SizedBox(
                                          width: 35,
                                          height: 35,
                                          child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: (value) {
                                                return validateEmpty(
                                                    value!, "Dimensi Lebar");
                                              },
                                              controller:
                                                  controller.productDimY,
                                              autocorrect: false,
                                              maxLines: 1,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 11))),
                                        ),
                                        const Icon(Icons.close),
                                        SizedBox(
                                          width: 35,
                                          height: 35,
                                          child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: (value) {
                                                return validateEmpty(
                                                    value!, "Dimensi Tinggi");
                                              },
                                              controller:
                                                  controller.productDimZ,
                                              autocorrect: false,
                                              maxLines: 1,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 11))),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(left: 10)),
                                        Text('Cm',
                                            style:
                                                info1.copyWith(color: darkGrey))
                                      ],
                                    )
                                  ])
                            ],
                          ),
                          const SizedBox(height: 40),
                          ButtonSolidBlue(
                              text: "Simpan",
                              onPressed: () {
                                if (controller.formKey.currentState
                                        ?.validate() ??
                                    false) {
                                  controller
                                      .putMerchantCategory(AddProductRequest(
                                    productName: controller.productName.text,
                                    productCategoryId:
                                        controller.selectedCategoryId,
                                    minOrder: int.parse(
                                        controller.productMinOrder.text),
                                    price: int.parse(controller.productPrice
                                        .getUnformattedValue()
                                        .toStringAsFixed(0)),
                                    stock:
                                        int.parse(controller.productStock.text),
                                    weight: int.parse(
                                        controller.productWeight.text),
                                    weightUnit: 'gr',
                                    dimX:
                                        int.parse(controller.productDimX.text),
                                    dimY:
                                        int.parse(controller.productDimY.text),
                                    dimZ:
                                        int.parse(controller.productDimZ.text),
                                    dimUnit: 'cm',
                                    productImage: controller.populateImageList(),
                                  ));
                                }
                              }),
                          const SizedBox(height: 20),
                        ],
                      )),
                )))));
  }
}
