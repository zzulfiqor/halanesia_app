import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotation/controller/create_quotation_controller.dart';
import 'package:quotation/presentation/widget/quotation_date_picker.dart';
import 'package:quotation/presentation/widget/quotation_group_checkbox.dart';
import 'package:quotation/presentation/widget/quotation_text_field.dart';

class CreateQuotationPage extends GetView<CreateQuotationController> {
  const CreateQuotationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        title: Text(
          'Buat Permintaan',
          style: header,
        ),
        backgroundColor: white,
        iconTheme: const IconThemeData(color: black),
      ),

      // Body
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul Permintaan
                    const SizedBox(height: 35),
                    QuotationTextField(
                      title: "Judul Permintaan*",
                      hint: "Tulis judul permintaan*",
                      controller: controller.quotationTitleController,
                      onSaved: (value) {
                        controller.quotationTitle = value!;
                      },
                      validator: (value) {
                        return validateEmpty(value!, "Judul Permintaan");
                      },
                    ),

                    // Deskripsi
                    const SizedBox(height: 24),
                    QuotationTextField(
                      title: "Deskripsi*",
                      hint: "Tulis deskripsi permintaan*",
                      minLines: 3,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: controller.quotationDescriptionController,
                      onSaved: (value) {
                        controller.quotationDescription = value!;
                      },
                      validator: (value) {
                        return validateEmpty(value!, "Deskripsi");
                      },
                    ),

                    // Anggaran
                    const SizedBox(height: 24),
                    QuotationTextField(
                      title: "Anggaran*",
                      hint: "Rp.",
                      isCurrency: true,
                      minLines: 1,
                      maxLines: 1,
                      controller: controller.quotationBudgetController,
                      onSaved: (value) {
                        controller.quotationBudget = value!;
                      },
                      validator: (value) {
                        return validateEmpty(value!, "Anggaran");
                      },
                    ),

                    // Jenis Pengadaan
                    const SizedBox(height: 24),
                    QuotationGroupCheckbox(
                      title: "Jenis Pengadaan*",
                      items: const ["Pengadaan Barang", "Pengadaan Jasa"],
                      isNullable: false,
                      onChecked: (val) {
                        controller.selectedJenisPengadaan = val;
                      },
                    ),

                    // Lokasi
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Lokasi*", style: info1.copyWith(color: darkGrey)),
                        const SizedBox(height: 12),

                        // is address set
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Address Card
                            Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: lightGrey.withOpacity(.5),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 14),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Label Informasi Pengiriman
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: note,
                                    ),
                                    child: Text(
                                      "Informasi Pengiriman",
                                      style: info1.copyWith(color: white),
                                    ),
                                  ),

                                  // Alamat
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Nama Perusahaan / Penerima
                                      const SizedBox(height: 8),
                                      Text.rich(
                                        TextSpan(
                                            text: 'PT. Cakra Muda Nusantara',
                                            style: info1.copyWith(
                                              color: black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: [
                                              const TextSpan(
                                                text: ' ',
                                              ),
                                              TextSpan(
                                                text: '(089887876777)',
                                                style: info1.copyWith(
                                                  color: black,
                                                ),
                                              ),
                                            ]),
                                      ),

                                      // Detail Alamat
                                      const SizedBox(height: 8),
                                      const Text(
                                          'JL. KH. Mas Manshur, Kecamatan, Kota Administrasi Jakarta Pusat, DKI Jakarta 10110'),

                                      // Note
                                      const SizedBox(height: 8),
                                      Text.rich(
                                        TextSpan(
                                            text: 'Catatan',
                                            style: info1.copyWith(
                                              color: black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: [
                                              const TextSpan(
                                                text: ' ',
                                              ),
                                              TextSpan(
                                                text: '[Drop di pos satpam]',
                                                style: info1.copyWith(
                                                  color: black,
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Ganti Lokasi Lain
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {},
                              child: Text("Ganti Lokasi Lain",
                                  style: info1.copyWith(
                                      color: secondary,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),

                        // is address not set
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Text(
                        //       "Alamat masih kosong, lengkapi alamat sekarang !",
                        //       style: info1.copyWith(
                        //           color: secondary, fontWeight: FontWeight.w700)),
                        // ),
                      ],
                    ),

                    // Persyaratan
                    const SizedBox(height: 24),
                    QuotationGroupCheckbox(
                      title: "Persyaratan",
                      items: const [
                        "Mempunyai Izin Usaha",
                        "Bersertifikat Halal"
                      ],
                      onChecked: (val) {
                        controller.selectedPersyaratan = val;
                      },
                    ),

                    // Due Date
                    const SizedBox(height: 24),
                    QuotationDatePicker(
                      title: "Batas Waktu Permintaan*",
                      onSelected: (date) {
                        controller.batasWaktu = date;
                      },
                      selectedDate : controller.batasWaktu,
                    ),
                  ],
                ),
              ),

              // Button Create Quotation
              const SizedBox(height: 50),
              ButtonSolidBlue(
                  text: "Buat Permintaan",
                  onPressed: () {
                    controller.submitQuotation();
                  })
            ],
          ),
        ),
      )),
    );
  }
}
