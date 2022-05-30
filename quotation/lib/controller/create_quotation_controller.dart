import 'package:core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateQuotationController extends BaseController {
  // key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  // Title
  final quotationTitleController = TextEditingController();
  final _quotationTitle = "".obs;
  String get quotationTitle => _quotationTitle.value;
  set quotationTitle(String value) {
    _quotationTitle.value = value;
    quotationTitleController.text = value;
  }

  // Deskripsi
  final quotationDescriptionController = TextEditingController();
  final _quotationDescription = "".obs;
  String get quotationDescription => _quotationDescription.value;
  set quotationDescription(String value) {
    _quotationDescription.value = value;
    quotationDescriptionController.text = value;
  }

  // Anggaran
  final quotationBudgetController = TextEditingController();
  final _quotationBudget = "".obs;
  String get quotationBudget => _quotationBudget.value;
  set quotationBudget(String value) {
    _quotationBudget.value = value;
    quotationBudgetController.text = value.toString();
  }

  // Jenis Pengadaan
  final _selectedJenisPengadaan = <String>[].obs;
  List<String> get selectedJenisPengadaan => _selectedJenisPengadaan;
  set selectedJenisPengadaan(List<String> value) {
    _selectedJenisPengadaan.value = value;
  }

  // Persyaratan
  final _selectedPersyaratan = <String>[].obs;
  List<String> get selectedPersyaratan => _selectedPersyaratan;
  set selectedPersyaratan(List<String> value) {
    _selectedPersyaratan.value = value;
  }

  // Batas Waktu Permintaan
  final _batasWaktu = DateTime.now().obs;
  DateTime get batasWaktu => _batasWaktu.value;
  set batasWaktu(DateTime time) {
    _batasWaktu.value = time;
  }

  // on submit
  void submitQuotation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }

    if (quotationTitle == '' &&
        quotationDescription == '' &&
        quotationBudget == '' &&
        selectedJenisPengadaan == [] &&
        batasWaktu == DateTime.now()) {
      return;
    } else {
      print(quotationBudget);
    }
  }
}
