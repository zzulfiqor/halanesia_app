import 'package:cart/datasource/cart_remote_data_source.dart';
import 'package:cart/repository/cart_repository.dart';
import 'package:core/widget/available_shipping_bottom_sheet/controller/available_shipping_bottom_sheet_controller.dart';
import 'package:core/widget/home_appbar/home_appbar_controller.dart';
import 'package:core/widget/promo_bottom_sheet/controller/promo_bottom_sheet_controller.dart';
import 'package:get/get.dart';
import 'package:home/datasource/home_data_source.dart';
import 'package:home/repository/home_repository.dart';
import 'package:onboarding/onboarding.dart';
import 'package:profile/presentation/controller/profile_controller.dart';
import 'package:profile/profile.dart';
import 'package:profile/usecase/user/get_user_info_usecase.dart';
import 'package:quotation/quotation.dart';
import 'package:store/datasource/merchant_data_source.dart';
import 'package:store/repository/merchant_repository.dart';
import 'package:storefront/datasource/storefront_remote_data_source.dart';
import 'package:storefront/repository/storefront_repository.dart';
import 'package:transaction/controller/transaction_controller.dart';
import 'package:transaction/datasource/transaction_remote_data_source.dart';
import 'package:transaction/repository/transaction_repository.dart';
import 'package:transaction/transaction.dart';
import 'package:transaction/usecases/post_transaction_accept_usecase.dart';
import '../core.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    // utils
    Get.put(ApiProvider(), permanent: true);
    Get.put(InternetConnectionChecker(), permanent: true);
    Get.put(CacheManager(), permanent: true);
    Get.put(CommonDialog(), permanent: true);
    Get.lazyPut(() => HomeAppbarController(), fenix: true);
    Get.lazyPut(() => PromoBottomSheetController(), fenix: true);
    Get.lazyPut(() => AvailableShippingBottomSheetController(), fenix: true);
    Get.lazyPut(() => HomeAppbarController(), fenix: true);

    // data source
    Get.lazyPut<StorefrontRemoteDataSource>(
        () => StorefrontRemoteDataSource(apiProvider: Get.find()),
        fenix: true);
    Get.lazyPut<ProfileRemoteDataSource>(
        () => ProfileRemoteDataSource(apiProvider: Get.find()),
        fenix: true);
    Get.lazyPut<MerchantDataSource>(() => MerchantDataSource(api: Get.find()),
        fenix: true);
    Get.lazyPut<OnBoardingRemoteDataSource>(
        () => OnBoardingRemoteDataSource(apiProvider: Get.find()),
        fenix: true);
    Get.lazyPut<HomeDataSource>(() => HomeDataSource(apiProvider: Get.find()),
        fenix: true);
    Get.lazyPut<CartRemoteDataSource>(
        () => CartRemoteDataSource(apiProvider: Get.find()),
        fenix: true);
    Get.lazyPut<TransactionRemoteDataSource>(
        () => TransactionRemoteDataSource(apiProvider: Get.find()),
        fenix: true);
    Get.lazyPut<QuotationRemoteDataSource>(
        () => QuotationRemoteDataSource(
              apiProvider: Get.find(),
            ),
        fenix: true);

    // repository
    Get.lazyPut<StorefrontRepository>(
        () => StorefrontRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<ProfileRepository>(() => ProfileRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<MerchantRepository>(() => MerchantRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<OnBoardingRepository>(
        () => OnBoardingRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<CartRepository>(() => CartRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<TransactionRepository>(
        () => TransactionRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<QuotationRepository>(() => QuotationRepositoryImpl(Get.find()),
        fenix: true);

    // Home - Profile
    Get.put(GetUserInfoUseCase(Get.find<ProfileRepository>()));
    Get.put(ProfileController());

    // Home - Transaction
    Get.put(GetTransactionListUseCase(Get.find<TransactionRepository>()));
    Get.put( PostTransactionAcceptUseCase(Get.find()));
    Get.put(TransactionController());
  }
}
