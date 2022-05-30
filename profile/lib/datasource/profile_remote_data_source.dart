import 'dart:io';

import 'package:core/base/base_data_source.dart';
import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:core/data/remote/api_provider.dart';
import 'package:http_parser/http_parser.dart';
import 'package:profile/data/request/merchant_bank_request.dart';
import 'package:profile/data/request/merchant_workhour_request.dart';
import 'package:profile/data/request/shipping_option_request.dart';
import 'package:profile/data/response/merchant_bank_data_response.dart';
import 'package:profile/data/response/merchant_bank_response.dart';
import 'package:profile/data/response/merchant_status_response.dart';
import 'package:profile/data/response/shipping_option_response.dart';
import 'package:profile/data/response/shipping_option_update_response.dart';

import '../data/request/merchant_edit_request.dart';
import '../data/request/merchant_profile_request.dart';
import '../data/request/merchant_status_request.dart';
import '../data/request/user_address_request.dart';
import '../data/request/user_info_request.dart';
import '../data/response/merchant_info_detail_response.dart';
import '../data/response/merchant_info_response.dart';
import '../data/response/merchant_response.dart';
import '../data/response/merchant_type_response.dart';
import '../data/response/merchant_workhour_response.dart';
import '../data/response/merchant_workhour_update_response.dart';
import '../data/response/shipping_area_response.dart';
import '../data/response/shipping_city_response.dart';
import '../data/response/shipping_province_response.dart';
import '../data/response/shipping_suburb_response.dart';
import '../data/response/user_address_data.dart';
import '../data/response/user_info_response.dart';

class ProfileRemoteDataSource extends BaseDataSource{
  ProfileRemoteDataSource({required this.apiProvider});

  final ApiProvider apiProvider;


  // USER
  Future<BaseResult<UserInfoResponse>> getUserInfo() async {
    return getResult(apiProvider.get('user/info'),
        (response) => UserInfoResponse.fromJson(response['data']));
  }

  Future<BaseResult<UserInfoResponse>> putUserImageProfile(String image) async {
    // String fileName = image.path.split('/').last;
    // image.path
    var formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(image, filename: image.split('/').last,
      contentType: MediaType("image", "jpeg")),
    });
    return getResult(apiProvider.putFormData('user/profile', formData),
        (response) => UserInfoResponse.fromJson(response['data']));
  }

  Future<BaseResult<UserInfoResponse>> putUserProfile(UserInfoRequest request) async {
    return getResult(apiProvider.put('user/profile', request.toJson()),
        (response) => UserInfoResponse.fromJson(response['data']));
  }

  Future<BaseResult<UserAddressResponse>> postUserAddress(UserAddressRequest request) async {
    return getResult(apiProvider.post('user/address', request.toJson()),
        (response) => UserAddressResponse.fromJson(response['data']));
  }

  Future<BaseResult<UserAddressResponse>> putUserAddress(UserAddressRequest request, int id) async {
    return getResult(apiProvider.put('user/address/$id', request.toJson()),
        (response) => UserAddressResponse.fromJson(response['data']));
  }

  Future<BaseResult<List<UserAddressResponse>>> getUserListAddress() async {
    return getResult(apiProvider.get('user/address'),
        (response) => List<UserAddressResponse>.from(response["data"].map((x) => UserAddressResponse.fromJson(x))));
  }



  // MERCHANT
  Future<BaseResult<List<MerchantTypeResponse>>> getMerchantType() async {
    return getResult(apiProvider.get('merchant/type'),
        (response) => List<MerchantTypeResponse>.from(response["data"].map((x) => MerchantTypeResponse.fromJson(x))));
  }

  Future<BaseResult<MerchantResponse>> postMerchantImage (String image) async {
    var formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(image, filename: image.split('/').last,
      contentType: MediaType("image", "jpeg")),
    });
    return getResult(apiProvider.putFormData('merchant/photo', formData),
        (response) => MerchantResponse.fromJson(response['data']));
  }

  Future<BaseResult<MerchantResponse>> postMerchantRegister (MerchantProfileRequest request) async {
    return getResult(apiProvider.post('merchant', request.toJson()),
        (response) => MerchantResponse.fromJson(response['data']));
  }

  Future<BaseResult<MerchantInfoResponse>> getMerchantInfo() async {
    return getResult(apiProvider.get('merchant'),
        (response) => MerchantInfoResponse.fromJson(response['data']));
  }

  Future<BaseResult<MerchantInfoDetailResponse>> getMerchantInfoDetail() async {
    return getResult(apiProvider.get('merchant/detail'),
        (response) => MerchantInfoDetailResponse.fromJson(response['data']));
  }

  Future<BaseResult<MerchantResponse>> putMerchant(MerchantEditRequest request) async {
    return getResult(apiProvider.put('merchant', request.toJson()),
        (response) => MerchantResponse.fromJson(response['data']));
  }

  Future<BaseResult<MerchantStatusResponse>> getMerchantStatus() async {
    return getResult(apiProvider.get('merchant/status'),
        (response) => MerchantStatusResponse.fromJson(response['data']));
  }

  Future<BaseResult<MerchantStatusResponse>> putMerchantStatus(MerchantStatusRequest request) async {
    return getResult(apiProvider.put('merchant/status', request.toJson()),
        (response) => MerchantStatusResponse.fromJson(response['data']));
  }

  Future<BaseResult<MerchantWorkhourResponse>> getMerchantWorkhour() async {
    return getResult(apiProvider.get('merchant/workhour'),
        (response) => MerchantWorkhourResponse.fromJson(response['data']));
  }

  Future<BaseResult<MerchantWorkhourUpdateResponse>> putMerchantWorkhour(MerchantWorkhourRequest request) async {
    return getResult(apiProvider.put('merchant/workhour', request.toJson()),
        (response) => MerchantWorkhourUpdateResponse.fromJson(response['data']));
  }

  Future<BaseResult<List<MerchantBankDataResponse>>> getMerchantBankList() async {
    return getResult(apiProvider.get('refbank'),
        (response) => List<MerchantBankDataResponse>.from(response["data"].map((x) => MerchantBankDataResponse.fromJson(x))));
  }

  Future<BaseResult<MerchantBankResponse>> posMerchantBank(MerchantBankRequest request) async {
    return getResult(apiProvider.post('merchant/bank-account', request.toJson()),
        (response) => MerchantBankResponse.fromJson(response['data']));
  }




  // SHIPPING
  Future<BaseResult<ShippingProvinceResponse>> getShippingProvince() async {
    return getResult(apiProvider.get('shipping/provinces'),
        (response) => ShippingProvinceResponse.fromJson(response['data']));
  }

  Future<BaseResult<ShippingCityResponse>> getShippingCity(int id) async {
    return getResult(apiProvider.get('shipping/cities?province=$id'),
        (response) => ShippingCityResponse.fromJson(response['data']));
  }

  Future<BaseResult<ShippingSuburbResponse>> getShippingSuburb(int id) async {
    return getResult(apiProvider.get('shipping/suburbs?city=$id'),
        (response) => ShippingSuburbResponse.fromJson(response['data']));
  }

  Future<BaseResult<ShippingAreaResponse>> getShippingArea(int id) async {
    return getResult(apiProvider.get('shipping/areas?suburb=$id'),
        (response) => ShippingAreaResponse.fromJson(response['data']));
  }

  Future<BaseResult<List<ShippingOptionResponse>>> getShippingOptions() async {
    return getResult(apiProvider.get('shipping/options'),
        (response) => List<ShippingOptionResponse>.from(response["data"].map((x) => x == null ? ShippingOptionResponse(id: -1, name: "", options: <OptionCourier>[]) : ShippingOptionResponse.fromJson(x))));
  }

  Future<BaseResult<ShippingOptionUpdateResponse>> putShippingOptions(ShippingOptionRequest request) async {
    return getResult(apiProvider.put('shipping/options', request.toJson()),
        (response) => ShippingOptionUpdateResponse.fromJson(response['data']));
  }

}
