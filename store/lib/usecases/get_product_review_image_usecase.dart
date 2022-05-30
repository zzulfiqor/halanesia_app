import 'package:core/data/remote/usecase.dart';
import 'package:core/entity/result.dart';
import 'package:store/data/page_size_request.dart';
import 'package:store/data/product_review_image_response.dart';
import 'package:store/repository/merchant_repository.dart';

class GetProductReviewImageUseCase
    extends UseCase<BaseResult<ProductReviewImageResponse>, PageSizeRequest> {
  GetProductReviewImageUseCase(this.repository);

  final MerchantRepository repository;

  @override
  Future<BaseResult<ProductReviewImageResponse>> call(PageSizeRequest params) async {
    return await repository.getProductReviewImage(params);
  }
}
