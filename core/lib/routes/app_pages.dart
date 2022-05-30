import 'package:cart/cart.dart';
import 'package:get/get.dart';
import 'package:home/home.dart';
import 'package:home/presentation/page/wishlist_page.dart';
import 'package:notification/notification.dart';
import 'package:onboarding/onboarding.dart';
import 'package:profile/profile.dart';
import 'package:quotation/quotation.dart';
import 'package:store/binding/merchant_add_product_binding.dart';
import 'package:store/store.dart';
import 'package:storefront/presentation/page/merchant_review_page.dart';
import 'package:storefront/storefront.dart';
import 'package:transaction/transaction.dart';
import '../ui/unknown_page.dart';
import 'route_name.dart';

class AppPages {
  static const initPage = RouteName.profile;

  static final unknownPage = GetPage(
    name: RouteName.unknown,
    page: () => const UnknownPage(),
  );

  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => LoginRegisterPage(),
      binding: LoginRegisterBinding(),
    ),
    GetPage(
        name: RouteName.otp,
        page: () => OtpRegisterPage(),
        binding: OTPRegisterBinding()),
    GetPage(
      name: RouteName.profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: RouteName.cart,
      page: () => const CartPage(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RouteName.cart,
      page: () => const CartPage(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RouteName.profileBank,
      page: () => const ProfileBankPage(),
      binding: ProfileBankBinding(),
    ),
    GetPage(
      name: RouteName.profileCourier,
      page: () => const ProfileCourierPage(),
      binding: ProfileCourierBinding(),
    ),
    GetPage(
      name: RouteName.profileProduct,
      page: () => const ProfileProductPage(),
      binding: ProfileProductBinding(),
    ),
    GetPage(
      name: RouteName.profileDocument,
      page: () => const ProfileDocumentPage(),
      binding: ProfileDocumentBinding(),
    ),
    GetPage(
      name: RouteName.profileBalance,
      page: () => const ProfileBalancePage(),
      binding: ProfileBalanceBinding(),
    ),
    GetPage(
      name: RouteName.profileWithdraw,
      page: () => const ProfileWithdrawPage(),
      binding: ProfileWithdrawBinding(),
    ),
    GetPage(
      name: RouteName.profileReview + '/:source',
      page: () => const ProfileReviewPage(),
      binding: ProfileReviewBinding(),
    ),
    GetPage(
      name: RouteName.profileUser,
      page: () => const ProfileUserPage(),
      binding: ProfileUserBinding(),
    ),
    GetPage(
      name: RouteName.profileUserEdit,
      page: () => const ProfileUserEditPage(),
      binding: ProfileUserEditBinding(),
    ),
    GetPage(
      name: RouteName.profileStore,
      page: () => const ProfileStorePage(),
      binding: ProfileStoreBinding(),
    ),
    GetPage(
      name: RouteName.profileStoreProfile,
      page: () => const ProfileStoreProfilePage(),
      binding: ProfileStoreProfileBinding(),
    ),
    GetPage(
      name: RouteName.profileStoreEdit,
      page: () => const ProfileStoreEditPage(),
      binding: ProfileStoreEditBinding(),
    ),
    GetPage(
      name: RouteName.profileStoreRegister,
      page: () => const ProfileStoreRegisterPage(),
      binding: ProfileStoreRegisterBinding(),
    ),
    GetPage(
        name: RouteName.storeInventory,
        page: () => const InventoryPage(),
        binding: MerchantInventoryBinding()),
    GetPage(
        name: RouteName.storeInventoryAdd,
        page: () => const InventoryAddProduct(),
        binding: MerchantAddProductBinding()),
    GetPage(
        name: RouteName.directBuy,
        page: () => const DirectBuyPage(),
        bindings: [
          CartBinding(),
          DirectBuyBinding(),
        ]),
    GetPage(
        name: RouteName.storefront + '/:id',
        page: () => StorefrontPage(),
        binding: StorefrontBinding()),
    GetPage(
      name: RouteName.storeProductDetail + '/:id',
      page: () => const ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: RouteName.storeProductReview + '/:id',
      page: () => const ProductReviewPage(),
      binding: ProductReviewBinding(),
    ),
    GetPage(
      name: RouteName.storeProductReviewImage,
      page: () => const ProductReviewImagePage(),
      binding: ProductReviewImageBinding(),
    ),
    GetPage(
      name: RouteName.storeProductReviewImageAll + '/:id',
      page: () => const ProductReviewAllImagePage(),
      binding: ProductReviewAllImageBinding(),
    ),
    GetPage(
      name: RouteName.storefrontReview + '/:id',
      page: () => const MerchantReviewPage(),
      binding: MerchantReviewBinding(),
    ),
    GetPage(
      name: RouteName.paymentWebView,
      page: () => const PaymentWebviewPage(),
      binding: PaymentWebviewBinding(),
    ),
    GetPage(
        name: RouteName.transactionList,
        page: () => const DirectBuyPage(),
        bindings: [
          CartBinding(),
          DirectBuyBinding(),
        ]),
    GetPage(
      name: RouteName.search,
      page: () => const SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: RouteName.notification,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: RouteName.createQuotation,
      page: () => const CreateQuotationPage(),
      binding: CreateQuotationBinding(),
    ),
      GetPage(
      name: RouteName.recentQuotation,
      page: () => const RecentQuotationPage(),
      binding: RecentQuotationBinding(),
    ),
    GetPage(
      name: RouteName.transactionDetail + '/:id',
      page: () => const TransactionDetailPage(),
      binding: TransactionDetailBinding(),
    ),
    GetPage(
      name: RouteName.wishlist,
      page: () => const WishlistPage(),
      binding: WishlistBinding(),
    ),
  ];
}
