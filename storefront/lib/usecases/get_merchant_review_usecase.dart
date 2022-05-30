import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:storefront/data/request/merchant_review_response.dart';
import 'package:storefront/repository/storefront_repository.dart';

class GetMerchantReviewUseCase
    extends UseCase<BaseResult<MerchantReviewResponse>, Map<String, int>> {
  GetMerchantReviewUseCase(this.repository);

  final StorefrontRepository repository;

  @override
  Future<BaseResult<MerchantReviewResponse>> call(
      Map<String, int> params) async {
    return await repository.getMerchantReview(params['merchantId'] as int, params['page'] as int);
  }
}