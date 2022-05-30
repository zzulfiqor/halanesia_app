import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/data/model/select_model.dart';

class SearchController extends BaseController {

  var category = 0.obs;
  var searchOptions = <SelectModel>[].obs;
  var searchAutoComplete = <String>[].obs;

  var searchFocus = FocusNode();
  var searchController = TextEditingController();
  Timer? debounce;
  var searchText = "".obs;
  var isFocus = false.obs;

  @override
  void onInit() {
    super.onInit();

    searchOptions.value = [
      SelectModel(true, "Produk"),
      SelectModel(false, "Toko"),
      SelectModel(false, "Pengadaan"),
    ];

    searchAutoComplete.value = [
      "Search 1",
      "Search 2",
      "Search 3",
    ];

    searchFocus.addListener(onFocusChange);
    searchController.addListener(() {
      onSearchChanged();
    });
  }

  void onFocusChange() {
    isFocus.value = searchFocus.hasFocus;
  }

  onSearchChanged(){
    if(debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(
      const Duration(seconds: 1),
      (){
        if(searchText != searchController.text){
          print(searchController.text.toString());
        }
        searchText.value = searchController.text;
      }
    ); 
  }

  void setOption(int pos) {
    searchOptions.asMap().forEach((index, data) =>
      data.isSelected = pos == index
    );
    category.value = pos;
    searchOptions.refresh();
  }


  @override
  void onClose() {
    searchController.removeListener(() { onSearchChanged(); });
    searchFocus.removeListener(onFocusChange);
    searchController.dispose;
    searchFocus.dispose();
    debounce?.cancel();
    super.onClose();
  }

}