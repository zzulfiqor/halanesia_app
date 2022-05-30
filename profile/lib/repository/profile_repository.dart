import 'dart:io';

import 'package:core/core.dart';
import 'package:profile/data/request/merchant_bank_request.dart';
import 'package:profile/data/request/shipping_option_request.dart';
import 'package:profile/data/response/merchant_bank_data_response.dart';
import 'package:profile/data/response/merchant_bank_response.dart';
import 'package:profile/data/response/shipping_option_response.dart';
import 'package:profile/data/response/shipping_option_update_response.dart';

import '../data/request/merchant_edit_request.dart';
import '../data/request/merchant_profile_request.dart';
import '../data/request/merchant_status_request.dart';
import '../data/request/merchant_workhour_request.dart';
import '../data/request/user_address_request.dart';
import '../data/request/user_info_request.dart';
import '../data/response/merchant_info_detail_response.dart';
import '../data/response/merchant_info_response.dart';
import '../data/response/merchant_response.dart';
import '../data/response/merchant_status_response.dart';
import '../data/response/merchant_type_response.dart';
import '../data/response/merchant_workhour_response.dart';
import '../data/response/merchant_workhour_update_response.dart';
import '../data/response/shipping_area_response.dart';
import '../data/response/shipping_city_response.dart';
import '../data/response/shipping_province_response.dart';
import '../data/response/shipping_suburb_response.dart';
import '../data/response/user_address_data.dart';
import '../data/response/user_info_response.dart';
import '../datasource/profile_remote_data_source.dart';

abstract class ProfileRepository {
  // USER
  Future<BaseResult<UserInfoResponse>> getUserInfo();

  Future<BaseResult<UserInfoResponse>> putUserImageProfile(String image);

  Future<BaseResult<UserInfoResponse>> putUserProfile(UserInfoRequest request);

  Future<BaseResult<UserAddressResponse>> postUserAddress(UserAddressRequest request);

  Future<BaseResult<UserAddressResponse>> putUserAddress(UserAddressRequest request, int id);

  Future<BaseResult<List<UserAddressResponse>>> getUserListAddress();

  //MERCHANT
  Future<BaseResult<List<MerchantTypeResponse>>> getMerchantType();

  Future<BaseResult<MerchantResponse>> postMerchantImage (String image);

  Future<BaseResult<MerchantResponse>> postMerchantRegister (MerchantProfileRequest request);

  Future<BaseResult<MerchantInfoResponse>> getMerchantInfo();

  Future<BaseResult<MerchantInfoDetailResponse>> getMerchantInfoDetail();

  Future<BaseResult<MerchantResponse>> putMerchant(MerchantEditRequest request);

  Future<BaseResult<MerchantStatusResponse>> getMerchantStatus();

  Future<BaseResult<MerchantStatusResponse>> putMerchantStatus(MerchantStatusRequest request);

  Future<BaseResult<MerchantWorkhourResponse>> getMerchantWorkhour();

  Future<BaseResult<MerchantWorkhourUpdateResponse>> putMerchantWorkhour(MerchantWorkhourRequest request);

  Future<BaseResult<List<MerchantBankDataResponse>>> getMerchantBankList();

  Future<BaseResult<MerchantBankResponse>> posMerchantBank(MerchantBankRequest request);

  //SHIPPING
  Future<BaseResult<ShippingProvinceResponse>> getShippingProvince();

  Future<BaseResult<ShippingCityResponse>> getShippingCity(int id);

  Future<BaseResult<ShippingSuburbResponse>> getShippingSuburb(int id);

  Future<BaseResult<ShippingAreaResponse>> getShippingArea(int id);

  Future<BaseResult<List<ShippingOptionResponse>>> getShippingOptions();

  Future<BaseResult<ShippingOptionUpdateResponse>> putShippingOptions(ShippingOptionRequest request);
}



class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this.profileRemoteDataSource);

  final ProfileRemoteDataSource profileRemoteDataSource;

  // USER
  @override
  Future<BaseResult<UserInfoResponse>> getUserInfo() async {
    return await profileRemoteDataSource.getUserInfo();
  }

  @override
  Future<BaseResult<UserInfoResponse>> putUserImageProfile(String image) async {
    return await profileRemoteDataSource.putUserImageProfile(image);
  }

  @override
  Future<BaseResult<UserInfoResponse>> putUserProfile(UserInfoRequest request) async{
    return await profileRemoteDataSource.putUserProfile(request);
  }

  @override
  Future<BaseResult<UserAddressResponse>> postUserAddress(UserAddressRequest request) async{
    return await profileRemoteDataSource.postUserAddress(request);
  }

  @override
  Future<BaseResult<UserAddressResponse>> putUserAddress(UserAddressRequest request, int id) async{
    return await profileRemoteDataSource.putUserAddress(request, id);
  }

  @override
  Future<BaseResult<List<UserAddressResponse>>> getUserListAddress() async{
    return await profileRemoteDataSource.getUserListAddress();
  }


  // MERCHANT
  @override
  Future<BaseResult<List<MerchantTypeResponse>>> getMerchantType() async{
    return await profileRemoteDataSource.getMerchantType();
  }

  @override
  Future<BaseResult<MerchantResponse>> postMerchantImage(String image) async{
    return await profileRemoteDataSource.postMerchantImage(image);
  }

  @override
  Future<BaseResult<MerchantResponse>> postMerchantRegister(MerchantProfileRequest request) async{
    return await profileRemoteDataSource.postMerchantRegister(request);
  }

  @override
  Future<BaseResult<MerchantInfoResponse>> getMerchantInfo() async{
    return await profileRemoteDataSource.getMerchantInfo();
  }

  @override
  Future<BaseResult<MerchantInfoDetailResponse>> getMerchantInfoDetail() async{
    return await profileRemoteDataSource.getMerchantInfoDetail();
  }

  @override
  Future<BaseResult<MerchantResponse>> putMerchant(MerchantEditRequest request) async{
    return await profileRemoteDataSource.putMerchant(request);
  }

  @override
  Future<BaseResult<MerchantStatusResponse>> getMerchantStatus() async{
    return await profileRemoteDataSource.getMerchantStatus();
  }

  @override
  Future<BaseResult<MerchantStatusResponse>> putMerchantStatus(MerchantStatusRequest request) async{
    return await profileRemoteDataSource.putMerchantStatus(request);
  }

  @override
  Future<BaseResult<MerchantWorkhourResponse>> getMerchantWorkhour() async{
    return await profileRemoteDataSource.getMerchantWorkhour();
  }

  @override
  Future<BaseResult<MerchantWorkhourUpdateResponse>> putMerchantWorkhour(MerchantWorkhourRequest request) async{
    return await profileRemoteDataSource.putMerchantWorkhour(request);
  }

  @override
  Future<BaseResult<List<MerchantBankDataResponse>>> getMerchantBankList() async{
    return await profileRemoteDataSource.getMerchantBankList();
  }

  @override
  Future<BaseResult<MerchantBankResponse>> posMerchantBank(MerchantBankRequest request) async{
    return await profileRemoteDataSource.posMerchantBank(request);
  }




  // SHIPPING
  @override
  Future<BaseResult<ShippingProvinceResponse>> getShippingProvince() async{
    return await profileRemoteDataSource.getShippingProvince();
  }

  @override
  Future<BaseResult<ShippingCityResponse>> getShippingCity(int id) async{
    return await profileRemoteDataSource.getShippingCity(id);
  }

  @override
  Future<BaseResult<ShippingSuburbResponse>> getShippingSuburb(int id) async{
    return await profileRemoteDataSource.getShippingSuburb(id);
  }
  
  @override
  Future<BaseResult<ShippingAreaResponse>> getShippingArea(int id) async{
    return await profileRemoteDataSource.getShippingArea(id);
  }

  @override
  Future<BaseResult<List<ShippingOptionResponse>>> getShippingOptions() async {
    return await profileRemoteDataSource.getShippingOptions();
  }

  @override
  Future<BaseResult<ShippingOptionUpdateResponse>> putShippingOptions(ShippingOptionRequest request) async {
    return await profileRemoteDataSource.putShippingOptions(request);
  }
}
