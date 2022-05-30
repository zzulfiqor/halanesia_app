import 'package:get_storage/get_storage.dart';
import 'package:profile/data/response/merchant_address_detail_response.dart';

enum CacheManagerKey {
  hasLogin,
  token,
  refreshToken,
  userName,
  userImage,
  userEmail,
  userPhone,
  hasMerchant,
  userAddress,
  userAddressNote,
  userAddressState,
  userAddressCountry,
  userAddressProvince,
  userAddressCity,
  userAddressSuburb,
  userAddressArea,
  userAddressPostalCode,
  userAddressCountryId,
  userAddressProvinceId,
  userAddressCityId,
  userAddressSuburbId,
  userAddressAreaId,
  merchantId,
  merchantName,
  merchantWeb,
  merchantDesc,
  merchantTypeId,
  merchantTypeName,
  merchantEmail,
  merchantPhone,
  merchantImage,
  merchantBanner,
  merchantIsPhysical,
  merchantStatus,
  merchantRemarkStatus,
  merchantBankAccountName,
  merchantBankAccountNumber,
  merchantBankAccountId,
  merchantBankId,
  merchantAddress,
  merchantAddressNote,
  merchantAddressCity,
  merchantAddressState,
  merchantAddressCountry,
  merchantAddressProvince,
  merchantAddressSuburb,
  merchantAddressArea,
  merchantAddressPostalCode,
  merchantAddressCountryId,
  merchantAddressProvinceId,
  merchantAddressCityId,
  merchantAddressSuburbId,
  merchantAddressAreaId,
}

class CacheManager {
  Future<bool> saveToken(
      String? token, String? refreshToken, String? tokenType) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.token.toString(), "$tokenType $token");
    await box.write(
        CacheManagerKey.refreshToken.toString(), "$tokenType $refreshToken");
    await box.write(CacheManagerKey.hasLogin.toString(), true);
    return true;
  }

  String getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.token.toString()) ?? "";
  }

  String getRefreshToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.refreshToken.toString()) ?? "";
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.token.toString());
  }

  Future<void> setLogOut() async {
    final box = GetStorage();
    await box.write(CacheManagerKey.hasLogin.toString(), false);
  }

  bool hasLogin() {
    final box = GetStorage();
    return box.read(CacheManagerKey.hasLogin.toString()) ?? false;
  }

  //PROFILE
  void saveBasicProfile(String name, String image, String email, String phone,
      bool merchant) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.userName.toString(), name);
    await box.write(CacheManagerKey.userImage.toString(), image);
    await box.write(CacheManagerKey.userEmail.toString(), email);
    await box.write(CacheManagerKey.userPhone.toString(), phone);
    await box.write(CacheManagerKey.hasMerchant.toString(), merchant);
  }

  void saveImageUserProfile(String image) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.userImage.toString(), image);
  }

  void savePhoneUser(String phone) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.userPhone.toString(), phone);
  }

  void saveAddressUser(
    String address,
    String note,
    String city,
    String state,
    String country,
    String postalCode,
    int refShipperCountryId,
    int refShipperProvinceId,
    int refShipperCityId,
    int refShipperSuburbId,
    int refShipperAreaId,
  ) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.userAddress.toString(), address);
    await box.write(CacheManagerKey.userAddressNote.toString(), note);

    await box.write(CacheManagerKey.userAddressCity.toString(), city);
    await box.write(CacheManagerKey.userAddressState.toString(), state);
    await box.write(CacheManagerKey.userAddressCountry.toString(), country);
    await box.write(
        CacheManagerKey.userAddressAreaId.toString(), refShipperAreaId);
    await box.write(
        CacheManagerKey.userAddressPostalCode.toString(), postalCode);
    await box.write(
        CacheManagerKey.userAddressCountryId.toString(), refShipperCountryId);
    await box.write(
        CacheManagerKey.userAddressProvinceId.toString(), refShipperProvinceId);
    await box.write(
        CacheManagerKey.userAddressCityId.toString(), refShipperCityId);
    await box.write(
        CacheManagerKey.userAddressSuburbId.toString(), refShipperSuburbId);
  }

  String getNameUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.userName.toString()) ?? "";
  }

  String getImageUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.userImage.toString()) ?? "";
  }

  String getEmailUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.userEmail.toString()) ?? "";
  }

  bool getHasMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.hasMerchant.toString()) ?? false;
  }

  String getPhoneUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.userPhone.toString()) ?? "";
  }

  String getAddressUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.userAddress.toString()) ?? "";
  }

  String getAddressNoteUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.userAddressNote.toString()) ?? "";
  }

  String getProvinceUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.userAddressProvince.toString()) ?? "";
  }

  int getProvinceIdUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.userAddressProvinceId.toString()) ?? 0;
  }

  String getCityUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.userAddressCity.toString()) ?? "";
  }

  int getCityIdUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.userAddressCityId.toString()) ?? 0;
  }

  String getSuburbUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.userAddressSuburb.toString()) ?? "";
  }

  int getSuburbIdUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.userAddressSuburbId.toString()) ?? 0;
  }

  int getAreaIdUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.userAddressAreaId.toString()) ?? 0;
  }

  String getPostcodeUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.userAddressPostalCode.toString()) ?? "";
  }

  //MERCHANT
  void saveMerchantId(int id) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.merchantId.toString(), id);
  }

  void saveImageMerchant(String image) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.merchantImage.toString(), image);
  }

  void saveMerchantInfo(String name, String email, String banner, int status,
      String remarkStatus, String image) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.merchantName.toString(), name);
    await box.write(CacheManagerKey.merchantEmail.toString(), email);
    await box.write(CacheManagerKey.merchantBanner.toString(), banner);
    await box.write(CacheManagerKey.merchantStatus.toString(), status);
    await box.write(
        CacheManagerKey.merchantRemarkStatus.toString(), remarkStatus);
    await box.write(CacheManagerKey.merchantImage.toString(), image);
  }

  void saveMerchantDetail(
      String name,
      int typeId,
      String typeName,
      String phone,
      String email,
      String desc,
      bool isPhysical,
      String image,
      String web) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.merchantName.toString(), name);
    await box.write(CacheManagerKey.merchantTypeId.toString(), typeId);
    await box.write(CacheManagerKey.merchantTypeName.toString(), typeName);
    await box.write(CacheManagerKey.merchantPhone.toString(), phone);
    await box.write(CacheManagerKey.merchantEmail.toString(), email);
    await box.write(CacheManagerKey.merchantDesc.toString(), desc);
    await box.write(CacheManagerKey.merchantIsPhysical.toString(), isPhysical);
    await box.write(CacheManagerKey.merchantImage.toString(), image);
    await box.write(CacheManagerKey.merchantWeb.toString(), web);
  }

  void saveMerchantStatus(int status, String remarkStatus) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.merchantStatus.toString(), status);
    await box.write(
        CacheManagerKey.merchantRemarkStatus.toString(), remarkStatus);
  }

  void saveMerchantBank(String? accountName, String? accountNo,
      int? merchantBankId, int? bankId) async {
    final box = GetStorage();
    await box.write(
        CacheManagerKey.merchantBankAccountName.toString(), accountName);
    await box.write(
        CacheManagerKey.merchantBankAccountNumber.toString(), accountNo);
    await box.write(
        CacheManagerKey.merchantBankAccountId.toString(), merchantBankId);
    await box.write(CacheManagerKey.merchantBankId.toString(), bankId);
  }

  void saveMerchantAddress(MerchantAddressDetailData address) async {
    final box = GetStorage();
    await box.write(
        CacheManagerKey.merchantAddress.toString(), address.address1);
    await box.write(
        CacheManagerKey.merchantAddressNote.toString(), address.note);
    await box.write(CacheManagerKey.merchantAddressPostalCode.toString(),
        address.postalCode);

    await box.write(CacheManagerKey.merchantAddressPostalCode.toString(),
        address.postalCode);

    await box.write(
        CacheManagerKey.merchantAddressCountry.toString(), address.country);
    await box.write(
        CacheManagerKey.merchantAddressProvince.toString(), address.province);
    await box.write(
        CacheManagerKey.merchantAddressCity.toString(), address.city);
    await box.write(
        CacheManagerKey.merchantAddressSuburb.toString(), address.suburb);
    await box.write(
        CacheManagerKey.merchantAddressArea.toString(), address.area);

    await box.write(
        CacheManagerKey.merchantAddressCountryId.toString(), address.countryId);
    await box.write(CacheManagerKey.merchantAddressProvinceId.toString(),
        address.provinceId);
    await box.write(
        CacheManagerKey.merchantAddressCityId.toString(), address.cityId);
    await box.write(
        CacheManagerKey.merchantAddressSuburbId.toString(), address.suburbId);
    await box.write(
        CacheManagerKey.merchantAddressAreaId.toString(), address.areaId);
  }

  String getNameMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantName.toString()) ?? "";
  }

  String getImageMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantImage.toString()) ?? "";
  }

  String getWebMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantWeb.toString()) ?? "";
  }

  String getDescMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantDesc.toString()) ?? "";
  }

  String getEmailMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantEmail.toString()) ?? "";
  }

  String getPhoneMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantPhone.toString()) ?? "";
  }

  int getTypeIdMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantTypeId.toString()) ?? 0;
  }

  String getTypeNameMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantTypeName.toString()) ?? "";
  }

  String getAddressMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantAddress.toString()) ?? "";
  }

  String getAddressNoteMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantAddressNote.toString()) ?? "";
  }

  String getBankAccountNameMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantBankAccountName.toString()) ?? "";
  }

  String getBankAccountNumberMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantBankAccountNumber.toString()) ?? "";
  }

  int getBankAccountIdMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantBankAccountId.toString()) ?? 0;
  }

  int getBankIdMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantBankId.toString()) ?? 0;
  }

  String getAddressProvMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantAddressProvince.toString()) ?? "";
  }

  String getAddressCityMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantAddressCity.toString()) ?? "";
  }

  String getAddressSuburbMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantAddressSuburb.toString()) ?? "";
  }

  String getAddressPostalMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantAddressPostalCode.toString()) ?? "";
  }

  int getProvinceIdMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantAddressProvinceId.toString()) ?? 0;
  }

  int getCityIdMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantAddressCityId.toString()) ?? 0;
  }

  int getSuburbIdMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantAddressSuburbId.toString()) ?? 0;
  }

  int getAreaIdMerchant() {
    final box = GetStorage();
    return box.read(CacheManagerKey.merchantAddressAreaId.toString()) ?? 0;
  }

  //clear
  void clearAll() async {
    final box = GetStorage();
    await box.erase();
  }
}
