import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:core/entity/image_upload_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/add_product_request.dart';
import 'package:store/data/product_category_response.dart';
import 'package:store/data/product_entity.dart';
import 'package:store/usecases/get_product_category_usecase.dart';
import 'package:store/usecases/post_merchant_image_usecase.dart';
import 'package:store/usecases/put_merchant_product_usecase.dart';
import 'package:core/widget/choose_image_dialog.dart';
import 'package:image_picker/image_picker.dart';
import '../data/add_product_response.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class AddInventoryController extends BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController productName = TextEditingController();
  final TextEditingController productStock = TextEditingController();
  final TextEditingController productMinOrder = TextEditingController();
  final TextEditingController productDesc = TextEditingController();
  final TextEditingController productWeight = TextEditingController();
  final TextEditingController productDimX = TextEditingController();
  final TextEditingController productDimY = TextEditingController();
  final TextEditingController productDimZ = TextEditingController();
  final CurrencyTextInputFormatter productPrice = CurrencyTextInputFormatter(
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  late final GetProductCategoryUseCase getProductCategoryUseCase;
  late final PutMerchantProductUseCase putMerchantProductUseCase;
  late final PostMerchantImageUseCase postMerchantImageUseCase;

  final _dropdownValue = CategoryId(0, '').obs;

  CategoryId get dropdownValue => _dropdownValue.value;

  String get selected => _selected.value;

  List<CategoryId> get listType => _listType.toList();
  final _selected = ''.obs;
  final _listType = <CategoryId>[].obs;

  var categoryId = <CategoryId>[].obs;
  var selectedCategoryId = 0;

  var imagePath = "";

  final _picker = ImagePicker();

  final Map _imageMap = {1: null, 2: null, 3: null, 4: null};

  void setSelected(String value) {
    _selected.value = value;
  }

  var argument = ProductEntity(
      productId: '',
      productName: '',
      productPrice: 0,
      productStock: 0,
      productImage: []).obs;

  var imageUrlFirst = "".obs;
  var imageUrlSecond = "".obs;
  var imageUrlThird = "".obs;
  var imageUrlFourth = "".obs;

  var imageLoadingFirst = false.obs;
  var imageLoadingSecond = false.obs;
  var imageLoadingThird = false.obs;
  var imageLoadingFourth = false.obs;

  @override
  void onInit() {
    super.onInit();
    getProductCategoryUseCase = Get.find();
    putMerchantProductUseCase = Get.find();
    postMerchantImageUseCase = Get.find();
    if (Get.arguments != null) {
      argument.value = Get.arguments['product'] as ProductEntity;
      productName.text = argument.value.productName;
      productStock.text = argument.value.productStock.toString();

      // productMinOrder.text = argument.value..toString();
      // productDesc.text = argument.value.productDesc;
      // productWeight.text = argument.value.productWeight.toString();
      // productDimX.text = argument.value.productDimX.toString();
      // productDimY.text = argument.value.productDimY.toString();
      // productDimZ.text = argument.value.productDimZ.toString();
      // productPrice.text = argument.value.productPrice.toString();

      for (var i = 0; i < argument.value.productImage.length; i++) {
        switch (i) {
          case 0:
            imageUrlFirst.value = argument.value.productImage[i].imagePath;
            break;
          case 1:
            imageUrlSecond.value = argument.value.productImage[i].imagePath;
            break;
          case 2:
            imageUrlThird.value = argument.value.productImage[i].imagePath;
            break;
          case 3:
            imageUrlFourth.value = argument.value.productImage[i].imagePath;
            break;
        }
      }
    }

    initDropDownMenu();
  }

  Future<void> putMerchantCategory(AddProductRequest request) async {
    var response = await putMerchantProductUseCase(request);

    safeCallApi<AddProductResponse>(response, onSuccess: (response) async {
      commonDialog.showSavedDialog();
      await Future.delayed(
          const Duration(seconds: 1), () => Get.back(result: "changed"));
    }, onError: (code, message) {
      showCommonDialog(message);
    });
  }

  Future<void> initDropDownMenu() async {
    var response = await getProductCategoryUseCase(NoParams());
    safeCallApi<List<ProductCategoryResponse>>(response, onSuccess: (response) {
      if (response != null) {
        _listType
            .addAll(response.map((e) => CategoryId(e.id, e.name)).toList());
        categoryId.obs.value
            .addAll(response.map((e) => CategoryId(e.id, e.name)).toList());
        _dropdownValue.value = _listType.first;
        _selected.value = _listType.first.name;
        selectedCategoryId = _listType.first.id;
      }
    }, onError: (code, message) {
      showCommonDialog(message);
    });
  }

  void showImageChooser(int map) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      backgroundColor: white,
      child: Container(
        height: 200,
        width: 350,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text("Pilih Gambar",
                      style: header.copyWith(color: basic))),
              const SizedBox(height: 30),
              ChooseImageDialog(
                title: "Ambil Foto",
                image: "assets/images/camera.png",
                onClicked: () {
                  getImageCamera(map);
                  Get.back();
                },
              ),
              const SizedBox(height: 15),
              ChooseImageDialog(
                title: "Galeri Foto",
                image: "assets/images/gallery.png",
                onClicked: () {
                  getImageGallery(map);
                  Get.back();
                },
              ),
            ]),
      ),
    ));
  }

  Future<void> getImageGallery(int map) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath = pickedFile.path;
      uploadImage(map, imagePath);
    } else {
      showCommonDialog('No image selected.');
    }
  }

  Future<void> getImageCamera(int map) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imagePath = pickedFile.path;
      uploadImage(map, imagePath);
    } else {
      showCommonDialog('No image selected.');
    }
  }

  Future<void> uploadImage(int map, String image) async {
    setImageLoading(true, map);
    final response = await postMerchantImageUseCase(image);

    safeCallApi<ImageUploadResponse>(response, onSuccess: (response) {
      setImageUrl(response?.imagePath ?? '', map);
      _imageMap[map] = response?.imageId.orZero();
      setImageLoading(false, map);
    }, onError: (code, message) {
      showCommonDialog(message);
      setImageLoading(false, map);
    });
  }

  void setImageUrl(String url, int map) {
    switch (map) {
      case 1:
        imageUrlFirst.value = url;
        break;
      case 2:
        imageUrlSecond.value = url;
        break;
      case 3:
        imageUrlThird.value = url;
        break;
      case 4:
        imageUrlFourth.value = url;
        break;
    }
  }

  void setImageLoading(bool value, int map) {
    switch (map) {
      case 1:
        imageLoadingFirst.value = value;
        break;
      case 2:
        imageLoadingSecond.value = value;
        break;
      case 3:
        imageLoadingThird.value = value;
        break;
      case 4:
        imageLoadingFourth.value = value;
        break;
    }
  }

  List<int> populateImageList() {
    var imageList = <int>[];
    _imageMap.forEach((key, value) {
      if (value != null) {
        imageList.add(value);
      }
    });
    return imageList;
  }
}

class CategoryId {
  final int id;
  final String name;

  CategoryId(this.id, this.name);
}
