import 'package:core/data/remote/usecase.dart';
import 'package:core/entity/result.dart';
import 'package:store/data/page_size_request.dart';
import 'package:store/data/product_review_response.dart';
import 'package:store/repository/merchant_repository.dart';

class GetProductReviewUseCase
    extends UseCase<BaseResult<ProductReviewResponse>, PageSizeRequest> {
  GetProductReviewUseCase(this.repository);

  final MerchantRepository repository;

  @override
  Future<BaseResult<ProductReviewResponse>> call(PageSizeRequest params) async {
    return await repository.getProductReview(params);
  }
}
